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