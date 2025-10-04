using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VCMS
{
    public partial class MaintainEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            DataBaseControls db = new DataBaseControls();

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT EventID, Name, Description, Location, StartDate, EndDate FROM Event", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataBaseControls db = new DataBaseControls();
            int eventId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
            string description = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDescription")).Text;
            string location = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtLocation")).Text;
            DateTime startDate = Convert.ToDateTime(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtStartDate")).Text);
            DateTime endDate = Convert.ToDateTime(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEndDate")).Text);
            // Validation: End date cannot be before start date
            if (endDate < startDate)
            {
                Response.Write("<script>alert('End date cannot be before start date.');</script>");
                return;
            }

            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                string query = "UPDATE Event SET Name=@Name, Description=@Description, Location=@Location, StartDate=@StartDate, EndDate=@EndDate WHERE EventID=@EventID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EventID", eventId);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataBaseControls db = new DataBaseControls();
            int eventId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(db.connectionString))
            {
                con.Open();

                // First, delete related Beneficiary_On_Event records
                string deleteBeneficiaryOnEvent = "DELETE FROM Beneficiary_On_Event WHERE EventID=@EventID";
                using (SqlCommand cmdDeleteRelated = new SqlCommand(deleteBeneficiaryOnEvent, con))
                {
                    cmdDeleteRelated.Parameters.AddWithValue("@EventID", eventId);
                    cmdDeleteRelated.ExecuteNonQuery();
                }

                // Then, delete the Event record
                string deleteEvent = "DELETE FROM Event WHERE EventID=@EventID";
                using (SqlCommand cmdDeleteEvent = new SqlCommand(deleteEvent, con))
                {
                    cmdDeleteEvent.Parameters.AddWithValue("@EventID", eventId);
                    cmdDeleteEvent.ExecuteNonQuery();
                }

                con.Close();
            }
            BindGridView();
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvent.aspx");
        }

        // Use connection string from DataBaseControls
        // Example: DataBaseControls db = new DataBaseControls();
        // db.connectionString;
    }
}