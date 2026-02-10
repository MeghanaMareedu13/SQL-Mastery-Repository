-- SQL Mastery Repository: Day 3 of 30-Day Challenge
-- Schema Setup for Sales & Employee Performance

-- 1. Departments Table
CREATE TABLE IF NOT EXISTS departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

-- 2. Employees Table
CREATE TABLE IF NOT EXISTS employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT REFERENCES departments(dept_id),
    hire_date DATE DEFAULT CURRENT_DATE,
    salary DECIMAL(10, 2),
    manager_id INT
);

-- 3. Projects Table
CREATE TABLE IF NOT EXISTS projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12, 2),
    start_date DATE,
    end_date DATE
);

-- 4. Employee_Projects (Many-to-Many)
CREATE TABLE IF NOT EXISTS employee_projects (
    emp_id INT REFERENCES employees(emp_id),
    project_id INT REFERENCES projects(project_id),
    hours_allocated INT,
    PRIMARY KEY (emp_id, project_id)
);

-- 5. Sales Table
CREATE TABLE IF NOT EXISTS sales (
    sale_id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES employees(emp_id),
    sale_date DATE DEFAULT CURRENT_DATE,
    amount DECIMAL(10, 2) NOT NULL,
    region VARCHAR(30)
);
