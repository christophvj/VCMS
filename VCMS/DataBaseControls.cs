using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

namespace VCMS
{
    internal class DataBaseControls
    {
        // Insert your connection string here.
        public string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=VCMS_DB;Integrated Security=True";

        /// <summary>
        /// Checks if a string is a valid SQL identifier (e.g., table or column name).
        /// </summary>
        /// <param name="identifier"></param>
        /// <returns></returns>
        private bool IsValidIdentifier(string identifier)
        {
            // Simple regex to allow only letters, numbers, and underscores
            return Regex.IsMatch(identifier, @"^[A-Za-z_][A-Za-z0-9_]*$");
        }

        /// <summary>
        /// Checks if entry exists in the specified table and column with the given value.
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="columnName"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        public bool EntryExists(string tableName, string columnName, object value)
        {
            bool exists = false;

            // Validate table and column names to prevent SQL injection
            if (!IsValidIdentifier(tableName) || !IsValidIdentifier(columnName))
            {
                throw new ArgumentException("Invalid table or column name.");
            }

            string query = $"SELECT COUNT(1) FROM [{tableName}] WHERE [{columnName}] = @Value";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@Value", value);

                connection.Open();
                int count = (int)cmd.ExecuteScalar(); // Returns the first column of the first row
                exists = count > 0;
            }
            return exists;
        }

        /// <summary>
        /// Query to insert a new user into the Users table
        /// </summary>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="email"></param>
        /// <param name="phoneNumber"></param>
        /// <param name="password"></param>
        public void CreateUser(string name, string surname, string email, string phoneNumber, string password)
        {
            string query = "INSERT INTO Users (Name, Surname, Email, PhoneNumber, Password) " +
                           "VALUES (@Name, @Surname, @Email, @PhoneNumber, @Password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Surname", surname);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@Password", password);

                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //Login function to validate user credentials
        // Reurns true if the credentials are valid, otherwise false
        public int ValidateUserCredentials(string email, string password)
        {
            int userID = 0;
            string query = "SELECT UserID FROM Users WHERE Email = @Email AND Password = @Password";
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                connection.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    userID = Convert.ToInt32(result);
                }
                return userID;
            }
        }

        /// <summary>
        /// Retrieves all events with their associated beneficiaries,
        /// excluding events the specified user is already registered for
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetAllEventsWithBeneficiaries(int userId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        e.EventID,
                        e.Name AS EventName,
                        e.Description,
                        e.Location,
                        e.StartDate,
                        e.EndDate,
                        STRING_AGG(b.Name, ', ') AS Beneficiaries
                    FROM Event e
                    LEFT JOIN Beneficiary_On_Event be ON e.EventID = be.EventID
                    LEFT JOIN Beneficiary b ON be.BeneficiaryID = b.BeneficiaryID
                    WHERE e.EventID NOT IN (SELECT EventID FROM User_On_Event WHERE UserID = @UserID)
                    GROUP BY e.EventID, e.Name, e.Description, e.Location, e.StartDate, e.EndDate";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@UserID", userId);

                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        /// <summary>
        /// Retrieves all available skills from the Skill table.
        /// </summary>
        /// <returns></returns>
        public DataTable GetSKills()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT SkillID, Description FROM Skill";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        /// <summary>
        /// Registers a user for a specific event with a selected skill.
        /// Also ensures the user has the Volunteer role assigned.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="eventId"></param>
        /// <param name="skillId"></param>
        public void RegisterUserForEvent(int userId, int eventId, int skillId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Insert into User_On_Event if not exists
                string insertUserOnEvent = @"
                    IF NOT EXISTS (
                        SELECT 1 FROM User_On_Event
                        WHERE UserID=@UserID AND EventID=@EventID AND SkillID=@SkillID
                    )
                    INSERT INTO User_On_Event (UserID, EventID, SkillID, WorkHours)
                    VALUES (@UserID, @EventID, @SkillID, 0)";

                using (SqlCommand cmd = new SqlCommand(insertUserOnEvent, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@EventID", eventId);
                    cmd.Parameters.AddWithValue("@SkillID", skillId);
                    cmd.ExecuteNonQuery();
                }

                // Assign Volunteer role if not already assigned
                string assignVolunteerRole = @"
                    INSERT INTO User_Role (UserID, RoleID)
                    SELECT @UserID, RoleID FROM Role WHERE Name='Volunteer'
                    AND NOT EXISTS (
                        SELECT 1 FROM User_Role WHERE UserID=@UserID AND RoleID = (SELECT RoleID FROM Role WHERE Name='Volunteer')
                    )";

                using (SqlCommand cmdRole = new SqlCommand(assignVolunteerRole, conn))
                {
                    cmdRole.Parameters.AddWithValue("@UserID", userId);
                    cmdRole.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Reacords a donation made by a user to a specific event.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="eventId"></param>
        /// <param name="amount"></param>
        public void CreateDonation(int userId, int eventId, decimal amount)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO Donation (UserID, EventID, Amount, Donation_Date)
                               VALUES (@UserID, @EventID, @Amount, @DonationDate)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@EventID", eventId);
                    cmd.Parameters.AddWithValue("@Amount", amount);
                    cmd.Parameters.AddWithValue("@DonationDate", DateTime.Now.Date);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


        public void DeleteRecordsByEventID(string tableName, int eventId)
        {
            // Basic validation to prevent SQL injection
            var allowedTables = new HashSet<string> { "User_On_Event", "Beneficiary_On_Event", "Donation", "Event" };
            if (!allowedTables.Contains(tableName))
            {
                throw new ArgumentException("Invalid table name.");
            }

            // Sql query to delete records by EventID
            string query = $"DELETE FROM {tableName} WHERE EventID = @EventId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@EventId", eventId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }


        /// <summary>
        /// Returns the top 10 events with the highest number of volunteers
        /// </summary>
        /// <returns></returns>
        public DataTable GetTopEvents()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    Select TOP 10 
                        e.EventID,
                        e.Name AS EventName,
                        COUNT(uoe.UserID) AS VolunteerCount
                    FROM Event e
                    LEFT JOIN User_On_Event uoe ON e.EventID = uoe.EventID
                    GROUP BY e.EventID, e.Name
                    ORDER BY VolunteerCount DESC;";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }


        /// <summary>
        /// Returns all events and the number of volunteers registered per event
        /// </summary>
        /// <returns></returns>
        public DataTable GetVolunteersPerEvent()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        e.EventID,
                        e.Name AS EventName,
                        COUNT(uoe.UserID) AS VolunteerCount
                    From Event e
                    LEFT JOIN User_On_Event uoe ON e.EventID = uoe.EventID
                    GROUP BY e.EventID, e.Name
                    ORDER BY e.Name;";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }


        /// <summary>
        /// Returns all events with a list of beneficiaries linked to each
        /// </summary>
        /// <returns></returns>
        public DataTable GetBeneficiariesPerEvent()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        e.EventID,
                        e.Name AS EventName,
                        STRING_AGG(b.Name, ',') AS Beneficiaries
                    FROM Event e
                    LEFT JOIN Beneficiary_On_Event be ON e.EventID = be.EventID
                    LEFT JOIN Beneficiary b ON be.BeneficiaryID = b.BeneficiaryID
                    GROUP BY e.EventID, e.Name
                    ORDER BY e.Name;";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        /// <summary>
        /// Returns all events with their total donations amounts
        /// </summary>
        /// <returns></returns>
        public DataTable GetTotalDonationsPerEvent()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        e.EventID,
                        e.Name AS EventName,
                        IsNull(SUM(d.Amount), 0) AS TotalDonations
                    FROM Event e
                    LEFT JOIN Donation d ON e.EventID = d.EventID
                    GROUP BY e.EventID, e.Name
                    ORDER BY TotalDonations DESC;";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}