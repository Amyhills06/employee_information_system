-- =====================================================
-- Employee Participation Information System
-- Data Definition Checkpoint
-- ======================================================

CREATE DATABASE check_point;

USE check_point

DROP TABLE IF EXISTS employee_project;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- ===========================================================
-- Table Creation
-- ============================================================

-- Department Table
CREATE TABLE department (
    Num_S INT PRIMARY KEY,
    label VARCHAR(255) NOT NULL,
    managers_name VARCHAR(255) NOT NULL
);

-- Employee Table
CREATE TABLE employee (
    Num_E INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255) DEFAULT 'Executive Staff',
    salary DECIMAL(10,2) CHECK (salary > 0),
    dept_no INT,
    CONSTRAINT emp_dept_fk FOREIGN KEY (dept_no) REFERENCES department(Num_S)
);

-- Project Table
CREATE TABLE project (
    Num_P INT PRIMARY KEY,
    title VARCHAR(255) UNIQUE NOT NULL,
    start_date DATE,
    end_date DATE,
    dept_no INT,
    CONSTRAINT date_validation CHECK (end_date >= start_date),
    CONSTRAINT proj_dept_fk FOREIGN KEY (dept_no) REFERENCES department(Num_S)
);

-- Employee_Project Table (tracks employee roles in projects)
CREATE TABLE employee_project (
    ID INT PRIMARY KEY,
    emp_no INT,
    proj_no INT,
    role VARCHAR(255) NOT NULL,
    CONSTRAINT emp_emp_proj_fk FOREIGN KEY (emp_no) REFERENCES employee(Num_E),
    CONSTRAINT proj_emp_proj_fk FOREIGN KEY (proj_no) REFERENCES project(Num_P)
);

-- Insert Records
-- ============================================================

-- Department
INSERT INTO department (Num_S, label, managers_name) VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');

-- Employee
INSERT INTO employee (Num_E, name, position, salary, dept_no) VALUES
(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

-- Project
INSERT INTO project (Num_P, title, start_date, end_date, dept_no) VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

-- Employee_Project (Roles)
INSERT INTO employee_project (ID, emp_no, proj_no, role) VALUES
(1, 101, 201, 'Frontend Developer'),
(2, 104, 201, 'Backend Developer'),
(3, 102, 202, 'Trainer'),
(4, 105, 202, 'Coordinator'),
(5, 103, 203, 'Research Lead'),
(6, 101, 204, 'Network Specialist');

-- Update a Record
-- ============================================================
 
-- Update the Role of Employee_Num_E = 101 in the Employee_Project
-- table (for the Website Redesign project) to "Full Stack Developer"
UPDATE employee_project
SET role = 'Full Stack Developer'
WHERE emp_no = 101;

-- Delete a Record
-- ============================================================
 
-- Delete the employee with Num_E = 103 from the Employee table
-- and remove their corresponding entries in the Employee_Project table.
-- Child rows (Employee_Project) must be deleted first to satisfy
-- the foreign key constraint before deleting the parent Employee row.
DELETE FROM employee_project WHERE emp_no = 103;
DELETE FROM employee WHERE Num_E = 103;

