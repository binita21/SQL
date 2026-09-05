-- WHERE Clause
-- Where clause helps to filter the records. It is used with select,update and delete clause to filter or retrieve only the records that satify given condition.
 -- Retrives the row whose first name is Leslie
SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie';

--  Retrives the row where salary is greater than 50000.
SELECT * 
FROM employee_salary
WHERE Salary>50000;

-- Retrives the information of female employees only.
SELECT * 
FROM employee_demographics
WHERE gender='Female';
-- WHERE gender!='Female';  Retrives the data of male employees


-- LOGICAL OPERATORS
-- AND OR NOT 

SELECT * 
FROM employee_demographics
WHERE birth_date>'1985-01-01'
AND gender = 'Male'; -- Retrives data whose  birth_date>'1985-01-01' and gender = 'Male' both are true


SELECT * 
FROM employee_demographics
WHERE birth_date>'1985-01-01'
OR gender = 'Male'; --  Either  birth_date>'1985-01-01' or gender = 'Male' any  them is true

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age=44) OR age>60;

-- LIKE Statement -> % and _
-- % means 0 or more character and _ means single character
-- Like statement is used to match/search the pattern in the data. 

SELECT *
FROM employee_demographics 
WHERE first_name LIKE 'J%';  -- String that starts with J  

SELECT * 
FROM employee_demographics 
WHERE first_name LIKE '%a';   -- String that ends with a, It might include both ending either A or a (case doesnt matter).
-- To make the case matter we can use BINARY keyword as

 SELECT * 
FROM employee_demographics 
WHERE BINARY first_name LIKE 'j%'; -- It didn't show the Jerry output as it only match the pattern starting with lowercase j.

SELECT * 
FROM employee_demographics
WHERE  first_name LIKE '%i%'; -- String that contains substring i (i.e. i can be anywhere in between )

SELECT * 
FROM employee_demographics
WHERE  first_name LIKE 'a__'; -- Return string starting with a and contains only 2 character after it. 

SELECT * 
FROM employee_demographics
WHERE  first_name LIKE 'a__%'; -- starts with a and contains at least 2 or more characters


SELECT * 
FROM employee_demographics
WHERE  birth_date LIKE '1980%';


-- IN operator
-- IN operator is use to check if specified column's value matches any specified value within provided list or not
-- OR tests multiple condition and can be used with different columns/conditions but IN test multiple values in same expression and is convenient for only one column. 

-- select * FROM employee_demographics
-- WHERE age > 40 OR gender = 'Female';


SELECT * FROM employee_salary
WHERE occupation = 'Office Manager' OR occupation='Entrepreneur';

-- WE can optimize above code using IN as
SELECT * FROM employee_salary
WHERE occupation IN ( 'Office Manager', 'Entrepreneur');
-- It will return records of those employees who are office MAnager or Entrepreneur. 

SELECT first_name,last_name FROM employee_demographics
WHERE birth_date IN ('1987-03-04','1994-03-27');

-- BETWEEN Operator
-- It is use to select the records within specified range , it is inclusive include both start and end range.

SELECT * FROM employee_salary
WHERE salary BETWEEN 50000 and 60000; -- IT will retrieve the records of those employee whose salary is between (>=50000) and (<=60000).  


SELECT * FROM employee_salary
WHERE salary NOT BETWEEN 50000 and 60000
order by salary;  -- first selects records info where salary doesnot lies between 50000 and 60000  and then displays by ordering salary in asc order.

-- EXISTS Operator
-- EXISTS operator checks whether a subquery returns at least one row. 

SELECT occupation FROM employee_salary
WHERE EXISTS (
SELECT first_name from employee_salary
WHERE salary>50000 and first_name LIKE '%n%');

