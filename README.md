# Employee Information System

An SQL Server database for tracking employees, departments, projects, and the roles employees play on projects. All the code is in First class.sql.

## DDL (Data Definition Language)
Used to create the structure of the database. I used `CREATE TABLE` to build four tables (department, employee, project, employee_project) with primary keys, foreign keys, and constraints.

## DML (Data Manipulation Language)
Used to work with the data inside the tables.
- INSERT adds the sample records.
- UPDATE changes employee 101's role to "Full Stack Developer".
- DELETE removes employee 103 and their project entries.
