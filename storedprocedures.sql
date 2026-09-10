-- A stored procedure in SQL is a pre-written group of SQL statements stored inside the database that you can execute whenever you need it.
use parks_and_recreation;
CREATE PROCEDURE large_salaries()

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();


-- Using DELIMITER while creating procedure for multiple select statements .alter
DELIMITER $$
USE `parks_and_recreation`$$

CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;
    SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;


-- PARAMETER
-- they are variables passed as an input to stored procedure.

DELIMITER $$
CREATE PROCEDURE large_salaries4(given_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id=given_id;
END $$
DELIMITER ;

CALL large_salaries4(1)