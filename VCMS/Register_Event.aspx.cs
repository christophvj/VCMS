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
            // Load event data only once the page is requested
            if (!IsPostBack)
            {
                BindEvents();
            }
        }

        // Binds the list of available events to the repeater
        // excluding those the logged-in user is already registered for.
        private void BindEvents()
        {
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                rptEvents.DataSource = db.GetAllEventsWithBeneficiaries(userId);
                rptEvents.DataBind();
            }
        }

        //  Populates the skills dropdown list inside each event card in the repeater.
        protected void rptEvents_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlSkills = (DropDownList)e.Item.FindControl("ddlSkills");
                ddlSkills.DataSource = db.GetSKills();
                ddlSkills.DataTextField = "Description";
                ddlSkills.DataValueField = "SkillID";
                ddlSkills.DataBind();
            }
        }

        // Registers the user for the selected event and skill, then refreshes the list.
        protected void rptEvents_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Register")
            {
                // Redirect to login if user is not authenticated
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/LoginPage.aspx");
                    return;
                }

                // Retrieve user, event, and selected skill info
                int userId = Convert.ToInt32(Session["UserID"]);
                int eventId = Convert.ToInt32(e.CommandArgument);

                DropDownList ddlSkills = (DropDownList)e.Item.FindControl("ddlSkills");
                int skillId = Convert.ToInt32(ddlSkills.SelectedValue);

                // Register the user for the selected event with their skill
                db.RegisterUserForEvent(userId, eventId, skillId);

                // Refresh event list so registered event is no longer shown
                BindEvents();

                Response.Write("<script>alert('Successfully registered as a volunteer!');</script>");
            }
        }
    }
}