-- ====================================================
--  DUMMY DATA FOR VCMS (EXTENDED AND IMPROVED VERSION)
--  20 Users | 15 Events | Full Relationships
--  Improvements:
--  - Added more volunteers to each event (3-5 per event for better report variety)
--  - Assigned additional skills to more users
--  - Added more donations across events
--  - Linked additional beneficiaries to some events for multi-beneficiary scenarios
--  - Increased skill assignments for volunteers
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
-- SKILL ASSIGNMENTS (Expanded for more users and variety)
-- ================================================
INSERT INTO Skill_On_User (UserID, SkillID)
VALUES
(2,1),(2,3),(2,4),(2,16),  -- Bob: Added First Aid
(4,9),(4,11),(4,20),  -- Diana: Added Event Planner and Coordinator
(5,5),(5,11),(5,15),  -- Ethan: Added Electrician
(8,2),(8,7),(8,8),(8,13),  -- Hannah: Added Counselor and Translator
(7,12),(7,19),  -- George: Added Graphic Designer
(10,10),(10,14),  -- Jade: Added Social Media Manager
(12,18),(12,6),  -- Laura: Added Fundraiser
(14,14),(14,17),  -- Natalie: Added Gardener
(16,6),(16,18),  -- Paula: Added Public Speaker
(17,19),(17,12),  -- Quinn: Added IT Support
(18,20),(18,9),  -- Ryan: Added Logistics
(20,17),(20,2),(20,5),  -- Thomas: Added Cleaner and Security
(5,1),  -- Ethan: Added Medic
(8,4),  -- Hannah: Added Driver
(10,3),  -- Jade: Added Cook
(12,5),  -- Laura: Added Security
(14,7),  -- Natalie: Added Teacher
(16,10),  -- Paula: Added Photographer
(18,11),  -- Ryan: Added Event Planner
(20,13);  -- Thomas: Added Translator
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
-- BENEFICIARY LINKING (Added multiples for some events)
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
(6,8),(9,8),  -- Added Children's Fund to Back to School
(10,9),
(10,10),
(8,11),
(1,12),(5,12),  -- Added Elder Care to Health Fair
(9,13),
(10,14),
(9,15),(10,15),(1,15);  -- Added multiples to Fundraiser Gala
GO
-- ================================================
-- VOLUNTEER PARTICIPATION (Expanded: 3-5 volunteers per event with varied skills and hours)
-- ================================================
INSERT INTO User_On_Event (UserID, EventID, SkillID, WorkHours)
VALUES
-- Event 1: Charity Run (5 volunteers)
(2,1,1,5.0),
(5,1,5,4.5),
(8,1,2,6.0),
(10,1,10,3.5),
(12,1,18,4.0),
-- Event 2: Food Drive (4 volunteers)
(2,2,3,4.0),
(14,2,14,5.5),
(16,2,6,3.0),
(18,2,20,4.5),
-- Event 3: Youth Workshop (3 volunteers)
(4,3,9,3.0),
(20,3,17,5.0),
(5,3,11,4.0),
-- Event 4: Animal Rescue Day (5 volunteers)
(5,4,5,6.0),
(8,4,7,5.0),
(10,4,10,4.5),
(12,4,18,3.5),
(14,4,14,6.0),
-- Event 5: Senior Outreach (4 volunteers)
(8,5,7,5.5),
(16,5,6,4.0),
(18,5,20,5.5),
(20,5,17,3.0),
-- Event 6: Tech for Good (3 volunteers)
(7,6,12,7.0),
(2,6,1,4.5),
(4,6,11,6.0),
-- Event 7: Clean Water Drive (5 volunteers)
(10,7,10,4.0),
(5,7,15,5.0),
(8,7,13,4.0),
(12,7,6,3.5),
(14,7,17,6.5),
-- Event 8: Back to School (4 volunteers)
(12,8,18,3.5),
(16,8,10,5.0),
(18,8,11,4.0),
(20,8,13,5.5),
-- Event 9: Tree Planting Day (3 volunteers)
(14,9,14,6.0),
(2,9,16,4.5),
(5,9,1,3.0),
-- Event 10: Community Cleanup (5 volunteers)
(16,10,6,4.5),
(8,10,2,6.0),
(10,10,14,5.0),
(12,10,5,4.0),
(14,10,7,3.5),
-- Event 11: Habitat Build (4 volunteers)
(18,11,20,5.0),
(20,11,5,6.0),
(2,11,4,4.5),
(4,11,20,5.5),
-- Event 12: Health Fair (5 volunteers)
(20,12,17,4.0),
(5,12,11,5.0),
(8,12,8,6.5),
(10,12,3,4.0),
(12,12,18,3.5),
-- Event 13: Children’s Day (3 volunteers)
(5,13,11,3.0),
(14,13,14,4.5),
(16,13,18,5.0),
-- Event 14: Green Earth Expo (4 volunteers)
(8,14,2,4.5),
(18,14,9,5.5),
(20,14,2,4.0),
(2,14,3,6.0),
-- Event 15: Fundraiser Gala (5 volunteers)
(10,15,10,5.0),
(4,15,9,4.5),
(5,15,5,6.0),
(8,15,7,3.5),
(12,15,6,5.0);
GO
-- ================================================
-- DONATIONS (Expanded with more entries and varied amounts)
-- ================================================
INSERT INTO Donation (UserID, EventID, Amount, Donation_Date)
VALUES
(3,1,500.00,'2025-02-01'),
(4,1,1000.00,'2025-02-01'),
(6,1,750.00,'2025-02-01'),
(9,1,300.00,'2025-02-01'),
(3,2,300.00,'2025-03-11'),
(13,2,400.00,'2025-03-11'),
(15,2,600.00,'2025-03-11'),
(4,3,750.00,'2025-04-05'),
(19,3,500.00,'2025-04-05'),
(6,4,1200.00,'2025-05-15'),
(3,4,800.00,'2025-05-15'),
(6,4,900.00,'2025-05-16'),
(3,5,400.00,'2025-06-20'),
(9,5,1000.00,'2025-06-20'),
(6,6,1500.00,'2025-07-12'),
(13,6,1200.00,'2025-07-12'),
(15,6,700.00,'2025-07-13'),
(9,7,800.00,'2025-08-01'),
(19,7,950.00,'2025-08-02'),
(13,8,950.00,'2025-09-05'),
(3,8,600.00,'2025-09-05'),
(15,9,700.00,'2025-10-02'),
(6,9,1100.00,'2025-10-02'),
(9,9,400.00,'2025-10-02'),
(19,10,1100.00,'2025-11-01'),
(13,10,500.00,'2025-11-01'),
(13,11,500.00,'2025-12-03'),
(15,11,800.00,'2025-12-04'),
(19,11,1200.00,'2025-12-05'),
(3,12,1300.00,'2026-01-15'),
(6,12,1500.00,'2026-01-15'),
(6,14,2000.00,'2026-03-21'),
(9,14,1000.00,'2026-03-21'),
(13,14,750.00,'2026-03-22'),
(19,15,2500.00,'2026-04-10'),
(3,15,2000.00,'2026-04-10'),
(6,15,1800.00,'2026-04-10'),
(15,15,900.00,'2026-04-10');
GO