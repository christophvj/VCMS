using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class UpdateUserInfo : System.Web.UI.Page
    {
        // Create DabaseControls object to access the database
        private DataBaseControls db = new DataBaseControls();

        // Account information
        private int userID;

        private string currName;
        private string currSurname;
        private string currEmail;
        private string currPhoneNum;
        private string currPassword;

        public void getInformation()
        {
            // Get current account information from database
            currName = db.GetAccInfo("Users", userID, "Name");
            currSurname = db.GetAccInfo("Users", userID, "Surname");
            currEmail = db.GetAccInfo("Users", userID, "Email");
            currPhoneNum = db.GetAccInfo("Users", userID, "PhoneNumber");
            currPassword = db.GetAccInfo("Users", userID, "Password");

            // Display current account information in textboxes
            txtName.Text = currName;
            txtSurname.Text = currSurname;
            txtEmail.Text = currEmail;
            txtPhoneNum.Text = currPhoneNum;
            txtPassword.Text = currPassword;
        }

        public void getPasswordOnly()
        {
            currPassword = db.GetAccInfo("Users", userID, "Password");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserID"] == null)
            {
                // Redirect to login page if not logged in
                Response.Redirect("LoginPage.aspx");
                return;
            }
            txtPassword.Enabled = false; // Disable editing of password field
            //txtPassword.TextMode = TextBoxMode.Password; // Mask password field

            userID = Convert.ToInt32(Session["UserID"]);

            if (!IsPostBack)
            {
                // Only get info when the page is first loaded
                getInformation();
            }
            else
            {
                // On postback, only get the password to avoid overwriting user input
                getPasswordOnly();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Compare current information with new information
                if (txtName.Text != currName)
                {
                    // Save new name to database
                    db.updateTableFieldValue("Users", userID, "Name", txtName.Text);
                }

                if (txtSurname.Text != currSurname)
                {
                    // Save new surname to database
                    db.updateTableFieldValue("Users", userID, "Surname", txtSurname.Text);
                }

                if (txtEmail.Text != currEmail)
                {
                    // Save new email to database
                    db.updateTableFieldValue("Users", userID, "Email", txtEmail.Text);
                }

                if (txtPhoneNum.Text != currPhoneNum)
                {
                    // Save new phone number to database
                    db.updateTableFieldValue("Users", userID, "PhoneNumber", txtPhoneNum.Text);
                }

                Response.Write("<script>alert('Information updated successfully.');</script>");
                // Refresh TextBoxes
                getInformation();
            }
            catch (SqlException ex)
            {
                string msg = ex.Message.Replace("'", "\\'");
                ClientScript.RegisterStartupScript(this.GetType(), "sqlError",
                    "<script>alert('Error: " + msg + "');</script>");
            }
        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {
            try
            {
                // Verify current password
                if (txtOldPw.Text != currPassword)
                {
                    Response.Write("<script>alert('Current password is incorrect.');</script>");
                    return;
                }

                // Check if new password and confirm password match
                if (txtNewPw.Text.Trim() != txtConfirmPw.Text.Trim())
                {
                    Response.Write("<script>alert('New password and confirm password do not match.');</script>");
                    return;
                }

                // Update password in database
                db.updateTableFieldValue("Users", userID, "Password", txtNewPw.Text);

                currPassword = txtNewPw.Text;

                // Notify user of success
                Response.Write("<script>alert('Password updated successfully.');</script>");

                // Refresh TextBoxes
                getInformation();
                // Clear password fields
                txtOldPw.Text = "";
                txtNewPw.Text = "";
                txtConfirmPw.Text = "";
            }
            catch (SqlException ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
    }
}