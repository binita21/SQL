-- STRING Functions
-- help us to work with strings


-- length function helps us to find the length of string.
SELECT length('skyfall');

SELECT first_name,LENGTH(first_name) 
FROM employee_demographics 
ORDER BY LENGTH(first_name)  ; -- This helps us to find the length of each first names. 

-- UPPER function
-- converts to uppercase letter
SELECT upper("sky");

-- LOWER function
-- converts to lowercase letter
SELECT lower("SKY");

SELECT first_name,UPPER(first_name) 
FROM employee_demographics;  -- converts first_name to uppercase letter

-- TRIM FUNCTION
-- trims/removes the leading or trailing whitespace

SELECT TRIM('      SKY          '); -- It trims both left and right spaces
SELECT LTRIM('              SKY             ');-- It trims left spaces
SELECT RTRIM('              SKY             ');-- It trims right spaces


-- LEFT, RIGHT and SUBSTRING FUNCTION

SELECT first_name, LEFT(first_name,4 ) ,
RIGHT(first_name,4 ) , --  IT will take left 4 letters and right 4 letters from first name
SUBSTRING(first_name,3,2), -- SUBSTRINg will start to take string from length 3 and select 2 characters (indexing start from 1 )
SUBSTRING(birth_date,6,2) as Birth_month -- It will return birth month
FROM employee_demographics;  

-- REPLACE FUNCTIONS
-- Helps to replace any string with other
SELECT first_name, REPLACE(first_name,'a','Z')
FROM employee_demographics;

-- LOCATE
-- It helps to locate the index of any string
SELECT LOCATE('x','Alexander');

SELECT first_name, LOCATE('An',first_name)
FROM employee_demographics;


-- CONCATENATION
-- helps to concate strings

SELECT first_name,last_name,
CONCAT(first_name,'  ',last_name) as full_name
from employee_demographics;


