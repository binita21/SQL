use students_score;
show tables; 
SELECT * 
FROM scores;


-- ALTER TABLE scores 
-- RENAME column `Student Placed` TO student_placed;

SELECT * 
FROM scores
WHERE `Student Placed` = 'Yes'; -- Student who got placed.

-- What is the average score in SQL?
SELECT round( AVG(`Sql`),2 )as avg_score_in_sql
FROM scores;

-- What is the average score in python?
SELECT round( AVG(`Python`),2 )as avg_score_in_python
FROM scores;

-- What is the average score in ML?
SELECT round( AVG(`ML`),2 )as avg_score_in_ML
FROM scores;

-- What is the average score in Tableau?
SELECT round( AVG(`Tableau`),2 )as avg_score_in_Tableau
FROM scores;

WITH avg_score AS
(
SELECT AVG(`Sql`),AVG(`Python`),AVG(`ML`),AVG(`Tableau`),AVG(`Excel`)
FROM scores
)
SELECT * FROM avg_score;

WITH high_avg_score as(
SELECT GREATEST(AVG(`Sql`),AVG(`Python`),AVG(`ML`),AVG(`Tableau`),AVG(`Excel`)) as highest_avg_score
FROM scores)
SELECT * FROM
high_avg_score ;





