-- ====================================================
--  DUMMY DATA FOR VCMS (EXTENDED VERSION)
--  20 Users | 15 Events | Full Relationships
-- ====================================================

-- RESET (optional - only if reseeding in dev)
-- DBCC CHECKIDENT ('Role', RESEED, 0);
-- DBCC CHECKIDENT ('Users', RESEED, 0);
-- DBCC CHECKIDENT ('Skill', RESEED, 0);
-- DBCC CHECKIDENT ('Beneficiary', RESEED, 0);
-- DBCC CHECKIDENT ('Event', RESEED, 0);
-- DBCC CHECKIDENT ('Donation', RESEED, 0);
-- DBCC CHECKIDENT ('User_Role', RESEED, 0);
-- DBCC CHECKIDENT ('Skill_On_User', RESEED, 0);
-- DBCC CHECKIDENT ('User_On_Event', RESEED, 0);
-- DBCC CHECKIDENT ('Beneficiary_On_Event', RESEED, 0);
GO



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
-- USERS (20 total)
-- ================================================
INSERT INTO Users (Name, Surname, Email, PhoneNumber, Password)
VALUES
('Admin', 'Admin', 'admin@gmail.com', '0711111111', 'admin123'),
('Bob', 'Jones', 'bob.volunteer@example.com', '0722222222', 'vol123'),
('Charlie', 'Brown', 'charlie.donor@example.com', '0733333333', 'don123'),
('Diana', 'White', 'diana.both@example.com', '0744444444', 'both123'),
('Ethan', 'Green', 'ethan.volunteer@example.com', '0755555555', 'vol456'),
('Fiona', 'Adams', 'fiona.donor@example.com', '0766666666', 'don456'),
('George', 'Taylor', 'george.admin@example.com', '0777777777', 'admin456'),
('Hannah', 'Clark', 'hannah.volunteer@example.com', '0788888888', 'vol789'),
('Ian', 'Wright', 'ian.donor@example.com', '0799999999', 'don789'),
('Jade', 'Lewis', 'jade.volunteer@example.com', '0700000001', 'vol111'),
('Kevin', 'Baker', 'kevin.admin@example.com', '0700000002', 'admin111'),
('Laura', 'Hill', 'laura.volunteer@example.com', '0700000003', 'vol222'),
('Michael', 'Young', 'michael.donor@example.com', '0700000004', 'don222'),
('Natalie', 'King', 'natalie.volunteer@example.com', '0700000005', 'vol333'),
('Oscar', 'Evans', 'oscar.donor@example.com', '0700000006', 'don333'),
('Paula', 'Reed', 'paula.volunteer@example.com', '0700000007', 'vol444'),
('Quinn', 'Carter', 'quinn.admin@example.com', '0700000008', 'admin222'),
('Ryan', 'Bell', 'ryan.volunteer@example.com', '0700000009', 'vol555'),
('Sophie', 'Ward', 'sophie.donor@example.com', '0700000010', 'don444'),
('Thomas', 'Price', 'thomas.volunteer@example.com', '0700000011', 'vol666');
GO


-- ================================================
-- USER ROLES
-- ================================================
INSERT INTO User_Role (UserID, RoleID)
VALUES
(1,1),
(2,2),
(3,3),
(4,2),(4,3),
(5,2),
(6,3),
(7,1),
(8,2),
(9,3),
(10,2),
(11,1),
(12,2),
(13,3),
(14,2),
(15,3),
(16,2),
(17,1),
(18,2),
(19,3),
(20,2);
GO


-- ================================================
-- SKILLS
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
-- SKILL ASSIGNMENTS
-- ================================================
INSERT INTO Skill_On_User (UserID, SkillID)
VALUES
(2,1),(2,3),(2,4),
(4,9),
(5,5),(5,11),
(8,2),(8,7),
(7,12),
(10,10),
(12,18),
(14,14),
(16,6),
(17,19),
(18,20),
(20,17);
GO


-- ================================================
-- BENEFICIARIES
-- ================================================
INSERT INTO Beneficiary (Name, AmountReceived)
VALUES
('Hope Shelter', 0.00),
('Food Bank', 0.00),
('Youth Center', 0.00),
('Animal Rescue SA', 0.00),
('Elder Care Foundation', 0.00),
('Education First', 0.00),
('Clean Water Project', 0.00),
('Habitat Builders', 0.00),
('Children’s Fund', 0.00),
('Green Earth Initiative', 0.00);
GO


-- ================================================
-- EVENTS (15 total)
-- ================================================
INSERT INTO Event (Name, Description, Location, StartDate, EndDate)
VALUES
('Charity Run', 'A 10km run to raise funds for Hope Shelter.', 'City Park', '2025-02-01', '2025-02-01'),
('Food Drive', 'Collecting non-perishable items for Food Bank.', 'Community Hall', '2025-03-10', '2025-03-12'),
('Youth Workshop', 'Activities and training for local youth.', 'Youth Hall', '2025-04-05', '2025-04-05'),
('Animal Rescue Day', 'Helping with animal care and adoptions.', 'Rescue Farm', '2025-05-15', '2025-05-16'),
('Senior Outreach', 'Volunteering at Elder Care Foundation.', 'Old Age Home', '2025-06-20', '2025-06-20'),
('Tech for Good', 'Setting up computers for education.', 'IT Center', '2025-07-12', '2025-07-13'),
('Clean Water Drive', 'Installing filtration systems in villages.', 'Riverside', '2025-08-01', '2025-08-03'),
('Back to School', 'Providing supplies to underprivileged kids.', 'Community Hall', '2025-09-05', '2025-09-05'),
('Tree Planting Day', 'Planting 500 trees across the park.', 'Green Park', '2025-10-02', '2025-10-02'),
('Community Cleanup', 'Neighborhood cleanup and recycling day.', 'Downtown', '2025-11-01', '2025-11-01'),
('Habitat Build', 'Building homes for the homeless.', 'Site 42', '2025-12-03', '2025-12-05'),
('Health Fair', 'Free medical check-ups and workshops.', 'Town Square', '2026-01-15', '2026-01-16'),
('Children’s Day', 'Fun and learning day for children.', 'Playground', '2026-02-14', '2026-02-14'),
('Green Earth Expo', 'Promoting environmental awareness.', 'Expo Center', '2026-03-21', '2026-03-22'),
('Fundraiser Gala', 'Formal dinner to raise funds for multiple causes.', 'City Hall', '2026-04-10', '2026-04-10');
GO


-- ================================================
-- BENEFICIARY LINKING
-- ================================================
INSERT INTO Beneficiary_On_Event (BeneficiaryID, EventID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(6,8),
(10,9),
(10,10),
(8,11),
(1,12),
(9,13),
(10,14),
(9,15);
GO


-- ================================================
-- VOLUNTEER PARTICIPATION
-- ================================================
INSERT INTO User_On_Event (UserID, EventID, SkillID, WorkHours)
VALUES
(2,1,1,5.0),
(2,2,3,4.0),
(4,3,9,3.0),
(5,4,5,6.0),
(8,5,7,5.5),
(7,6,12,7.0),
(10,7,10,4.0),
(12,8,18,3.5),
(14,9,14,6.0),
(16,10,6,4.5),
(18,11,20,5.0),
(20,12,17,4.0),
(5,13,11,3.0),
(8,14,2,4.5),
(10,15,10,5.0);
GO


-- ================================================
-- DONATIONS
-- ================================================
INSERT INTO Donation (UserID, EventID, Amount, Donation_Date)
VALUES
(3,1,500.00,'2025-02-01'),
(4,1,1000.00,'2025-02-01'),
(3,2,300.00,'2025-03-11'),
(4,3,750.00,'2025-04-05'),
(6,4,1200.00,'2025-05-15'),
(3,5,400.00,'2025-06-20'),
(6,6,1500.00,'2025-07-12'),
(9,7,800.00,'2025-08-01'),
(13,8,950.00,'2025-09-05'),
(15,9,700.00,'2025-10-02'),
(19,10,1100.00,'2025-11-01'),
(13,11,500.00,'2025-12-03'),
(3,12,1300.00,'2026-01-15'),
(6,14,2000.00,'2026-03-21'),
(19,15,2500.00,'2026-04-10');
GO
