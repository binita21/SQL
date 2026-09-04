-- SELECT  helps to retrieve data from a database 

SELECT * FROM employee_demographics; -- It helps to retrieve all the rows and columns from data

SELECT first_name,last_name,birth_date,age,(age+10)*10+10 -- It selects first name,last name, birthdate, age and a column (age+10)*10+10  from the table.
FROM parks_and_recreation.employee_demographics;


SELECT DISTINCT first_name
FROM parks_and_recreation.employee_demographics;  -- It helps to distince first name column with unique/distinct names only. 


 SELECT DISTINCT first_name,gender
 FROM parks_and_recreation.employee_demographics;
