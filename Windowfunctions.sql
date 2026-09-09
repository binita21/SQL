-- In SQL, window functions perform calculations across a group of related rows without collapsing those rows into one result.

-- Over will add salary of all genders altogether but preserve the rows, it will show all rows but all rows will have avg salary as 56090.9091
-- PARTITION BY: It divides the data into groups using PARTITION BY.
-- ORDER BY: It specifies the order of rows within each group using ORDER BY.

-- Window functions are of two types
-- 1. Aggregate window functions - calculates aggregates over windows of rows. SUM(),AVG(),and soon
-- 2. Ranking window functions - provide rankings of rows within a partition based on specific criteria. Rank(),DENSE_RANK(),ROW_NUMBER(),PERCENT_RANK()
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

-- RANKING WINDOW FUNCTIONS
-- ROW_NUMBER() - Assigns a unique number to each row in the result set.
SELECT dem.employee_id,dem.first_name, dem.last_name,gender,salary,
ROW_NUMBER()  OVER () 
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
;  -- It will provide sequence of rows 1,2,3... for all rows  

SELECT dem.employee_id,dem.first_name, dem.last_name,gender,salary,
ROW_NUMBER()  OVER (partition by gender) 
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
; -- It will provide sequence of rows 1,2,3... for male and female rows separately   

SELECT dem.employee_id,dem.first_name, dem.last_name,gender,salary,
ROW_NUMBER()  OVER (partition by gender ORDER BY salary DESC) 
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
; -- It will provide first order by salary and provide sequence of rows 1,2,3... for male and female rows separately   

-- RANK(): Assigns ranks to rows, skipping ranks for duplicates.
SELECT dem.employee_id,dem.first_name, dem.last_name,gender,salary,
ROW_NUMBER()  OVER (partition by gender ORDER BY salary DESC) as row_num,
RANK() OVER (partition by gender ORDER BY salary DESC) as rank_num
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
;

-- DENSE_RANK(): Assigns ranks to rows without skipping rank numbers for duplicates.
SELECT dem.employee_id,dem.first_name, dem.last_name,gender,salary,
ROW_NUMBER()  OVER (partition by gender ORDER BY salary DESC) as row_num,
RANK() OVER (partition by gender ORDER BY salary DESC) as rank_num,
DENSE_RANK() OVER (partition by gender ORDER BY salary DESC) as dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
;

-- RANK will give the new number positionally i.e. if duplicates 5,5 exists it will give 7 as one 5 lies in 6th position
-- But dense rank will give the new number numerically not positionally. i.e. if duplicates 5,5 exists it will give new number as 6 because rank 5 is duplicated.



















