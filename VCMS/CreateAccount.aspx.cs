using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Hide inormation message
            lblMessage.Visible = false;
        }

        private DataBaseControls db = new DataBaseControls();

        private String name;
        private String surname;
        private String email;
        private String phoneNumber;
        private String password;

        public void getUserInput()
        {
            name = txtName.Text;
            surname = txtSurname.Text;
            email = txtEmail.Text;
            phoneNumber = txtPhoneNumber.Text;
            password = txtPassword.Text;
        }

        private void ClearInputFields()
        {
            // Clear all input fields
            txtName.Text = string.Empty;
            txtSurname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Get user input
            getUserInput();

            string tableName = "Users";
            string columnName = "Email";

            // Validate User Account Existence
            if (db.EntryExists(tableName, columnName, email))
            {
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An account with this email already exists.";
                ClearInputFields();
                return;
            }
            else
            {
                //Insert user input into the database
                db.CreateUser(name, surname, email, phoneNumber, password);

                //Success message
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Account created successfully.";

                ClearInputFields();
            }
        }
    }
}