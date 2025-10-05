using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace VCMS
{
    public partial class EventParticipation : System.Web.UI.Page
    {
        private DataBaseControls db = new DataBaseControls();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Wire deregister button to call back
            btnDeregister.Click += btnDeregister_Click;

            //Enable selection on the events grid
            gvEvents.AutoGenerateSelectButton = true;
            gvEvents.DataKeyNames = new[] { "EventID" };

            if (!IsPostBack) 
            {
                if (GetCurrentUserId() == 0) 
                {
                    //Session expired - Go back to login
                    Response.Redirect("LoginPage.aspx", endResponse: true);
                    return;
                }

                BindEventsGrid();
                BindDonationsGrid();
            }
        }

        private int GetCurrentUserId() 
        {
            object id = Session["UserID"];
            if(id==null) return 0;

            int userId;
            return int.TryParse(id.ToString(), out userId) ? userId : 0;
        }

        //Populate Events Grid
        private void BindEventsGrid() 
        {
            int userId = GetCurrentUserId();
            if (userId == 0) return;

            string query = @"SELECT e.EventID, e.Name AS EventName, e.Location, e.StartDate, e.EndDate, s.Description AS Skill, uoe.WorkHours
                             FROM User_On_Event uoe
                             INNER JOIN Event e ON uoe.EventID = e.EventID
                             LEFT JOIN Skill s ON uoe.SkillID = s.SkillID
                             WHERE uoe.UserID = @UserID
                             ORDER BY e.StartDate DESC;";

            using (var conn = new SqlConnection(db.connectionString))
            using (var da = new SqlDataAdapter(query, conn)) 
            {
                da.SelectCommand.Parameters.AddWithValue("@UserID", userId);
                var dt = new DataTable();
                da.Fill(dt);
                gvEvents.DataSource = dt;
                gvEvents.DataBind();
            }
                             
        }

        //Populate Donations Grid
        private void BindDonationsGrid() 
        {
            int userId = GetCurrentUserId();
            if (userId == 0) return;

            string query = @"SELECT d.Donation_Date, d.Amount, e.Name AS EventName
                             FROM Donation d
                             LEFT JOIN Event e ON d.EventID = e.EventID
                             WHERE d.UserID = @UserID
                             ORDER BY d.Donation_Date DESC;";

            using (var conn = new SqlConnection(db.connectionString))
            using (var da = new SqlDataAdapter(query, conn))
            {
                da.SelectCommand.Parameters.AddWithValue("@UserID", userId);
                var dt = new DataTable();
                da.Fill(dt);
                gvDonations.DataSource = dt;
                gvDonations.DataBind();
            }
        }

        protected void btnDeregister_Click(object sender, EventArgs e) 
        {
            int userId = GetCurrentUserId();

            if (userId == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "auth", "alert('your session expired. Please log in again');" ,true);
                return;
            }

            if (gvEvents.SelectedDataKey == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "selectRow", "alert('Please select an event to deregister');", true);
                return;
            }

            int eventId = Convert.ToInt32(gvEvents.SelectedDataKey.Value);

            string deleteSql = @"DELETE FROM User_On_Event WHERE UserID = @UserID AND EventID = @EventID";

            try
            {
                using (var conn = new SqlConnection(db.connectionString))
                using (var cmd = new SqlCommand(deleteSql, conn)) 
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@EventID", eventId);

                    conn.Open();

                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ok", "alert('You ahve been deregistered from the event.');", true);
                    }
                    else 
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "none", "alert('No registration found for the selcted event');", true);
                    }
                }

                //Refresh the grids
                BindEventsGrid();
                BindDonationsGrid();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "err", $"alert('An error occured while deregistering: {ex.Message.Replace("'", "\\'")}');", true);
            }
        }


    }
}