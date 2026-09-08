-- In SQL, window functions perform calculations across a group of related rows without collapsing those rows into one result.

-- Over will add salary of all genders altogether but preserve the rows, it will show all rows but all rows will have avg salary as 56090.9091
SELECT gender, AVG(salary) OVER() as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
on dem.employee_id=sal.employee_id
;  

-- Now, the partition by will group the same gender and creates separate male and female window and generate avg salary for male and female separately, and the over used with partition by will help to show the separate male and female's avg salary calculated preserving each male and female rows.
SELECT gender, AVG(salary) OVER(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
on dem.employee_id=sal.employee_id
;


SELECT dem.first_name,dem.last_name,gender, AVG(salary) 
FROM employee_demographics dem
JOIN employee_salary sal
on dem.employee_id=sal.employee_id
GROUP BY dem.first_name, dem.last_name,gender;
;



-- FUNCTION → What calculation do I want?

-- OVER() → I want a window function and want to keep my rows.

-- PARTITION BY → Which groups should have separate calculations?

-- ORDER BY → In what order should the calculation happen?

-- "Take males separately and females separately. Within each group, go employee by employee according to employee ID, and keep adding their salaries."
SELECT dem.first_name, dem.last_name,gender,salary, SUM(salary)  OVER (PARTITION BY gender ORDER BY dem.employee_id) as rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
;


