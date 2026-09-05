-- UNION
-- The UNION operator is used to combine the result-set of two or more SELECT statements, and remove duplicates (i.e include common values only once).
-- The union operator should have same number of columns and similar datatype while perfroming union

SELECT first_name,last_name
FROM employee_salary
UNION 
-- SELECT first_name FROM employee_demographics; This will throw error because the no of column are different.
SELECT first_name, last_name
FROM employee_demographics;


-- UNION ALL
-- UNION ALL is same as Union but it doesnt remove duplicates

SELECT first_name,last_name
FROM employee_salary
UNION ALL
SELECT first_name, last_name
FROM employee_demographics;


SELECT first_name, last_name,'Old Man' as Label
FROM employee_demographics
WHERE age > 40 and gender='Male'
UNION
SELECT first_name, last_name,'Old Lady' as Label
FROM employee_demographics
WHERE age > 40 and gender='Female'
UNION
SELECT first_name,last_name,"Highly paid employee" as Label
from employee_salary
where salary>70000
ORDER BY first_name,last_name
;

SELECT * from employee_salary
 where dept_id IS NULL;
 
-- The ANY operator is used to compare a value to every value returned by a subquery.
-- The ANY operator evaluates to TRUE if at least one value in the subquery result-set meet the condition.

 SELECT *
FROM employee_salary
WHERE salary > Any(
    SELECT salary
    FROM employee_salary
    WHERE occupation = 'Manager'
);
 
  -- The ALL operator is used to compare a value to every value returned by a subquery.
-- The ALL operator evaluates to TRUE if every value in the subquery result-set meet the condition

 SELECT *
FROM employee_salary
WHERE salary > All(
    SELECT salary
    FROM employee_salary
    WHERE occupation = 'Manager'
);
 

 
 
 
 
 
 
 
 