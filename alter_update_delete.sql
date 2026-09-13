CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    occupation VARCHAR(50),
    salary INT
);

show tables;
INSERT INTO employees
(employee_id, first_name, last_name, gender, age, occupation, salary)
VALUES
(1, 'John', 'Doe', 'Male', 30, 'Data Analyst', 60000),
(2, 'Jane', 'Smith', 'Female', 28, 'Developer', 70000),
(3, 'Mike', 'Brown', 'Male', 35, 'Manager', 90000),
(4, 'Sara', 'Wilson', 'Female', 25, 'Data Analyst', 55000),
(5, 'David', 'Lee', 'Male', 32, 'Developer', 75000);

-- Alter statement
-- It is used to modify an existing table’s structure without deleting it.

ALTER table employees
RENAME to staff;

ALTER TABLE staff 
ADD date datetime; -- add new column date having datatype datetime.alter

ALTER TABlE staff
MODIFY COLUMN date INT; -- modifies the datatype of date column


ALTER TABLE staff
RENAME COLUMN first_name TO employee_name;

SELECT * FROM STAFF;


-- UPDATE 
-- UPDATE statement is used to modify existing data in a table by changing the values of one or more columns.

UPDATE staff
SET salary = 60000
WHERE employee_id = 4; -- It will update the staff table by setting salary of th employee_id 4 as 60000.

-- If we dont use where clause then updating any new data may lead to updating same data in entire mentioned column.

UPDATE staff
SET salary = 60000, age = 26
WHERE employee_id = 4; 

-- TRUNCATE TABLE statement is used to remove all records from a table while preserving its structure.
TRUNCATE TABLE staff; -- It will show column names but there will be no records , it will show 1 null row 
SELECT * FROM staff; 


-- DELETE
-- DELETE statement is used to remove specific rows from a table while keeping the table structure

INSERT INTO staff
(employee_id, employee_name, last_name, gender, age, occupation, salary)
VALUES
(1, 'John', 'Doe', 'Male', 30, 'Data Analyst', 60000),
(2, 'Jane', 'Smith', 'Female', 28, 'Developer', 70000),
(3, 'Mike', 'Brown', 'Male', 35, 'Manager', 90000),
(4, 'Sara', 'Wilson', 'Female', 25, 'Data Analyst', 55000),
(5, 'David', 'Lee', 'Male', 32, 'Developer', 75000);

DELETE FROM STAFF WHERE employee_id =1; -- it will delete record info of employee with id 1.

SET SQL_SAFE_UPDATES = 0;
DELETE FROM staff; -- acts same as truncate

SELECT * FROM staff; 
SET SQL_SAFE_UPDATES = 1;

DROP TABLE staff; -- it will delete the data as well as structure of table staff.








