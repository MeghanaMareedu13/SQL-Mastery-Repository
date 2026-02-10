-- SQL Mastery Repository: Day 3 of 30-Day Challenge
-- Sample Data Population

-- Insert Departments
INSERT INTO departments (dept_name, location) VALUES 
('Engineering', 'Austin'),
('Data Science', 'Dallas'),
('Business Analysis', 'Houston'),
('Sales', 'Sugar Land'),
('HR', 'Austin');

-- Insert Employees
INSERT INTO employees (first_name, last_name, dept_id, hire_date, salary, manager_id) VALUES 
('Meghana', 'Mareedu', 2, '2024-05-15', 95000, NULL),
('Raj', 'Kumar', 1, '2022-01-10', 85000, 1),
('Sarah', 'Chen', 2, '2023-03-12', 90000, 1),
('Michael', 'Brown', 3, '2021-11-20', 78000, 1),
('Priya', 'Patel', 4, '2022-06-05', 72000, 1),
('David', 'Miller', 1, '2023-08-14', 82000, 2),
('Emma', 'Wilson', 3, '2024-01-20', 75000, 4);

-- Insert Projects
INSERT INTO projects (project_name, budget, start_date, end_date) VALUES 
('Cloud Migration', 500000, '2024-01-01', '2024-12-31'),
('Data Analytics Pipeline', 250000, '2024-03-01', '2024-09-30'),
('User Acceptance Testing', 100000, '2024-05-01', '2024-07-31'),
('Market Expansion', 300000, '2024-02-15', '2024-11-15');

-- Insert Employee_Projects
INSERT INTO employee_projects (emp_id, project_id, hours_allocated) VALUES 
(1, 1, 20), (1, 2, 20),
(2, 1, 40), (3, 2, 40),
(4, 3, 30), (5, 4, 40),
(6, 1, 35), (7, 3, 25);

-- Insert Sales
INSERT INTO sales (emp_id, sale_date, amount, region) VALUES 
(5, '2024-01-10', 5000, 'North'),
(5, '2024-02-15', 7000, 'South'),
(5, '2024-03-20', 4500, 'North'),
(3, '2024-01-05', 2000, 'East'),
(1, '2024-05-20', 12000, 'South'),
(5, '2024-04-10', 8000, 'West'),
(3, '2024-02-10', 3500, 'East');
