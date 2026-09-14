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