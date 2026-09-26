-- Find the difference between the total number of occupation entries in the table and the number of distinct occupation entries in the table.

-- SELECT occupation from employee_salary;
SELECT count(occupation)-count(DISTINCT occupation)
from employee_salary;

--  	Query the two occupation in employee_salary with the shortest and longest occupation names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest , choose the one that comes first when ordered alphabetically.

SELECT occupation,length(occupation)
FROM employee_salary
ORDER BY  length(occupation), occupation ASC
LIMIT 1;

SELECT occupation,length(occupation)
FROM employee_salary 
ORDER BY length(occupation) DESC, occupation
LIMIT 1;

-- country starting with vowels (no duplicate countries)
 SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'A%'  OR
   country LIKE 'E%'
   OR country LIKE 'I%'
   OR country LIKE 'O%'
   OR country LIKE 'U%';

-- ALternative
 SELECT DISTINCT country
FROM layoffs_staging2
WHERE LEFT(country,1) IN ('A','E','I','O','U');


-- country ending with vowels (no duplicate countries)
SELECT DISTINCT country
FROM layoffs_staging2
WHERE RIGHT(country,1) IN ('a','e','i','o','u');


 SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE '%A'  OR
   country LIKE '%E'
   OR country LIKE '%I'
   OR country LIKE '%O'
   OR country LIKE '%U';
   
-- Starting and ending with vowels
SELECT DISTINCT country
FROM layoffs_staging2
WHERE RIGHT(country,1) IN ('a','e','i','o','u')
AND
LEFT(country,1) IN ('a','e','i','o','u');


SELECT DISTINCT country
FROM layoffs_staging2
WHERE (country LIKE '%A'  OR
   country LIKE '%E'
   OR country LIKE '%I'
   OR country LIKE '%O'
   OR country LIKE '%U')
   AND
   ( country LIKE 'A%'  
   OR country LIKE 'E%'
   OR country LIKE 'I%'
   OR country LIKE 'O%'
   OR country LIKE 'U%');
   
   -- Select list of country and should not start with vowels and should be distinct.
SELECT DISTINCT country
FROM layoffs_staging2
WHERE LEFT(country,1) NOT IN ('a','e','i','o','u');

  -- Select list of country and should not end with vowels and should be distinct.
SELECT DISTINCT country
FROM layoffs_staging2
WHERE RIGHT(country,1) NOT IN ('a','e','i','o','u');

-- Query the list of Country names from table that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT country
FROM layoffs_staging2
WHERE LEFT(country,1) NOT IN ('a','e','i','o','u')
OR RIGHT(country,1) NOT IN ('a','e','i','o','u')
;

-- Query the list of Country names from layoffs_staging2 that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT country
FROM layoffs_staging2
WHERE LEFT(country,1) NOT IN ('a','e','i','o','u')
AND RIGHT(country,1) NOT IN ('a','e','i','o','u');
;

-- Query the Name of any company in layoffs_staging2 whose fund_raised is higher than  200. Order your output by the last three characters of each name of company. 
-- If two or more company both have names ending in the same last three characters , secondary sort them by ascending date.
SELECT * FROM layoffs_staging2;
SELECT company
FROM layoffs_staging2
WHERE funds_raised_millions > 200
ORDER BY RIGHT(company,3) ,`date` ASC;

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
use parks_and_recreation;

SELECT * FROM employee_salary;
SELECT first_name
FROM employee_salary
ORDER BY first_name ASC;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in employee_salary having a salary greater than 50000 and dept_id > 3
--  Sort your result by ascending employee_id.
SELECT first_name
FROM employee_salary
WHERE salary > 50000 and dept_id > 3
order by employee_id ASC;

-- 1. Query an *alphabetically ordered* list of all names in **OCCUPATIONS**, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: `AnActorName(A)`, `ADoctorName(D)`, `AProfessorName(P)`, and `ASingerName(S)`.
SELECT CONCAT(first_name, '(', LEFT(occupation, 1), ')')
FROM employee_salary
ORDER BY first_name;

use parks_and_recreation;
SELECT *
FROM employee_salary;


-- Return first_name and last_name using friendly aliases.
SELECT DISTINCT first_name AS `First Name`, last_name AS `Last Name`
FROM employee_salary;

-- Return employee names with bonus calculated as salary * 0.10.
SELECT first_name,last_name,salary, salary*0.10 AS bonus
FROM employee_salary;

-- Return salary, last_name, and first_name in that exact left-to-right order.
SELECT salary,last_name,first_name
FROM employee_salary;

-- Return first_name with a constant record_type value of Employee.
SELECT first_name,
 'Employee' AS record_type
FROM employee_salary;


-- Return first_name, salary, and monthly_salary in this exact left-to-right order.; Calculate monthly_salary as salary divided by 12 and round it to 2 decimal places.
SELECT first_name, salary, round(salary/12,2) AS monthly_salary
FROM employee_salary;

-- Return one column named result with the value 2.
SELECT 1+1 as result;

-- Return staff_id, first_name, last_name, record_type, projected_bonus, and projected_total_compensation in this exact left-to-right order.; Alias employee_id as staff_id and use the text literal Employee as record_type.; Calculate projected_bonus as 10 percent of salary, rounded to 2 decimal places.; Calculate projected_total_compensation as salary plus projected_bonus.
SELECT employee_id AS staff_id, first_name,last_name,
'Employee' AS record_type,
salary*0.10 AS projected_bonus,
round(salary * 1.10) AS projected_total_compensation
FROM employee_salary;
