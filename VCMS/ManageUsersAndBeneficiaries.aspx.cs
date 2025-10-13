using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class ManageUsersAndBeneficiaries : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.GridView gvUsers;
        protected global::System.Web.UI.WebControls.GridView gvBeneficiaries;
        protected global::System.Web.UI.WebControls.TextBox txtBeneficiaryName;
        protected global::System.Web.UI.WebControls.TextBox txtAmountReceived;

        //Connection string
        private DataBaseControls db = new DataBaseControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
                LoadBeneficiaries();
            }
        }

        //Load Users into GridView
        private void LoadUsers()
        {
            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT UserID, Name, Surname, Email FROM Users", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        //Load Beneficiaries into GridView
        private void LoadBeneficiaries()
        {
            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT BeneficiaryID, Name, AmountReceived FROM Beneficiary", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBeneficiaries.DataSource = dt;
                gvBeneficiaries.DataBind();
            }
        }

        //Add New User
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }

        //Delete User from GridView
        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                string query = "DELETE FROM Users WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadUsers();
        }

        //Add New Beneficiary
        protected void btnAddBeneficiary_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                string query = "INSERT INTO Beneficiary (Name, AmountReceived) VALUES (@Name, @AmountReceived)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtBeneficiaryName.Text);

                decimal amount;
                if (!decimal.TryParse(txtAmountReceived.Text, out amount))
                {
                    Response.Write("<script>alert('Please enter a valid amount for Amount Received.');</script>");
                    return;
                }
                cmd.Parameters.AddWithValue("@AmountReceived", amount);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadBeneficiaries();
            txtAmountReceived.Text = string.Empty;
            txtBeneficiaryName.Text = string.Empty;
        }

        //Delete Beneficiary
        protected void gvBeneficiaries_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int beneficiaryId = Convert.ToInt32(gvBeneficiaries.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                con.Open();

                // 1. Get all EventIDs and their EndDates for this Beneficiary
                var futureEventIds = new List<int>();
                var pastEventIds = new List<int>();
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT e.EventID, e.EndDate
                      FROM Event e
                      INNER JOIN Beneficiary_On_Event boe ON e.EventID = boe.EventID
                      WHERE boe.BeneficiaryID = @BeneficiaryID", con))
                {
                    cmd.Parameters.AddWithValue("@BeneficiaryID", beneficiaryId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int eventId = reader.GetInt32(0);
                            DateTime endDate = reader.GetDateTime(1);
                            if (endDate > DateTime.Now)
                                futureEventIds.Add(eventId);
                            else
                                pastEventIds.Add(eventId);
                        }
                    }
                }

                // 2. Delete Beneficiary_On_Event and Event for future events
                foreach (var eventId in futureEventIds)
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Beneficiary_On_Event WHERE EventID = @EventID AND BeneficiaryID = @BeneficiaryID", con))
                    {
                        cmd.Parameters.AddWithValue("@EventID", eventId);
                        cmd.Parameters.AddWithValue("@BeneficiaryID", beneficiaryId);
                        cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Event WHERE EventID = @EventID", con))
                    {
                        cmd.Parameters.AddWithValue("@EventID", eventId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // 3. Mark past events as read-only
                foreach (var eventId in pastEventIds)
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Event SET IsReadOnly = 1 WHERE EventID = @EventID", con))
                    {
                        cmd.Parameters.AddWithValue("@EventID", eventId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // 4. Delete the beneficiary
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Beneficiary WHERE BeneficiaryID = @BeneficiaryID", con))
                {
                    cmd.Parameters.AddWithValue("@BeneficiaryID", beneficiaryId);
                    cmd.ExecuteNonQuery();
                }

                con.Close();
            }

            LoadBeneficiaries();
        }
    }
}