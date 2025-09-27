using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class Browse_Register_Event : System.Web.UI.Page
    {

            DataBaseControls db = new DataBaseControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEvents();
            }
        }

        private void BindEvents()
        {
            // Get all events from the DatabaseControls Class
           // rptEvents.DataSource = db.GetAllEventsWithBeneficiaries();
            rptEvents.DataBind();
        }

        protected void rptEvents_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlSkills = (DropDownList)e.Item.FindControl("ddlSkills");
               // ddlSkills.DataSource = db.GetSKills();
                ddlSkills.DataTextField = "Description";
                ddlSkills.DataValueField = "SkillID";
                ddlSkills.DataBind();
            }
        }

        // Handle register button click event
        protected void rptEvents_ItemDataBound(object source, RepeaterItemEventArgs e)
        {
            //if (e.CommandName == "Register")
            {
                // Ensure user is loged in 
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                int userID = Convert.ToInt32(Session["UserID"]);
                //int eventID = Convert.ToInt32(e.CommandArgument);

                DropDownList ddlSkills = (DropDownList)e.Item.FindControl("ddlSkills");
                int skillID = Convert.ToInt32(ddlSkills.SelectedValue);

                // Register the user for the event
               // db.RegisterUserForEvent(userID, eventID, skillID);

                Response.Write("<script>alert('Successfully registered as a volunteer!');</script>");
            }
        }
    }
}