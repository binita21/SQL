-- CTEs (Common Table Expression)
-- A CTE is a way to create a temporary result inside SQL query and then use that result in another query.

WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
      ON dem.employee_id = sal.employee_id
GROUP BY gender
)
-- SELECT *  --> This will display all the result of CTE_example
SELECT AVG(avg_sal)
FROM CTE_Example; 
-- --> this will return average of average salary from CTE_Example


-- MULTIPLE CTEs
WITH CTE_Example AS
(
SELECT employee_id,gender,birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT  employee_id,salary
FROM employee_salary
WHERE salary > 50000)
SELECT * FROM CTE_Example
JOIN CTE_Example2 
ON CTE_Example.employee_id = CTE_Example2.employee_id;


WITH CTE_Example(Gender,Avg_sal,Max_Sal,Min_sal,Count) AS 
-- --> instead of the colun name aliased in select portion it will use the one with the CTES parenthesis names 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
      ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example; 
