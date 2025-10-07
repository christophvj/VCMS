using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class Reports : System.Web.UI.Page
    {

        DataBaseControls db = new DataBaseControls();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserID"] == null)
            {
                // Redirect to login page
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Set the defualt view to Top Events
                mvReports.ActiveViewIndex = 0;
                loadTopEvents();
            }
        }


        // Handles menu item clicks
        protected void menuReports_MenuItemClick(object sender, MenuEventArgs e)
        {
            // Get the value of the clicked menu item
            int index = int.Parse(e.Item.Value);
            mvReports.ActiveViewIndex = index;

            // Load the corresponding data based on the clicked menu item
            switch (index)
            {
                case 0:
                    loadTopEvents();
                    break;
                case 1:
                    loadVolunteersPerEvent();
                    break;
                case 2:
                    loadBeneficiariesPerEvent();
                    break;
                case 3:
                    loadTotalDonationsPerEvent();
                    break;
            }
        }

        // Loads top 10 Events report
        private void loadTopEvents()
        {
            DataTable dt = db.GetTopEvents();
            gvTopEvents.DataSource = dt;
            gvTopEvents.DataBind();
        }

        // Loads Volunteers per Event report
        private void loadVolunteersPerEvent()
        {
            DataTable dt = db.GetVolunteersPerEvent();
            gvVolunteersPerEvent.DataSource = dt;
            gvVolunteersPerEvent.DataBind();
        }

        // Loads Beneficiaries per Event report
        private void loadBeneficiariesPerEvent()
        {
            DataTable dt = db.GetBeneficiariesPerEvent();
            gvBeneficiariesPerEvent.DataSource = dt;
            gvBeneficiariesPerEvent.DataBind();
        }

        // Loads Total Donations per Event report
        private void loadTotalDonationsPerEvent()
        {
            DataTable dt = db.GetTotalDonationsPerEvent();
            gvTotalDonationsPerEvent.DataSource = dt;
            gvTotalDonationsPerEvent.DataBind();
        }
    }
}