-- create database employee; 
-- use employee;

SELECT * FROM employee; 

-- Who is each employee's manager?
SELECT e.id As employee_id,e.name as Employee,
e.manager_id as manager_id,m.name as Manager 
FROM employee e
JOIN employee m
on e.manager_id = m.id;

-- Display the employees whose salary is greater than their managers
SELECT e.id As employee_id,e.name as Employee,e.salary as Employee_salary,
 e.manager_id as manager_id,m.name as Manager,m.salary as Manager_salary
FROM employee e
JOIN employee m
on e.manager_id = m.id
WHERE e.salary>m.salary
;

 -- How many employees report to each manager?
 SELECT
    m.name AS manager,
    COUNT(e.id) AS total_employees
FROM Employee e
JOIN Employee m
    ON e.manager_id = m.id
GROUP BY m.name;

-- FInd total salary of employees working under each manager
SELECT m.name as Manager,
SUM(e.salary) AS total_salary
FROM employee e
JOIN employee m
on e.manager_id = m.id 
GROUP BY m.name ;


 -- "Find managers who have more than one employee reporting to them."
 SELECT
    m.name AS manager,
    COUNT(e.id) AS total_employees
FROM Employee e
JOIN Employee m
    ON e.manager_id = m.id
GROUP BY m.name
HAVING total_employees>1;


    
-- Write a solution to report the name and bonus amount of each employee who satisfies either of the following:

-- The employee has a bonus less than 1000.
-- The employee did not get any bonus.
-- Return the result table in any order.

# Write your MySQL query statement below
SELECT e.name,b.bonus 
FROM Employee e
LEFT JOIN Bonus b
on e.empId = b.empId
WHERE b.bonus<1000 OR b.bonus IS NULL;

-- Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. 
-- Note that when an employee belongs to only one department, their primary column is 'N'.
-- Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
-- Return the result table in any order.



SELECT employee_id,department_id
FROM Employeedepartment
WHERE primary_flag='Y'
UNION
SELECT employee_id, department_id
FROM Employeedepartment
WHERE employee_id IN (
    SELECT employee_id
    FROM Employeedepartment
    GROUP BY employee_id
    HAVING COUNT(*) = 1
)
ORDER BY employee_id;