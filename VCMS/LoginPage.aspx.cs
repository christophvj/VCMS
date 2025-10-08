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
            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            DataBaseControls dbLogin = new DataBaseControls();
            int userId = dbLogin.ValidateUserCredentials(email, password);

            if (userId > 0)
            {
                Session["UserID"] = userId;
                // Successful login

                // Fetch roles from db
                List<string> roles = dbLogin.GetUserRoles(userId);
                string script = "alert('Login successful.'); window.location='Main.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "loginSuccess", script, true);
            }
            else
            {
                // Invalid credentials
                RegularExpressionValidator1.Visible = true;
                RegularExpressionValidator1.ForeColor = System.Drawing.Color.Red;
                Label3.Text = "Invalid email or password.";
                ClientScript.RegisterStartupScript(this.GetType(), "loginFail", "alert('Login unsuccessful. Wrong email or password.');", true);
            }
        }
    }
}