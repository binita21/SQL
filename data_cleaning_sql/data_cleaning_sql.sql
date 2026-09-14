-- DATA CLEANING

SELECT * 
FROM layoffs;

-- 1. REMOVE DUPLICATES 
-- 2. STANDARDIZE DATA , if any spelling issues 
-- 3. NULL or BLANK VALUES
-- 4. REMOVE UNNECESSARY COLUMNS


/*CREATE TABLE layoffs_staging
LIKE layoffs;


INSERT layoffs_staging
SELECT *
FROM layoffs;*/


SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,industry,total_laid_off,percentage_laid_off,`date`) as row_num
FROM layoffs_staging;


WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num>1;


SELECT * from layoffs_staging
where company='Casper';


WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging
)
DELETE 
FROM duplicate_cte
WHERE row_num>1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging2
WHERE row_num>1;



INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
FROM layoffs_staging;


-- deleting the rows where row_number is greater than 1.
DELETE FROM layoffs_staging2 
WHERE row_num > 1;



-- Standardizing data

SELECT company,TRIM(company) -- IT will select company and remove extra spaces from the company 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);  -- It will update the company column by removing whites spaces

SELECT DISTINCT industry 
FROM layoffs_staging2
ORDER BY 1; -- It will sort by industry column

SELECT *
FROM layoffs_staging2
WHERE industry like 'Crypto%';  -- select all records that starts with crypto

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry like 'Crypto%'; -- update the records that starts with Crypto  to Crypto.


-- Select distinct country and trim any '.' if present on the trailing or right side of the records.
SELECT DISTINCT country,TRIM(TRAILING '.' FROM country) 
FROM layoffs_staging2
ORDER BY 1;


-- select everything that starts with United States
SELECT * from layoffs_staging2
where country like"United States%";

-- uodate the country column records by trimming . present on the country record starting with united states  
UPDATE layoffs_staging2
SET country=TRIM(TRAILING '.' FROM country)
WHERE country like "United States%";

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')  -- select date in format y-m-d
from layoffs_staging2;

UPDATE layoffs_staging2 -- update date to y-m-d format
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_staging2 
modify column `date` DATE;   -- changes the data type od date from text to date

-- DEALING WITH NULL OR BLANK VALUES
 SELECT * FROM 
 layoffs_staging2
 WHERE total_laid_off is NULL
 AND percentage_laid_off is NULL;
 
 
 UPDATE layoffs_staging2
 SET industry = null
 WHERE industry = '';
 
 
SELECT *
FROM layoffs_staging2
WHERE industry is NULL
or industry = '';

SELECT * from layoffs_staging2
where company='Airbnb';


SELECT t1.company,t1.industry,t2.company,t2.industry 
from layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company=t2.company
    AND t1.location=t2.location
where (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;


UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company=t2.company
SET t1.industry=t2.industry
where (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;


SELECT * FROM layoffs_staging2
where industry IS NULL or industry='';


SELECT * 
FROM layoffs_staging2
where company like "Bally's%";


 SELECT * FROM 
 layoffs_staging2
 WHERE total_laid_off is NULL
 AND percentage_laid_off is NULL;
 
 
 DELETE FROM layoffs_staging2
 WHERE total_laid_off is NULL
 AND percentage_laid_off is NULL;
 
 SELECT * FROM
 layoffs_staging2;
 
 
 ALTER TABLE layoffs_staging2
 DROP column row_num;
 
 

 