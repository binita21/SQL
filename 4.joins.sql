-- JOINS
-- SQL Joins are used to combine data from two or more tables based on a related column. 

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

-- INNER JOIN (By default join)
-- RETURN RECORDS SAME IN BOTH TABLES.

SELECT * FROM employee_demographics 
INNER JOIN employee_salary
-- ON employee_id = employee_id; -- it is ambiguous and throws error as we have not reference table name.
ON employee_demographics.employee_id = employee_salary.employee_id;  -- This will only return the records with the same value on the employee_id.


SELECT * FROM employee_demographics  as dem
INNER JOIN employee_salary as sal
on dem.employee_id = sal.employee_id;

SELECT dem.employee_id,age,occupation FROM employee_demographics  as dem
INNER JOIN employee_salary as sal
on dem.employee_id = sal.employee_id;

-- OUTER jOins
-- SQL provides the OUTER JOIN to return both matching and non-matching rows from two tables. 
-- Outer left join --> takes everything from left table but only return matching rows from the right side


SELECT * FROM employee_demographics  as dem
LEFT OUTER  JOIN employee_salary as sal
on dem.employee_id = sal.employee_id;

-- RIGHT JOIN is used to retrieve all rows from the right table and the matching rows from the left table.
SELECT * FROM employee_demographics  as dem
right JOIN employee_salary as sal
on dem.employee_id = sal.employee_id;

-- SELF join
-- combining the table with itself.
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_id,
emp2.first_name AS first_name,
emp2.last_name AS last_name
 FROM employee_salary as emp1
JOIN employee_salary as emp2
ON emp1.employee_id + 1 = emp2.employee_id
;

-- JOining multiple tables together
SELECT *
FROM employee_demographics  as dem
INNER JOIN employee_salary as sal
on dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
ON sal.dept_id = pd.department_id;

-- SELECT * FROM parks_departments;

-- FULL join
-- Returns all rows from both the table, combination of left and right join


-- CROSS JOINS CREATES CARTESIAN PRODUCT OF the table
 SELECT * 
 FROM employee_salary 
 CROSS JOIN employee_demographics;





