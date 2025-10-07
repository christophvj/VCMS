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
            if (!IsPostBack)
            {
                mvReports.ActiveViewIndex = 0;
                loadTopEvents();
            }
        }

        protected void menuReports_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = int.Parse(e.Item.Value);
            mvReports.ActiveViewIndex = index;

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

        private void loadTopEvents()
        {
            DataTable dt = db.GetTopEvents();
            gvTopEvents.DataSource = dt;
            gvTopEvents.DataBind();
        }

        private void loadVolunteersPerEvent()
        {
            DataTable dt = db.GetVolunteersPerEvent();
            gvVolunteersPerEvent.DataSource = dt;
            gvVolunteersPerEvent.DataBind();
        }

        private void loadBeneficiariesPerEvent()
        {
            DataTable dt = db.GetBeneficiariesPerEvent();
            gvBeneficiariesPerEvent.DataSource = dt;
            gvBeneficiariesPerEvent.DataBind();
        }

        private void loadTotalDonationsPerEvent()
        {
            DataTable dt = db.GetTotalDonationsPerEvent();
            gvTotalDonationsPerEvent.DataSource = dt;
            gvTotalDonationsPerEvent.DataBind();
        }
    }
}