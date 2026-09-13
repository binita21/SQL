-- Find the difference between the total number of occupation entries in the table and the number of distinct occupation entries in the table.

-- SELECT occupation from employee_salary;
SELECT count(occupation)-count(DISTINCT occupation)
from employee_salary;

-- 
SELECT occupation,length(occupation)
FROM employee_salary
ORDER BY  length(occupation), occupation ASC
LIMIT 1;

SELECT occupation,length(occupation)
FROM employee_salary
ORDER BY  length(occupation), occupation DESC
LIMIT 1;


