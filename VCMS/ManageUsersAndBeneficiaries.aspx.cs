using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        // Connection string
        private DataBaseControls db = new DataBaseControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
                LoadBeneficiaries();
            }
        }

        // Load Users into GridView
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

        // Load Beneficiaries into GridView
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

        // Add New User
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }

        // Delete User from GridView
        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                con.Open();

                // Delete dependent rows first
                string[] deleteQueries = {
                    "DELETE FROM User_On_Event WHERE UserID = @UserID",
                    "DELETE FROM Skill_On_User WHERE UserID = @UserID",
                    "DELETE FROM User_Role WHERE UserID = @UserID",
                    "DELETE FROM Donation WHERE UserID = @UserID",
                    "DELETE FROM Users WHERE UserID = @UserID"
                };

                foreach (string query in deleteQueries)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        cmd.ExecuteNonQuery();
                    }
                }

                con.Close();
            }

            LoadUsers();
        }

        // Add New Beneficiary
        protected void btnAddBeneficiary_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                string query = "INSERT INTO Beneficiary (Name, AmountReceived) VALUES (@Name, @AmountReceived)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtBeneficiaryName.Text);

                if (!decimal.TryParse(txtAmountReceived.Text, out decimal amount))
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

        // Delete Beneficiary
        protected void gvBeneficiaries_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int beneficiaryId = Convert.ToInt32(gvBeneficiaries.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                con.Open();

                // 1. Get all EventIDs for this Beneficiary
                var eventIds = new List<int>();
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT EventID FROM Beneficiary_On_Event WHERE BeneficiaryID = @BeneficiaryID", con))
                {
                    cmd.Parameters.AddWithValue("@BeneficiaryID", beneficiaryId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            eventIds.Add(reader.GetInt32(0));
                        }
                    }
                }

                // 2. Delete from Beneficiary_On_Event first
                using (SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Beneficiary_On_Event WHERE BeneficiaryID = @BeneficiaryID", con))
                {
                    cmd.Parameters.AddWithValue("@BeneficiaryID", beneficiaryId);
                    cmd.ExecuteNonQuery();
                }

                // 3. Optionally delete future events if no other beneficiaries
                foreach (var eventId in eventIds)
                {
                    using (SqlCommand checkCmd = new SqlCommand(
                        "SELECT COUNT(*) FROM Beneficiary_On_Event WHERE EventID = @EventID", con))
                    {
                        checkCmd.Parameters.AddWithValue("@EventID", eventId);
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count == 0)
                        {
                            // Delete User_On_Event for that Event
                            using (SqlCommand delUserEvent = new SqlCommand(
                                "DELETE FROM User_On_Event WHERE EventID = @EventID", con))
                            {
                                delUserEvent.Parameters.AddWithValue("@EventID", eventId);
                                delUserEvent.ExecuteNonQuery();
                            }

                            // Delete Donations for that Event
                            using (SqlCommand delDonation = new SqlCommand(
                                "DELETE FROM Donation WHERE EventID = @EventID", con))
                            {
                                delDonation.Parameters.AddWithValue("@EventID", eventId);
                                delDonation.ExecuteNonQuery();
                            }

                            // Delete the Event itself
                            using (SqlCommand delEvent = new SqlCommand(
                                "DELETE FROM Event WHERE EventID = @EventID", con))
                            {
                                delEvent.Parameters.AddWithValue("@EventID", eventId);
                                delEvent.ExecuteNonQuery();
                            }
                        }
                    }
                }

                // 4. Delete the Beneficiary
                using (SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Beneficiary WHERE BeneficiaryID = @BeneficiaryID", con))
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
