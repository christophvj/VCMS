-- ====================================================
-- MINIMAL DUMMY DATA FOR ADMIN ONLY
-- ====================================================

-- ================================================
-- ROLES
-- ================================================
INSERT INTO Role (Name)
VALUES 
('Admin'),
('Volunteer'),
('Donor');
GO

-- ================================================
-- SKILLS (required for system, but Admin may not use them)
-- ================================================
INSERT INTO Skill (Description)
VALUES
('Medic'),
('Cleaner'),
('Cook'),
('Driver'),
('Security'),
('Fundraiser'),
('Teacher'),
('Counselor'),
('Logistics'),
('Photographer'),
('Event Planner'),
('IT Support'),
('Translator'),
('Social Media Manager'),
('Electrician'),
('First Aid Specialist'),
('Gardener'),
('Public Speaker'),
('Graphic Designer'),
('Coordinator');
GO

-- ================================================
-- ADMIN USER
-- ================================================
INSERT INTO Users (Name, Surname, Email, PhoneNumber, Password)
VALUES ('Admin', 'Admin', 'admin@gmail.com', '0711111111', 'admin123');
GO

-- ================================================
-- ASSIGN ADMIN ROLE
-- ================================================
-- Assuming Alice is UserID = 1 and Admin role is RoleID = 1
INSERT INTO User_Role (UserID, RoleID)
VALUES (1, 1);
GO
