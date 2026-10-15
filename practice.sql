-- Find the difference between the total number of occupation entries in the table and the number of distinct occupation entries in the table.

-- SELECT occupation from employee_salary;
SELECT count(occupation)-count(DISTINCT occupation)
from employee_salary;

-- Find the occupation with the shortest name and the occupation with the longest name. If there are multiple occupations with the same length, return the first one in alphabetical order.
SELECT occupation,length(occupation)
FROM employee_salary
ORDER BY  length(occupation), occupation ASC
LIMIT 1;

SELECT occupation,length(occupation)
FROM employee_salary
ORDER BY  length(occupation) DESC, occupation 
LIMIT 1;


