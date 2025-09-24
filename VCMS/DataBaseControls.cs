using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VCMS
{
    internal class DataBaseControls
    {
        // Insert your connection string here.
        private string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=VCMS_DB;Integrated Security=True";


        /// <summary>
        /// Checks if an email already exists in the Users table & returns true if it does
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool EmailExists(string email)
        {
            bool exists = false;

            string query = "SELECT COUNT(1) FROM Users WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@Email", email);

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



    }
}