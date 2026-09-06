-- CASE statement
-- Case is used to define different result based on specific conditions.
-- It works like an if-else statement . i.e it goes through condition and stops at the first match if no match found then goes to else statement if provided else return null
SELECT first_name,
last_name,
age,
CASE
	WHEN age<=30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "VERY OLD"
END AS age_category
 FROM employee_demographics;
 
 
-- Here, in the above query if age of employee is <= 30 then it will return Young. If age lies between 31 and 50, it will return old and if age is >50 it will return Very old as output , if none of these conditions match it will return NULL


select first_name,
occupation,
salary,
CASE
WHEN salary>70000 THEN 'High income'
WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium income'
WHEN salary<40000 THEN "Low income"
ELSE "NO INCOME"
END AS Income_status
from employee_salary;

-- PAY INCREASE AND BONUS
-- <50000 = 5%
-- >50000 = 7%
-- FINANCE = 10% bonus

SELECT first_name,last_name,salary,
CASE
	WHEN  salary < 50000 THEN salary * 1.05
    WHEN  salary > 50000 THEN salary * 1.07
END as New_salary,
CASE
	WHEN dept_id = 6 THEN salary*.10
END AS Bonus
From employee_salary;
