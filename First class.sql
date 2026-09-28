CREATE DATABASE check_point

USE check_point
DROP TABLE IF EXISTS employee_project;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee; 
DROP TABLE IF EXISTS department;

-- Define data types and constraints for all attributes based on the schema:
--  Employee Table:

-- Num_E (Primary Key): INT
-- Name: VARCHAR(255)
-- Position: VARCHAR(255)
-- Salary: DECIMAL(10, 2)
-- Department_Num_S (Foreign Key): INT
--  Department Table:

-- Num_S (Primary Key): INT
-- Label: VARCHAR(255)
-- Manager_Name: VARCHAR(255)
--  Project Table:

-- Num_P (Primary Key): INT
-- Title: VARCHAR(255)
-- Start_Date: DATE
-- End_Date: DATE
-- Department_Num_S (Foreign Key): INT
 

-- Employee_Project Table:

-- Employee_Num_E (Foreign Key): INT
-- Project_Num_P (Foreign Key): INT
-- Role: VARCHAR(255)
 
 

CREATE TABLE department(
    Num_S INT PRIMARY KEY,
    label VARCHAR(255) NOT NULL,
    managers_name VARCHAR(255) NOT NULL
);

CREATE TABLE employee (
    Num_E INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255) DEFAULT 'Executive Staff',
    salary DECIMAL(10,2) CHECK (salary > 77000),
    dept_no INT,
    CONSTRAINT emp_dept_fk FOREIGN KEY (dept_no) REFERENCES department(Num_S)
);

CREATE TABLE project(
    Num_P INT PRIMARY KEY,
    title VARCHAR(255) UNIQUE NOT NULL,
    start_date DATE,
    end_date DATE,
    dept_no INT,
    CONSTRAINT date_validation CHECK (end_date >= start_date),
    CONSTRAINT proj_dept_fk FOREIGN KEY (dept_no) REFERENCES department(Num_S)
);

CREATE TABLE employee_project (
    ID INT PRIMARY KEY,
    emp_no INT,
    proj_no INT,
    role VARCHAR(255) NOT NULL,

    CONSTRAINT emp_emp_proj_fk FOREIGN KEY (emp_no) REFERENCES employee(Num_E),
    CONSTRAINT proj_emp_porj_fk FOREIGN KEY (proj_no) REFERENCES project(Num_P)
);


-- Instructions
-- Here is the list of records we are going to use:

 

-- Department

-- Num_S = 1, Label = "IT", Manager_Name = "Alice Johnson"
-- Num_S = 2, Label = "HR", Manager_Name = "Bob Smith"
-- Num_S = 3, Label = "Marketing", Manager_Name = "Clara Bennett"
-- Employee

-- Num_E = 101, Name = "John Doe", Position = "Developer", Salary = 60000.00, Department_Num_S = 1
-- Num_E = 102, Name = "Jane Smith", Position = "Analyst", Salary = 55000.00, Department_Num_S = 2
-- Num_E = 103, Name = "Mike Brown", Position = "Designer", Salary = 50000.00, Department_Num_S = 3
-- Num_E = 104, Name = "Sarah Johnson", Position = "Data Scientist", Salary = 70000.00, Department_Num_S = 1
-- Num_E = 105, Name = "Emma Wilson", Position = "HR Specialist", Salary = 52000.00, Department_Num_S = 2
-- Project

-- Num_P = 201, Title = "Website Redesign", Start_Date = "2024-01-15", End_Date = "2024-06-30", Department_Num_S = 1
-- Num_P = 202, Title = "Employee Onboarding", Start_Date = "2024-03-01", End_Date = "2024-09-01", Department_Num_S = 2
-- Num_P = 203, Title = "Market Research", Start_Date = "2024-02-01", End_Date = "2024-07-31", Department_Num_S = 3
-- Num_P = 204, Title = "IT Infrastructure Setup", Start_Date = "2024-04-01", End_Date = "2024-12-31", Department_Num_S = 1
-- Employee_Project (Roles)

-- Employee_Num_E = 101, Project_Num_P = 201, Role = "Frontend Developer"
-- Employee_Num_E = 104, Project_Num_P = 201, Role = "Backend Developer"
-- Employee_Num_E = 102, Project_Num_P = 202, Role = "Trainer"
-- Employee_Num_E = 105, Project_Num_P = 202, Role = "Coordinator"
-- Employee_Num_E = 103, Project_Num_P = 203, Role = "Research Lead"
-- Employee_Num_E = 101, Project_Num_P = 204, Role = "Network Specialist"
-- Instructions

-- Insert Records:  Write the appropriate SQL queries to insert all the provided records into their respective tables.
-- Update a Record: Update the Role of Employee_Num_E = 101 in the Employee_Project table to "Full Stack Developer".
-- Delete a Record: Delete the employee with Num_E = 103 from the Employee table and remove their corresponding entries in the Employee_Project table
 
  