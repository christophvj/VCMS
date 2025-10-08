-- ROLES
INSERT INTO Role (Name) VALUES
('Admin'),
('Volunteer'),
('Donor');
GO

-- USERS
INSERT INTO Users (Name, Surname, Email, PhoneNumber, Password) VALUES
-- Admin (UserID = 1)
('Admin', 'User', 'admin@gmail.com', '0700000000', 'admin123'),

-- Dummy Users (UserID = 2 to 31)
('Ethan', 'Miller', 'ethan.m@gmail.com', '0712341001', 'pass123'),
('Grace', 'Lee', 'grace.lee@yahoo.com', '0712341002', 'pass123'),
('Liam', 'Wilson', 'liamw@hotmail.com', '0712341003', 'pass123'),
('Mia', 'Taylor', 'mia.tay@gmail.com', '0712341004', 'pass123'),
('Noah', 'Anderson', 'noah.a@gmail.com', '0712341005', 'pass123'),
('Olivia', 'Thomas', 'oliviat@live.com', '0712341006', 'pass123'),
('James', 'Moore', 'jmoore@gmail.com', '0712341007', 'pass123'),
('Emma', 'Jackson', 'emma.j@gmail.com', '0712341008', 'pass123'),
('Benjamin', 'Martin', 'benmartin@outlook.com', '0712341009', 'pass123'),
('Sophia', 'Thompson', 'sophia.t@gmail.com', '0712341010', 'pass123'),
('Lucas', 'Garcia', 'lucasg@yahoo.com', '0712341011', 'pass123'),
('Isabella', 'Martinez', 'isa.martinez@gmail.com', '0712341012', 'pass123'),
('Henry', 'Rodriguez', 'henryr@yahoo.com', '0712341013', 'pass123'),
('Ava', 'Hernandez', 'ava.hdz@gmail.com', '0712341014', 'pass123'),
('Daniel', 'Lopez', 'dan.lopez@gmail.com', '0712341015', 'pass123'),
('Charlotte', 'Gonzalez', 'char.g@outlook.com', '0712341016', 'pass123'),
('Sebastian', 'Perez', 'seb.pz@hotmail.com', '0712341017', 'pass123'),
('Amelia', 'Sanchez', 'amelia.s@gmail.com', '0712341018', 'pass123'),
('Matthew', 'Clark', 'matt.clark@gmail.com', '0712341019', 'pass123'),
('Ella', 'Lewis', 'ella.lewis@gmail.com', '0712341020', 'pass123'),
('Jack', 'Walker', 'jackw@yahoo.com', '0712341021', 'pass123'),
('Lily', 'Young', 'lily.young@gmail.com', '0712341022', 'pass123'),
('Aiden', 'King', 'aiden.k@gmail.com', '0712341023', 'pass123'),
('Chloe', 'Scott', 'chloe.scott@hotmail.com', '0712341024', 'pass123'),
('Logan', 'Green', 'logan.green@gmail.com', '0712341025', 'pass123'),
('Zoe', 'Adams', 'zoe.adams@yahoo.com', '0712341026', 'pass123'),
('Caleb', 'Nelson', 'calebn@gmail.com', '0712341027', 'pass123'),
('Natalie', 'Baker', 'nat.baker@gmail.com', '0712341028', 'pass123'),
('Ryan', 'Rivera', 'ryan.riv@gmail.com', '0712341029', 'pass123'),
('Hannah', 'Carter', 'hannahc@live.com', '0712341030', 'pass123');
GO

-- USER ROLE ASSIGNMENTS
INSERT INTO User_Role (UserID, RoleID) VALUES
-- Admin
(1, 1),

-- Volunteers
(2, 2), (3, 2), (4, 2), (5, 2), (7, 2), (9, 2), (11, 2), (13, 2),
(15, 2), (17, 2), (19, 2), (21, 2), (23, 2), (25, 2), (27, 2), (29, 2),

-- Donors
(3, 3), (6, 3), (8, 3), (10, 3), (12, 3), (14, 3), (16, 3),
(18, 3), (20, 3), (22, 3), (24, 3), (26, 3), (28, 3), (30, 3),

-- Both Volunteer & Donor
(3, 3), (11, 3), (17, 3), (25, 3), (29, 3);
GO

-- SKILLS
INSERT INTO Skill (Description) VALUES
('First Aid / Medic'),          -- Emergency care
('Food Preparation & Cooking'), -- Community kitchen / Food bank
('Logistics & Supplies'),       -- Coordinating goods and resources
('Event Setup & Cleanup'),      -- Tables, chairs, signs, decor
('Transportation / Driver'),    -- Driving people or supplies
('Childcare & Youth Support'),  -- Babysitting or workshop activities
('Elderly Assistance'),         -- Helping seniors at events
('Fundraising & Outreach'),     -- Public engagement, donation drives
('Registration & Check-in'),    -- Welcoming participants
('Public Speaking / Hosting'),  -- Speaking at events
('Photography & Social Media'), -- Capturing and sharing event moments
('Counseling / Emotional Support'); -- Support for affected individuals
GO

-- SKILLS ON USERS
INSERT INTO Skill_On_User (UserID, SkillID) VALUES
(2, 1), (3, 2), (4, 3), (5, 4), (7, 5),
(9, 6), (11, 7), (13, 8), (15, 9), (17, 10),
(19, 1), (21, 2), (23, 3), (25, 4), (27, 5),
(29, 6);
GO

-- BENEFICIARIES
INSERT INTO Beneficiary (Name, AmountReceived) VALUES
('Hope Shelter', 0.00),
('Food Bank', 0.00),
('Youth Center', 0.00);
GO

-- EVENTS
INSERT INTO Event (Name, Description, Location, StartDate, EndDate) VALUES
('Charity Run', 'A 10km run to raise funds for Hope Shelter.', 'City Park', '2025-02-01', '2025-02-01'),
('Food Drive', 'Collecting non-perishable items for Food Bank.', 'Community Hall', '2025-03-10', '2025-03-12'),
('Youth Workshop', 'Workshops and activities for the local Youth Center.', 'Youth Hall', '2025-04-05', '2025-04-05');
GO

-- BENEFICIARY ON EVENTS
INSERT INTO Beneficiary_On_Event (BeneficiaryID, EventID) VALUES
(1, 1),
(2, 2),
(3, 3);
GO

-- VOLUNTEERING
INSERT INTO User_On_Event (UserID, EventID, SkillID, WorkHours) VALUES
(2, 1, 1, 5.0),
(3, 2, 2, 4.5),
(4, 2, 3, 3.0),
(5, 3, 4, 6.0),
(7, 3, 5, 2.0),
(9, 1, 6, 3.5),
(11, 2, 7, 5.0),
(13, 3, 8, 4.0),
(15, 1, 9, 3.0),
(17, 2, 10, 3.0),
(19, 3, 1, 5.0),
(21, 1, 2, 4.0),
(23, 2, 3, 3.5),
(25, 3, 4, 2.5),
(27, 1, 5, 4.0),
(29, 2, 6, 3.0);
GO

-- DONATIONS
INSERT INTO Donation (UserID, EventID, Amount, Donation_Date) VALUES
(3, 1, 150.00, '2025-02-01'),
(6, 2, 250.00, '2025-03-11'),
(8, 3, 100.00, '2025-04-05'),
(10, 1, 200.00, '2025-02-01'),
(12, 2, 180.00, '2025-03-11'),
(14, 3, 300.00, '2025-04-05'),
(16, 1, 220.00, '2025-02-01'),
(18, 2, 330.00, '2025-03-11'),
(20, 3, 400.00, '2025-04-05'),
(22, 1, 275.00, '2025-02-01'),
(24, 2, 150.00, '2025-03-11'),
(26, 3, 120.00, '2025-04-05'),
(28, 1, 350.00, '2025-02-01'),
(30, 2, 180.00, '2025-03-11');
GO
