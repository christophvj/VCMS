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

        private String name;
        private String surname;
        private String email;
        private String phoneNumber;
        private String password;

        public void getUserInput()
        {
            txtName.Text = name;
            txtSurname.Text = surname;
            txtEmail.Text = email;
            txtPhoneNumber.Text = phoneNumber;
            txtPassword.Text = password;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Get user input
            getUserInput();

            // Validate User Account Existence
            //if (db.EmailExists())
            //{
            //    lblMessage.Visible = true;
            //    lblMessage.BackColor = System.Drawing.Color.Red;
            //    lblMessage.Text = "An account with this email already exists.";
            //    return;
            //}
            //else
            //{
                // Insert user input into the database
                // Success message 
              //  lblMessage.Visible = true;
              //  lblMessage.BackColor = System.Drawing.Color.Green;
               // lblMessage.Text = "Account created successfully.";
            //}
        }
    }
}