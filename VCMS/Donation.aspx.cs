using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class Donation : System.Web.UI.Page
    {

        DataBaseControls db = new DataBaseControls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // load event data only once the page is requested
                BindEvents();
            }
        }

        // Binds the list of available events to the repeater
        private void BindEvents()
        {
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                rptEvents.DataSource = db.GetAllEventsWithBeneficiaries(userId, false);
                rptEvents.DataBind();
            }
        }

        // Handles the donation process when the Donate button is clicked
        protected void rptEvents_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Donate")
            {
                // Redirect to Login page if user is not authenticated
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/LoginPage.aspx");
                    return;
                }

                int userId = Convert.ToInt32(Session["UserID"]);
                int eventId = Convert.ToInt32(e.CommandArgument);

                // Find the donation amount input within the repeater item
                TextBox txtAmount = (TextBox)e.Item.FindControl("txtDonationAmount");
                if (txtAmount != null && !string.IsNullOrEmpty(txtAmount.Text))
                {
                    decimal donationAmount;
                    if (decimal.TryParse(txtAmount.Text, out donationAmount) && donationAmount > 0)
                    {
                        // Store the donation in the database
                        db.CreateDonation(userId, eventId, donationAmount);
                        // Success message
                        Response.Write("<script>alert('Thank you for your donation!');</script>");
                        // Clear the input field
                        txtAmount.Text = string.Empty;
                    }
                    else
                    {
                        // Handle invalid amount input
                        Response.Write("<script>alert('Please enter a valid donation amount.');</script>");
                    }
                }
            }
        }
    }
}