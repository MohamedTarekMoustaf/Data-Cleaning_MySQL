-- --------------------------------- REMOVING Duplicates ------------------------------------------
CREATE TABLE layoffs_stagging AS SELECT * FROM layoffs;

SELECT * FROM layoffs_stagging;

SELECT * FROM layoffs_stagging WHERE company = 'Casper';

SELECT  DISTINCT * FROM layoffs_stagging WHERE company = 'Casper';

CREATE TABLE layoffs_stagging2 AS SELECT  DISTINCT * FROM layoffs_stagging;

SELECT * FROM layoffs_stagging2;

ALTER TABLE layoffs_stagging2 
ADD row_num INT;

UPDATE layoffs_stagging2 
SET row_num = 1
WHERE 1;

SELECT * FROM layoffs_stagging2 WHERE company = 'Casper';

-- -------------------------------------  Standardizing Data ----------------------------------
UPDATE layoffs_stagging2  
SET company = TRIM(company); 

SELECT company FROM layoffs_stagging2
ORDER BY 1; -- order company column alphabetically which is column number 1

-- Industry
SELECT DISTINCT industry
FROM layoffs_stagging2
ORDER BY 1;

UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- location
SELECT DISTINCT location
FROM layoffs_stagging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_stagging2
ORDER BY 1;

-- country
UPDATE layoffs_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States';

SELECT DISTINCT date
FROM layoffs_stagging2
ORDER BY 1;

-- Changing the data type of 'date' from text to DATE
UPDATE layoffs_stagging2
SET date = STR_TO_DATE(date,'%m/%d/%Y');

ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE; 

-- ------------------------------------ Removing NULL VALUES and Blank Cells -------------------------------
SELECT * FROM layoffs_stagging2
WHERE  (industry IS NULL) OR (industry = '')OR
(total_laid_off IS NULL OR total_laid_off = '') OR 
(percentage_laid_off IS NULL OR percentage_laid_off = '') OR
(stage IS NULL OR stage = '') OR
(funds_raised_millions IS NULL OR funds_raised_millions = '') OR
(date IS NULL OR date = STR_TO_DATE(date,''))
ORDER BY 1;

/* Copy the industry value in a row into the Null-valued cell in another row 
while two records for the same company*/ 
UPDATE layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
ON t1.company = t2.company
SET t2.industry = t1.industry
WHERE (t2.industry IS NULL OR t2.industry = '')
AND NOT(t1.industry IS NULL OR t2.industry = '');

UPDATE layoffs_stagging2 
SET industry = 'iGaming'
WHERE company = 'Bally''s Interactive';

UPDATE layoffs_stagging2 
SET industry = 'e-commerce'
WHERE company = 'Carvana';

UPDATE layoffs_stagging2 
SET industry = 'electronic cigarette'
WHERE company = 'Juul';

SELECT * FROM layoffs_stagging2 
WHERE (industry = 'Travel')
ORDER BY 1;

DELETE FROM layoffs_stagging2
WHERE (total_laid_off IS NULL OR total_laid_off = '') AND 
(percentage_laid_off IS NULL OR percentage_laid_off = '');

ALTER TABLE layoffs_stagging2
DROP COLUMN row_num;
