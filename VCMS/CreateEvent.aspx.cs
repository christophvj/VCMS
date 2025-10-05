using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class CreateEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateBeneficiaryDropDown();
            }
        }

        private DataBaseControls db = new DataBaseControls();
        //private string db.connectionString = @"Data Source=LUAN;Initial Catalog=VCMS_DB;Integrated Security=True;TrustServerCertificate=True";

        private void PopulateBeneficiaryDropDown()
        {
            using (SqlConnection connection = new SqlConnection(db.connectionString))
            {
                string query = "SELECT BeneficiaryID, Name FROM Beneficiary";
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    BeneficiaryDropDown.Items.Clear();
                    BeneficiaryDropDown.Items.Add(new ListItem("-- Select Beneficiary --", "")); // Default item
                    while (reader.Read())
                    {
                        string beneficiaryName = reader["Name"].ToString();
                        string beneficiaryId = reader["BeneficiaryID"].ToString();
                        BeneficiaryDropDown.Items.Add(new ListItem(beneficiaryName, beneficiaryId));
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblBenmseg.Text = "Error loading beneficiaries: " + ex.Message;
                    lblBenmseg.ForeColor = System.Drawing.Color.Red;
                    lblBenmseg.Visible = true;
                }
            }
        }

        protected void btnSaveEvent_Click(object sender, EventArgs e)
        {
            int selectedBeneficiaryId = Convert.ToInt32(BeneficiaryDropDown.SelectedValue);
            string eventName = txtEventName.Text;
            string description = txtDescription.Text;
            string location = txtLocation.Text;
            DateTime startDate = cldrStartDate.SelectedDate;
            DateTime endDate = cldrEndDate.SelectedDate;

            //// Beneficiary Id moet nog gestoor word in die session, glo nie is nodig nie, moet seker maak

            if (string.IsNullOrEmpty(BeneficiaryDropDown.SelectedValue))
            {
                Response.Write("<script>alert('Please select a beneficiary.');</script>");
                return;
            }
            if (string.IsNullOrWhiteSpace(description) || string.IsNullOrWhiteSpace(location))
            {
                Response.Write("<script>alert('Please fill in all required fields.');</script>");
                return;
            }

            try
            {   //Store event information in Event table
                string insertQuery = "INSERT INTO Event (Name, Description, Location, StartDate, EndDate) OUTPUT INSERTED.EVENTID " +
                     "VALUES (@Name, @Description, @Location, @StartDate, @EndDate); ";//Capture die nuwe Event ID wat gegenerate is deur die table se auto-increment -> Verwys na: newEventId = (int)command.ExecuteScalar(
                int newEventId;
                //Connection
                using (SqlConnection connection = new SqlConnection(db.connectionString))
                {
                    connection.Open();
                    //Command
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Name", eventName);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@Location", location);
                        command.Parameters.AddWithValue("@StartDate", startDate);
                        command.Parameters.AddWithValue("@EndDate", endDate);

                        newEventId = (int)command.ExecuteScalar(); // Kry die EventID van die nuwe event
                    }

                    string insertEventBeneficiaryQuery = "INSERT INTO Beneficiary_On_Event (EventID, BeneficiaryID) " +
                        "VALUES (@EventID, @BeneficiaryID);";
                    using (SqlCommand command = new SqlCommand(insertEventBeneficiaryQuery, connection))
                    {
                        command.Parameters.AddWithValue("@EventID", newEventId);
                        command.Parameters.AddWithValue("@BeneficiaryID", selectedBeneficiaryId);
                        command.ExecuteNonQuery();
                        Response.Write("<script>alert('Event created successfully.');</script>");
                        Response.Redirect("MaintainEvents.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error creating event.');</script>" + ex.ToString());
                return;
            }
        }
    }
}