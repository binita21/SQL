-- Triggers and Events
-- Trigger is a piece of sql code that automatically runs when some action happens on the table.
-- It activates before or after an insert, update or delete action
-- It runs SQL code automatically for each affected row


-- whenever a new data is inserted in employee_salary table then  the created employee_insert trigger is triggered after insertion on employee_salary 
-- For each new row as a triggered action it will insert new inserted NEW.employee_id,NEW.first_name,New.last_name of employee_salary to demographics table and end.
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN

	INSERT INTO employee_demographics(employee_id,first_name,last_name)
	VALUES (NEW.employee_id,NEW.first_name,New.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
VALUES(13,'Jean','Saperstein','CEO',1200000,NULL);

SELECT  * FROM employee_demographics;


-- EVENTS
-- trigger happens when event takes place
-- An event is SQL code that runs automatically at a scheduled time.

DELIMITER $$
CREATE EVENT IF NOT exists remove_retirees
ON SCHEDULE EVERY 30 second
DO
BEGIN 
	DELETE 
	FROM employee_demographics
    WHERE age >= 60;

END $$
DELIMITER ;


-- SHOW VARIABLES LIKE 'event%';
SELECT * FROM employee_demographics;