-- Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- =====================
-- 1. Department Table (لازم يتعمل الأول لأنه Referenced من Employee & Project)
-- =====================
CREATE TABLE Department (
    Dnum INT PRIMARY KEY,
    Dname VARCHAR(100) UNIQUE NOT NULL,
    Location VARCHAR(100),
    ManagerSSN INT UNIQUE
);

-- =====================
-- 2. Employee Table
-- =====================
CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    SupervisorSSN INT,
    Dnum INT,
    CONSTRAINT FK_Supervisor FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN),
    CONSTRAINT FK_EmpDept FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

-- (بعد ما Employee اتعمل، نضيف Constraint Manager)
ALTER TABLE Department
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN);

-- =====================
-- 3. Project Table
-- =====================
CREATE TABLE Project (
    Pnum INT PRIMARY KEY,
    Pname VARCHAR(100) UNIQUE NOT NULL,
    Location VARCHAR(100),
    City VARCHAR(100),
    Dnum INT,
    CONSTRAINT FK_ProjDept FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

-- =====================
-- 4. Works_On (Relation between Employee & Project with Hours)
-- =====================
CREATE TABLE Works_On (
    SSN INT,
    Pnum INT,
    Hours DECIMAL(5,2),
    PRIMARY KEY (SSN, Pnum),
    CONSTRAINT FK_WorkEmp FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    CONSTRAINT FK_WorkProj FOREIGN KEY (Pnum) REFERENCES Project(Pnum)
);

-- =====================
-- 5. Dependent Table
-- =====================
CREATE TABLE Dependent (
    SSN INT,
    Dname VARCHAR(100),
    BirthDate DATE,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    PRIMARY KEY (SSN, Dname),
    CONSTRAINT FK_DepEmp FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);







-- =====================
-- 1. Insert Departments
-- =====================
INSERT INTO Department (Dnum, Dname, Location, ManagerSSN)
VALUES
(1, 'HR', 'Cairo', NULL),
(2, 'IT', 'Giza', NULL),
(3, 'Finance', 'Alexandria', NULL),
(4, 'Marketing', 'Cairo', NULL),
(5, 'Operations', 'Mansoura', NULL);

-- =====================
-- 2. Insert Employees
-- =====================
INSERT INTO Employee (SSN, Name, BirthDate, Gender, SupervisorSSN, Dnum)
VALUES
(101, 'Ahmed Ali', '1985-03-10', 'M', NULL, 1),   -- Manager HR
(102, 'Sara Mohamed', '1990-07-15', 'F', 101, 2), -- Manager IT
(103, 'Omar Hassan', '1988-01-22', 'M', 101, 3),  -- Manager Finance
(104, 'Mona Youssef', '1992-11-05', 'F', 102, 4), -- Manager Marketing
(105, 'Khaled Ibrahim', '1987-09-18', 'M', 103, 5); -- Manager Operations

-- =====================
-- 3. Update Departments with Managers
-- =====================
UPDATE Department SET ManagerSSN = 101 WHERE Dnum = 1;
UPDATE Department SET ManagerSSN = 102 WHERE Dnum = 2;
UPDATE Department SET ManagerSSN = 103 WHERE Dnum = 3;
UPDATE Department SET ManagerSSN = 104 WHERE Dnum = 4;
UPDATE Department SET ManagerSSN = 105 WHERE Dnum = 5;

-- =====================
-- 4. Insert Projects
-- =====================
INSERT INTO Project (Pnum, Pname, Location, City, Dnum)
VALUES
(201, 'Payroll System', 'Nasr City', 'Cairo', 3),
(202, 'Website Redesign', 'Dokki', 'Giza', 2),
(203, 'Recruitment Campaign', 'Heliopolis', 'Cairo', 1),
(204, 'Market Research', 'Smouha', 'Alexandria', 4),
(205, 'Logistics Optimization', 'Talkha', 'Mansoura', 5);

-- =====================
-- 5. Insert Works_On
-- =====================
INSERT INTO Works_On (SSN, Pnum, Hours)
VALUES
(101, 203, 10.5),
(102, 202, 15.0),
(103, 201, 12.0),
(104, 204, 20.0),
(105, 205, 18.5);

-- =====================
-- 6. Insert Dependents
-- =====================
INSERT INTO Dependent (SSN, Dname, BirthDate, Gender)
VALUES
(101, 'Ali Ahmed', '2010-06-01', 'M'),
(102, 'Mariam Sara', '2015-09-12', 'F'),
(103, 'Youssef Omar', '2012-03-22', 'M'),
(104, 'Hana Mona', '2018-07-30', 'F'),
(105, 'Omar Khaled', '2014-11-15', 'M');







ALTER TABLE Department DROP CONSTRAINT FK_Manager;
ALTER TABLE Department DROP CONSTRAINT UQ__Departme__A2B4C20F3D6243E5; -- اسم الـ Constraint اللي ظاهر في الرسالة
ALTER TABLE Department ALTER COLUMN ManagerSSN INT NULL;
ALTER TABLE Department ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN);



INSERT INTO Department (Dnum, Dname, Location)
VALUES
(1, 'HR', 'Cairo'),
(2, 'IT', 'Giza'),
(3, 'Finance', 'Alexandria'),
(4, 'Marketing', 'Cairo'),
(5, 'Operations', 'Mansoura');



UPDATE Department SET ManagerSSN = 101 WHERE Dnum = 1;
UPDATE Department SET ManagerSSN = 102 WHERE Dnum = 2;
UPDATE Department SET ManagerSSN = 103 WHERE Dnum = 3;
UPDATE Department SET ManagerSSN = 104 WHERE Dnum = 4;
UPDATE Department SET ManagerSSN = 105 WHERE Dnum = 5;
