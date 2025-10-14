// Abu Aswat: 48241172@mynwu.ac.za
// C Van Jaarsveld: 50143956@mynwu.ac.za
// Charlie Barnard: 52660966@mynwu.ac.za
// E Van Loggerenberg: 37683926@mynwu.ac.za
// Luan Du Plessis: 46251960@mynwu.ac.za
// MR Visser: 38463385@mynwu.ac.za
// Pieta Hattingh: 49019767@mynwu.ac.za
// Rieghardt Wehmeyer: 42262186@mynwu.ac.za

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
            try
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
            catch(SqlException ex)
            {
                Response.Write("<script>alert('Database error: Check connection string " + ex.Message + "');</script>");
            }
        }
    }
}