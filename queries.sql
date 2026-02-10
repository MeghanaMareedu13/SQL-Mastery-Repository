-- SQL Mastery Repository: Day 3 of 30-Day Challenge
-- Comprehensive SQL Queries: From Basics to Advanced

-- ==========================================================
-- 1. LEVEL: INTERMEDIATE (Window Functions)
-- Use Case: Rank employees by salary within each department
-- ==========================================================
SELECT 
    e.first_name, 
    e.last_name, 
    d.dept_name, 
    e.salary,
    RANK() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) as salary_rank
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;


-- ==========================================================
-- 2. LEVEL: ADVANCED (Common Table Expressions - CTE)
-- Use Case: Find the highest earning department and its total budget
-- ==========================================================
WITH DeptSalary AS (
    SELECT 
        dept_id, 
        SUM(salary) as total_dept_salary
    FROM employees
    GROUP BY dept_id
)
SELECT 
    d.dept_name, 
    ds.total_dept_salary
FROM DeptSalary ds
JOIN departments d ON ds.dept_id = d.dept_id
ORDER BY ds.total_dept_salary DESC
LIMIT 1;


-- ==========================================================
-- 3. LEVEL: INTERMEDIATE (Aggregations & Joins)
-- Use Case: Project budget utilization by employee allocation
-- ==========================================================
SELECT 
    p.project_name, 
    p.budget, 
    COUNT(ep.emp_id) as assigned_employees,
    SUM(ep.hours_allocated) as total_hours
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name, p.budget;


-- ==========================================================
-- 4. LEVEL: ADVANCED (Recursive CTE)
-- Use Case: Organizational Hierarchy (Manager -> Emp)
-- ==========================================================
WITH RECURSIVE OrgChart AS (
    -- Anchor member
    SELECT emp_id, first_name, last_name, manager_id, 1 as level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive member
    SELECT e.emp_id, e.first_name, e.last_name, e.manager_id, oc.level + 1
    FROM employees e
    INNER JOIN OrgChart oc ON e.manager_id = oc.emp_id
)
SELECT * FROM OrgChart ORDER BY level;


-- ==========================================================
-- 5. LEVEL: EXPERT (Running Totals & Moving Averages)
-- Use Case: Monthly sales growth and 3-month moving average
-- ==========================================================
SELECT 
    sale_date,
    amount,
    SUM(amount) OVER (ORDER BY sale_date) as running_total,
    AVG(amount) OVER (ORDER BY sale_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as moving_avg_3_days
FROM sales;
