-- GROUP BY
-- Group by statement helps to group the rows that share the same values in specified columns and is mostlu used with aggregate functions. 

-- Execution order (conceptually)
-- FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

SELECT gender,COUNT(gender)
FROM  employee_demographics
GROUP BY gender;   
-- First, SQL gets the data from the employee_demographics table. 
-- Then it groups the employees based on their gender. 
-- For each gender group, it counts the number of gender values, and finally it displays the gender and its corresponding count.

SELECT gender, AVG(age), MAX(age) ,MIN(AGE),COUNT(age)
FROM employee_demographics
GROUP BY gender;  
-- Here from employee_demographics table it groups the gender and calculate aggreagate functions like avg,max,min,count and displays the result

SELECT  occupation, salary
FROM employee_salary
GROUP BY occupation, salary;


-- ORDER BY
-- Sorts data in either ascending (ASC) which is default and descending (DESC) order
 
 SELECT * 
 FROM employee_demographics
 ORDER BY first_name DESC;  -- Displays data by sorting name in descending order
 
SELECT * 
 FROM employee_demographics
 ORDER BY gender,age DESC;  -- First it order gender then age 
 
SELECT * 
 FROM employee_demographics
 ORDER BY age DESC,gender; 
 
 
 -- HAVING vs WHERE
 -- Where filters only individual rows before grouping but Having filters the group after grouping.
 -- We cannot use aggregation function with where it throws an error


SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40;

SELECT occupation,AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary)>75000;
-- From employee_salary it select individual rows that consists substring manager then group by occupation and calculate average salary and filter salary > 75000 by having clause and displays the occupation and avg(salary) according to the filtered rows.


-- LIMIT 
-- It limits the number of records that will be displayed
SELECT * 
FROM employee_salary
LIMIT 3; -- It will retrieve only top 3 records from employee salary.


-- LIMIT 2 OFFSET 2 means skipping first 2 rows and fetching 2 rows.
SELECT * 
FROM employee_salary
-- ORDER BY salary DESC
LIMIT 2 OFFSET 2;

SELECT * 
FROM employee_salary
LIMIT 2,1;  -- here in this statement offset is 2 means skips first 2 rows and limit is 1 .i.e retrives 1 record (THEREFORE, it will display record 3)

-- Aliasing

SELECT gender , AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40;



