use students_score;
show tables; 
SELECT * 
FROM scores;


-- ALTER TABLE scores 
-- RENAME column `Student Placed` TO student_placed;

SELECT * 
FROM scores
WHERE `Student Placed` = 'Yes'; -- Student who got placed.



-- Total number of students
SELECT COUNT(*) 
AS total_records
FROM scores;


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


-- 
WITH avg_score AS
(
SELECT round(AVG(`Sql`),2) as sql_avg_score,
round(AVG(`Python`),2) as python_avg_score,
round(AVG(`ML`),2) Ml_avg_score,
 round(AVG(`Tableau`),2) Tableau_avg_score,
 round(AVG(`Excel`),2) Excel_avg_score
FROM scores
)
SELECT * FROM avg_score;

-- Highest average score
SELECT round(GREATEST(
   AVG(`Sql`),AVG(`Python`),AVG(`ML`),AVG(`Tableau`),AVG(`Excel`)
),2)AS lowest_average
FROM scores;

-- Lowest average score
SELECT round(LEAST(
   AVG(`Sql`),AVG(`Python`),AVG(`ML`),AVG(`Tableau`),AVG(`Excel`)
),2)AS lowest_average
FROM scores;

SELECT * FROM scores;

-- MAX score in each subject
SELECT 
MAX(`Sql`) sql_max,MAX(`Python`) python_max,MAX(`ML`) Ml_max,MAX(`Tableau`) Tableau_max,MAX(`Excel`) Excel_max
FROM scores;

-- MAX score in each subject
SELECT 
MIN(`Sql`) sql_min,MIN(`Python`) python_min,MIN(`ML`) Ml_min,MIN(`Tableau`) Tableau_min,MIN(`Excel`) Excel_min
FROM scores;

-- What is the average score of placed students?
WITH avg_scores as (
SELECT 
round(AVG(`Sql`),2) avg_sql,round(AVG(`Python`),2) avg_python,round(AVG(`ML`),2) avg_ml,round(AVG(`Tableau`),2) avg_tableau,round(AVG(`Excel`),2) avg_excel
FROM scores
WHERE `Student Placed` = 'Yes')
SELECT * from avg_scores ;


-- What is the average score of unplaced students?
WITH avg_scores as (
SELECT 
round(AVG(`Sql`),2) avg_sql,round(AVG(`Python`),2) avg_python,round(AVG(`ML`),2) avg_ml,round(AVG(`Tableau`),2) avg_tableau,round(AVG(`Excel`),2) avg_excel
FROM scores
WHERE `Student Placed` = 'No')
SELECT * from avg_scores ;

-- What is the average score by placement status?
SELECT `Student Placed`,round(AVG(`Sql`),2) avg_sql,round(AVG(`Python`),2) avg_python,round(AVG(`ML`),2) avg_ml,round(AVG(`Tableau`),2) avg_tableau,round(AVG(`Excel`),2) avg_excel
FROM scores
GROUP BY `Student Placed`;

-- Number of unplaced students
SELECT COUNT(*) 
AS `Unplaced_student` 
FROM scores
WHERE `Student Placed`='No';

-- Number of unplaced students
SELECT COUNT(*)
AS `Placed_student`
FROM scores
WHERE `Student Placed`='Yes';