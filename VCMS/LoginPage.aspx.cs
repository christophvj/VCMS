using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace VCMS
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            DataBaseControls dbLogin = new DataBaseControls();

            if (dbLogin.ValidateUserCredentials(email, password))
            {
                // Successful login
                Response.Redirect("CreateAccount.aspx"); // Redirect to the desired page after login
            }
            else
            {
                // Invalid credentials
                RegularExpressionValidator1.Visible = true;
                RegularExpressionValidator1.ForeColor = System.Drawing.Color.Red;
                Label3.Text = "Invalid email or password.";
            }
        }
    }
}