-- Subqueries
-- It is a query within a query
SELECT * 
FROM employee_demographics
WHERE employee_id IN  
                  (SELECT employee_id 
                    FROM employee_salary
                    WHERE dept_id=1
)
;


SELECT first_name,salary,
(SELECT AVG(SALARY) 
FROM employee_salary ) AS avg_salary
FROM employee_salary;

SELECT gender,AVG(age),MIN(age),MAX(age),COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(`MAX(age)`) -- (`MAX(age)`) it represents max(age) column.
 FROM
(SELECT gender,AVG(age),MIN(age),MAX(age),COUNT(age)
FROM employee_demographics
GROUP BY gender) AS agg_table
GROUP BY gender;

