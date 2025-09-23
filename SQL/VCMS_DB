-- Create database if it doesn't exist
IF DB_ID('VCMS_DB') IS NULL
    CREATE DATABASE VCMS_DB;
GO

USE VCMS_DB;
GO

-- Create Users table 
CREATE TABLE Users (
    UserID INT IDENTITY(1,1),
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    PhoneNumber VARCHAR(10),
    Password VARCHAR(50),
    
    CONSTRAINT PK_User PRIMARY KEY (UserID)
);

-- Create Roles table 
CREATE TABLE Role (
    RoleID INT IDENTITY(1,1),
    Name VARCHAR(50),
    
    CONSTRAINT PK_Role PRIMARY KEY (RoleID)
);

-- Create User_Role table (many-to-many)
CREATE TABLE User_Role (
    UserID INT,
    RoleID INT,
    
    CONSTRAINT PK_User_Role PRIMARY KEY (UserID, RoleID),
    CONSTRAINT FK_User_Role_Users FOREIGN KEY (UserID) REFERENCES Users (UserID),
    CONSTRAINT FK_User_Role_Role FOREIGN KEY (RoleID) REFERENCES Role (RoleID)
);

-- Create Events table
CREATE TABLE Event (
    EventID INT IDENTITY(1,1),
    Name VARCHAR(50),
    Description VARCHAR(MAX),
    Location VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    
    CONSTRAINT PK_Event PRIMARY KEY (EventID)
);

-- Create Beneficiaries table
CREATE TABLE Beneficiary (
    BeneficiaryID INT IDENTITY(1,1),
    Name VARCHAR(50),
    AmountReceived DECIMAL(10,2),
    
    CONSTRAINT PK_Beneficiary PRIMARY KEY (BeneficiaryID)
);

-- Create Skill table
CREATE TABLE Skill (
    SkillID INT IDENTITY(1,1),
    Description VARCHAR(50),
    
    CONSTRAINT PK_Skill PRIMARY KEY (SkillID)
);

-- Create Skill_On_User table
CREATE TABLE Skill_On_User (
    UserID INT,
    SkillID INT,
    
    CONSTRAINT PK_Skill_On_User PRIMARY KEY (UserID, SkillID),
    CONSTRAINT FK_Skill_On_User_Users FOREIGN KEY (UserID) REFERENCES Users (UserID),
    CONSTRAINT FK_Skill_On_User_Skill FOREIGN KEY (SkillID) REFERENCES Skill (SkillID)
);

-- Create User_On_Event table 
CREATE TABLE User_On_Event (
    UserID INT,
    EventID INT,
    SkillID INT,
    WorkHours DECIMAL(5,2),
    
    CONSTRAINT PK_User_On_Event PRIMARY KEY (UserID, EventID, SkillID),
    CONSTRAINT FK_User_On_Event_Users FOREIGN KEY (UserID) REFERENCES Users (UserID),
    CONSTRAINT FK_User_On_Event_Event FOREIGN KEY (EventID) REFERENCES Event (EventID),
    CONSTRAINT FK_User_On_Event_Skill FOREIGN KEY (SkillID) REFERENCES Skill (SkillID)
);

-- Create Beneficiary_On_Event table (many-to-many)
CREATE TABLE Beneficiary_On_Event (
    BeneficiaryID INT,
    EventID INT,
    
    CONSTRAINT PK_Beneficiary_On_Event PRIMARY KEY (BeneficiaryID, EventID),
    CONSTRAINT FK_Beneficiary_On_Event_Beneficiary FOREIGN KEY (BeneficiaryID) REFERENCES Beneficiary (BeneficiaryID),
    CONSTRAINT FK_Beneficiary_On_Event_Event FOREIGN KEY (EventID) REFERENCES Event (EventID)
);

-- Create Donations table 
CREATE TABLE Donation (
    DonationID INT IDENTITY(1,1),
    UserID INT,
    EventID INT,
    Amount DECIMAL(10,2),
    Donation_Date DATE,
    
    CONSTRAINT PK_Donation PRIMARY KEY (DonationID),
    CONSTRAINT FK_Donation_Users FOREIGN KEY (UserID) REFERENCES Users (UserID),
    CONSTRAINT FK_Donation_Event FOREIGN KEY (EventID) REFERENCES Event (EventID)
);
