Volunteer Charity Management System (VCMS)

Overview
The Volunteer Charity Management System (VCMS) is a web-based application developed using ASP.NET Web Forms and SQL Server. It is designed to help manage charity events, volunteers, and donations efficiently.

Requirements
Before running the project, make sure you have the following installed:
  -Microsoft Visual Studio (latest version recommended)
  -Microsoft SQL Server Management Studio (SSMS) (latest version recommended)

Database Setup
  -Clone the repository or download the project folder.
  -Inside the main project directory, locate a folder named SQL.
Inside the SQL folder, you will find the following files:
  -VCMS_DB.sql – contains the database schema (tables and relationships).
  -DummyData.sql – contains sample (dummy) data for testing and demonstration.
  -AdminOnlyData.sql – contains only the default admin account (use this only if you do not run DummyData.sql).

Steps to Set Up the Database
  -Open SQL Server Management Studio (SSMS).
  -Go to File → Open → File and select VCMS_DB.sql.
  -Run the script to create the database and its tables.
Choose one of the following options:
  -Option 1: Run DummyData.sql to populate the database with full dummy data.
  -Option 2: Run AdminOnlyData.sql if you only want the default admin account without other test data.

Updating the Connection String
-Before running the project, you must update the connection string in the DatabaseControls.cs file to match your local SQL Server instance.
-Open the DatabaseControls.cs file in Visual Studio.
-Locate the connection string line (it will look similar to this): string connectionString = @"Your Connection String";

Project Setup in Visual Studio
  -Open Microsoft Visual Studio (latest version).
  -Open the VCMS project folder.
  -In the Solution Explorer (on the right-hand side), locate the page named LoginPage.aspx.
  -Right-click LoginPage.aspx and select Set as Start Page.
  -Press F5 or click Run to start the project.

Login Information
Admin Account:
  -Email: Admin@gmail.com
  -Password: admin123
Normal Users:
  -Can register directly through the system using the Sign-Up page.
  
Adding Additional Admin Users
  -Create a new user through the system.
  -Open the Users table in SSMS.
  -Locate the user record and manually assign them the Admin role.

Ready to Use
-Once these steps are completed, the VCMS system will be fully set up and ready to use.
