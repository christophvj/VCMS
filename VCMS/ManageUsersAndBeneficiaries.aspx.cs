using System;
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
        protected global::System.Web.UI.WebControls.TextBox txtName;
        protected global::System.Web.UI.WebControls.TextBox txtSurname;
        protected global::System.Web.UI.WebControls.TextBox txtEmail;
        protected global::System.Web.UI.WebControls.TextBox txtPhoneNumber;
        protected global::System.Web.UI.WebControls.TextBox txtPassword;
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
            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                con.Open();
                string query = "INSERT INTO Users (Name, Surname, Email, PhoneNumber, Password) VALUES (@Name, @Surname, @Email, @PhoneNumber, @Password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadUsers();
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
                cmd.Parameters.AddWithValue("@AmountReceived", Convert.ToDecimal(txtAmountReceived.Text));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadBeneficiaries();
        }

        //Delete Beneficiary
        protected void gvBeneficiaries_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int beneficiaryId = Convert.ToInt32(gvBeneficiaries.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                string query = "DELETE FROM Beneficiary WHERE BeneficiaryID = @BeneficiaryID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BeneficiaryID", beneficiaryId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadBeneficiaries();
        }
    }
}