using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class EventParticipation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Create instance for Connection String 
        DataBaseControls db = new DataBaseControls();
        // Example. db.connectionString;
        // User Id is stored in Session after login Session["UserID"] = userId;
    }
}