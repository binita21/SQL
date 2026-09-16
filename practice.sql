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

SELECT first_name
FROM employee_demographics
ORDER BY first_name ASC;

