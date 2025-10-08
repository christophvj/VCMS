using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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

        // Exports the currently visible GridView to Excel
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            GridView gv = null;

            // Determine which GridView to export based on the active view
            switch (mvReports.ActiveViewIndex)
            {
                case 0:
                    gv = gvTopEvents;
                    break;
                case 1:
                    gv = gvVolunteersPerEvent;
                    break;
                case 2:
                    gv = gvBeneficiariesPerEvent;
                    break;
                case 3:
                    gv = gvTotalDonationsPerEvent;
                    break;
            }

            // Check if the GridView is selected and contains data
            if (gv != null && gv.Rows.Count > 0)
            {
                Response.Clear();
                Response.Buffer = true;

                // Add a header to indicate this is a .xls file
                Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";

                // Use StringWriter and HtmlTextWriter to capture the GridView's HTML
                using (StringWriter sw = new StringWriter())
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    // Style Header row of excel
                    gv.HeaderRow.Style.Add("background-color", "#FFFFFF");

                    // Loop through each cell in the header row and apply background and foreground colors
                    foreach (TableCell cell in gv.HeaderRow.Cells)
                    {
                        cell.Style.Add("background-color", "#00796B");
                        cell.Style.Add("color", "#FFFFFF");
                    }

                    gv.RenderControl(hw);
                    Response.Output.Write(sw.ToString());
                    Response.Flush();
                    Response.End();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for the specified ASP.NET server control at run time.
        }
    }
}