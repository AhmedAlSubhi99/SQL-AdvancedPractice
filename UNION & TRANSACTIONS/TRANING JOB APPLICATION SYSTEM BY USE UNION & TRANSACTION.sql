
-- Trainees Table 
CREATE TABLE Trainees 
( 
TraineeID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
Program VARCHAR(50), 
GraduationDate DATE 
); 

-- Job Applicants Table 
CREATE TABLE Applicants
( 
ApplicantID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
Source VARCHAR(20), -- e.g., "Website", "Referral" 
AppliedDate DATE 
); 
-- Insert into Trainees 
INSERT INTO Trainees VALUES 
(1, 'Layla Al Riyami', 'layla.r@example.com', 'Full Stack .NET', '2025-04-30'), 
(2, 'Salim Al Hinai', 'salim.h@example.com', 'Outsystems', '2025-03-15'), 
(3, 'Fatma Al Amri', 'fatma.a@example.com', 'Database Admin', '2025-05-01'); -- Insert into Applicants 
INSERT INTO Applicants VALUES 
(101, 'Hassan Al Lawati', 'hassan.l@example.com', 'Website', '2025-05-02'), 
(102, 'Layla Al Riyami', 'layla.r@example.com', 'Referral', '2025-05-05'), -- same person as trainee 
(103, 'Aisha Al Farsi', 'aisha.f@example.com', 'Website', '2025-04-28');


-- (1) USE UNION

-- 1. List all unique people who either trained or applied for a job. 
SELECT FullName, Email FROM Trainees
UNION
SELECT FullName, Email FROM Applicants;

-- 2. Now use UNION ALL. What changes in the result? 
SELECT FullName, Email FROM Trainees
UNION ALL
SELECT FullName, Email FROM Applicants;
-- Due to the UNION ALL dose not eliminate the duplicates.

-- 3. Find people who are in both tables. 
--By use INTERSECT
SELECT FullName, Email FROM Trainees
INTERSECT
SELECT FullName, Email FROM Applicants;

-- Or we can use INNER JOIN
--SELECT t.FullName, t.Email
--FROM Trainees t
--INNER JOIN Applicants a ON t.Email = a.Email;

-- (2) DROP, DELETE, TRUNCATE Observation 

-- 4. Try DELETE FROM Trainees WHERE Program = 'Outsystems'. 
DELETE FROM Trainees
WHERE Program = 'Outsystems';

Select * FROM Trainees;

-- 5. Try TRUNCATE TABLE Applicants. 
TRUNCATE TABLE Applicants;

Select * FROM Applicants;

-- 6. Try DROP TABLE Applicants. 
DROP TABLE Applicants;

Select * FROM Applicants; -- It show error is Msg 208, Level 16, State 1, Line 72 Invalid object name 'Applicants'. due to we are dropped the Applicants.

-- 7. observations after each command.
-- DELETE FROM Trainees WHERE Program = 'Outsystems'
-- Only matching rows are deleted. Table structure remains. Can be rolled back.

-- TRUNCATE TABLE Applicants
-- All rows are deleted. Table structure remains. Cannot be rolled back.

-- DROP TABLE Applicants
-- Table is completely removed. Cannot select from it afterward. Cannot be rolled back.
