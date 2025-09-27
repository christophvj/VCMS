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
        private string connectionString = @"Data Source=LUAN;Initial Catalog=VCMS_DB;Integrated Security=True;TrustServerCertificate=True";

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
    }
}