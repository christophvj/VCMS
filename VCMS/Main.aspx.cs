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
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                // Redirect to login page
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                int userId = (int)(Session["UserID"]);

                // Retreive user roles if not already in session
                if (Session["UserRoles"] == null)
                {
                    DataBaseControls db = new DataBaseControls();

                    // Get user roles and store in session 
                    List<string> roles = db.GetUserRoles(userId);
                    Session["UserRoles"] = roles;
                }


            }
        }
    }
}