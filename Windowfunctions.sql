SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
   on dem.employee_id=sal.employee_id;


