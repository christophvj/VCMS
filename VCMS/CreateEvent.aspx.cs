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

        private string connectionString = @"Data Source=LUAN;Initial Catalog=VCMS_DB;Integrated Security=True;TrustServerCertificate=True";

        private void PopulateBeneficiaryDropDown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
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
                    // Handle exception (log it, show message, etc.)
                    lblBenmseg.Text = "Error loading beneficiaries: " + ex.Message;
                    lblBenmseg.ForeColor = System.Drawing.Color.Red;
                    lblBenmseg.Visible = true;
                }
            }
        }

        protected void btnSaveEvent_Click(object sender, EventArgs e)
        {
            int selectedBeneficiaryId = Convert.ToInt32(BeneficiaryDropDown.SelectedValue);
            string eventName = BeneficiaryDropDown.SelectedItem.Text;
            string description = txtDescription.Text;
            string location = txtLocation.Text;
            DateTime startDate = cldrStartDate.SelectedDate;
            DateTime endDate = cldrEndDate.SelectedDate;

            //// Beneficiary Id moet nog gestoor word in die session, glo nie is nodig nie, moet seker maak

            if (selectedBeneficiaryId == 0) // Moet hierdie nog verander word na beneficiary id

            {
                Response.Write("<script>alert('Please select a beneficiary.');</script>");
                return;
            }
            if (string.IsNullOrWhiteSpace(description) || string.IsNullOrWhiteSpace(location))
            {
                Response.Write("<script>alert('Please fill in all required fields.');</script>");
                return;
            }

            string insertQuery = "INSERT INTO Event (Name, Description, Location, StartDate, EndDate) " +
                                 "VALUES (@Name, @Description, @Location, @StartDate, @EndDate)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@Name", eventName);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@Location", location);
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@EndDate", endDate);
                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            //ClearInputFields();
                            string message = "Event created successfully!";
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
                            //lblSaveMSg.Text = "Event created successfully!";
                            Response.Write("<script>alert('Event created successfully!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Error creating event. Please try again.');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exception (log it, show message, etc.)
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");//Server side problems like sql not connecting and stuff will be shown here and sql query problems
                        lblSaveMSg.Text = "Event create failed!";
                    }
                } // Laaste toets was successful, Toets data is as ID 4 by Events
            }
;
        }
    }
}