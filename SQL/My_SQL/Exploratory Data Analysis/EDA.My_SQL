SELECT * 
FROM worlds_layoffs.layoffs_staging2;
SELECT max(total_laid_off),max(percentage_laid_off)
FROM worlds_layoffs.layoffs_staging2;
SELECT count(total_laid_off) 
FROM worlds_layoffs.layoffs_staging2
WHERE percentage_laid_off=1 ;
SELECT *
FROM worlds_layoffs.layoffs_staging2
WHERE percentage_laid_off=1
ORDER BY total_laid_off DESC;
SELECT COMPANY,sum(Total_laid_off)
FROM worlds_layoffs.layoffs_staging2
GROUP BY COMPANY
ORDER BY 2 DESC;
SELECT MAX(date),MIN(date)
FROM worlds_layoffs.layoffs_staging2;
SELECT industry,sum(Total_laid_off)
FROM worlds_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;
SELECT COUNTRY,sum(Total_laid_off)
FROM worlds_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;
SELECT YEAR(date),sum(Total_laid_off) AS 'TOTAL'
FROM date
GROUP BY YEAR(date)
ORDER BY 2 DESC;

SELECT substring(date,6,2) AS 'Month'
FROM layoffs;
SELECT updated_date,date_format(updated_date,'%Y-%m-%d')  AS Updated from layoffs
;
alter table layoffs
RENAME column date
TO updated_date;
-- SELECT updated_date,date_format(updated_date,'%d-%m-%Y') AS Diggy from layoffs;
SELECT substring(date,1,7) AS 'DATE',SUM(total_laid_off)
FROM worlds_layoffs.layoffs_staging2
WHERE substring(date,1,7) IS NOT NULL
GROUP BY DATE
ORDER BY 1 ASC;
WITH Rolling_Total AS 
(SELECT substring(date,1,7) AS DATE,SUM(total_laid_off) AS TOTAL1
FROM worlds_layoffs.layoffs_staging2
WHERE substring(date,1,7) IS NOT NULL
GROUP BY DATE
ORDER BY 1 ASC)
SELECT  DATE,SUM( TOTAL1) OVER(ORDER BY DATE) AS 'Rolling_Total'
FROM Rolling_Total;

WITH COMPANY (Company,Year,total)AS (
SELECT company,YEAR(date),sum(total_laid_off) AS Total
FROM worlds_layoffs.layoffs_staging2
GROUP BY company,YEAR(date)
ORDER BY 3 DESC)
SELECT  * FROM  COMPANY;



