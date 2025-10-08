using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Hide the links if user is not logged in
            if (Session["UserID"] == null)
            {
                // Hide ALL links
                linkHome.Visible = false;
                linkCreateAccount.Visible = false;
                linkDonation.Visible = false;
                linkEventParticipation.Visible = false;
                linkMaintainEvents.Visible = false;
                linkCreateEvents.Visible = false;
                linkManageUsers.Visible = false;
                linkRegisterEvent.Visible = false;
                linkReports.Visible = false;
                linkUpdateUserInfo.Visible = false;
                linkLogout.Visible = false;

                return; 
            }

            if (!IsPostBack)
            {
                List<string> roles = Session["UserRoles"] as List<string> ?? new List<string>();

                // Hide all links by default
                linkCreateAccount.Visible = false;
                linkDonation.Visible = false;
                linkEventParticipation.Visible = false;
                linkMaintainEvents.Visible = false;
                linkCreateEvents.Visible = false;
                linkManageUsers.Visible = false;
                linkRegisterEvent.Visible = false;
                linkReports.Visible = false;
                linkUpdateUserInfo.Visible = false;
                linkLogout.Visible = false;
                linkHome.Visible = true; // Home is always visible when logged in

                // Show links based on roles
                if (roles.Contains("Admin"))
                {
                    linkCreateAccount.Visible = true;
                    linkMaintainEvents.Visible = true;
                    linkCreateEvents.Visible = true;
                    linkManageUsers.Visible = true;
                    linkReports.Visible = true;
                    linkLogout.Visible = true;
                }
                if (roles.Contains("Donor"))
                {
                    linkDonation.Visible = true;
                    linkEventParticipation.Visible = true;
                    linkUpdateUserInfo.Visible = true;
                    linkLogout.Visible = true;
                }
                if (roles.Contains("Volunteer"))
                {
                    linkRegisterEvent.Visible = true;
                    linkEventParticipation.Visible = true;
                    linkUpdateUserInfo.Visible = true;
                    linkLogout.Visible = true;
                }

                // Logged in user with no roles yet
                if (roles.Count == 0 && Session["UserID"] != null)
                {
                    linkDonation.Visible = true;
                    linkRegisterEvent.Visible = true;
                    linkUpdateUserInfo.Visible = true;
                    linkLogout.Visible = true;
                }
            }
        }
    }
}