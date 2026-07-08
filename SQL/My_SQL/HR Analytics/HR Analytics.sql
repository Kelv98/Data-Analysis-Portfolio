SELECT * FROM hr_analytics.employee_data;
-- Data Cleaning
ALTER TABLE employee_data
RENAME COLUMN ï»¿EmpID TO Emp_ID;
SELECT COUNT(dISTINCT EMP_ID) FROM employee_data;
SELECT COUNT(*) AS Missing_Values FROM employee_data
WHERE ExitDate IS NULL;
SELECT coalesce(ExitDate,'Unrecorded') AS Missing_Values
FROM employee_data;
UPDATE employee_data
SET ExitDate='Unrecorded'
WHERE ExitDate IS NULL;
SELECT COUNT(exitdate) AS missing_values FROM employee_data
WHERE ExitDate='unrecorded';
ALTER TABLE employee_data
DROP column myunknowncolumn ;
ALTER TABLE employee_data
DROP column MyUnknownColumn2;
ROLLBACK;
-- Data Analysis
-- Count of employees in each department
SELECT departmentType,count(EmpID) as Total_Employees
FROM employee_data
GROUP BY DepartmentType
ORDER BY Total DESC;
-- Employeetype count,Employee Classfication Type
SELECT distinct EmployeeType,count(Employeetype) AS Total
FROM employee_data
GROUP BY employeetype;
-- Employee Classfication Type and Employee Type
SELECT DISTINCT EmployeeClassificationType,
SUM(CASE WHEN Employeetype='Full-time' then 1 ELSE 0 END)AS 'Full-Time',
SUM(CASE WHEN Employeetype='Contract' then 1 ELSE 0 END)AS 'Contract',
SUM(CASE WHEN Employeetype='Part-time' then 1 ELSE 0 END)AS 'Part-time',COUNT(EmployeeClassificationType) AS TOTAL
FROM employee_data
GROUP BY EmployeeClassificationType
ORDER BY TOTAL DESC;
-- Division and Deapartment type Count
SELECT COUNT(distinct departmenttype) AS Department_Count FROM employee_data;
SELECT COUNT(distinct division) AS Department_Count FROM employee_data;
SELECT DISTINCT division,DepartmentType,count(*) AS Total
FROM employee_data
GROUP BY DIVISION,DepartmentType
ORDER BY Total DESC;
-- Confirming Divisions Total
WITH SUM_OF_Divisions AS (SELECT DISTINCT division,DepartmentType,count(*) AS Total
FROM employee_data
GROUP BY DIVISION,DepartmentType
ORDER BY Total DESC)
SELECT SUM(Total) AS Total_Divisions
FROM SUM_OF_Divisions;
-- Title and Supervisor
SELECT COUNT(distinct Title) FROM employee_data;
SELECT COUNT(distinct Supervisor) FROM employee_data;
SELECT distinct Supervisor,COUNT(Supervisor)  AS TOTAL FROM employee_data
GROUP BY SUPERVISOR
HAVING TOTAL>1
ORDER BY TOTAL DESC;
WITH Sum_of_Supervisors AS(SELECT SUPERVISOR,COUNT(Supervisor)  AS TOTAL FROM employee_data
GROUP BY SUPERVISOR
HAVING TOTAL>1)
SELECT SUM(TOTAL) FROM Sum_of_Supervisors;
SELECT COUNT( distinct coalesce(supervisor,0)) AS Supervisors_Count FROM employee_data;
--  Gender Count
SELECT Gendercode,Count(Gendercode) AS Total
FROM employee_data
GROUP BY GenderCode;
-- JobFunctiondescription and Gendercode Count
SELECT JobFunctionDescription,sum(CASE WHEN GenderCode='Male'THEN 1 ELSE 0 END) AS 'Male_Count',
sum(CASE WHEN GenderCode='Female'THEN 1 ELSE 0 END) AS 'Female_Count'
FROM employee_data
GROUP BY JobFunctionDescription
ORDER BY Male_count DESC,Female_Count Desc;
-- Top 10 JobFunctionDescription population
SELECT JobFunctionDescription,sum(CASE WHEN GenderCode='Male'THEN 1 ELSE 0 END) AS 'Male_Count',
sum(CASE WHEN GenderCode='Female'THEN 1 ELSE 0 END) AS 'Female_Count',COUNT(JobFunctionDescription) AS Total
FROM employee_data
GROUP BY JobFunctionDescription
ORDER BY Total DESC
LIMIT 10;
-- Bottom 10 JobFunctionDescription population
SELECT JobFunctionDescription,sum(CASE WHEN GenderCode='Male'THEN 1 ELSE 0 END) AS 'Male_Count',
sum(CASE WHEN GenderCode='Female'THEN 1 ELSE 0 END) AS 'Female_Count',COUNT(JobFunctionDescription) AS Total
FROM employee_data
GROUP BY JobFunctionDescription
ORDER BY Total ASC;
CREATE TABLE Bottom10 AS (SELECT JobFunctionDescription,sum(CASE WHEN GenderCode='Male'THEN 1 ELSE 0 END) AS 'Male_Count',
sum(CASE WHEN GenderCode='Female'THEN 1 ELSE 0 END) AS 'Female_Count',COUNT(JobFunctionDescription) AS Total
FROM employee_data
GROUP BY JobFunctionDescription
ORDER BY Total ASC);
SELECT JobFunctionDescription,Total,dense_rank() OVER(order by total ASC) AS Unique_Rank
FROM bottom10 
ORDER BY unique_rank ASC
;
WITH Bottom AS(SELECT JobFunctionDescription,Total,dense_rank() OVER(order by total ASC) AS Unique_Rank
FROM bottom10
ORDER BY unique_rank ASC)
SELECT * 
FROM bottom
WHERE Unique_Rank<=10;
-- count how many were bottom 10
CREATE VIEW Count_Bottom10 AS(WITH Bottom AS(SELECT JobFunctionDescription,Total,
dense_rank() OVER(order by total ASC) AS Unique_Rank
FROM bottom10
ORDER BY unique_rank ASC)
SELECT * 
FROM bottom
WHERE Unique_Rank<=10);
SELECT count(Unique_rank) from Count_Bottom10;
SELECT Total,Count(*) AS Total_Count
FROM count_bottom10
GROUP BY Total;
-- Job Title and Supervisor
-- First Name starting with  letter 'U'
SELECT supervisor,EmployeeStatus
FROM employee_data
WHERE FirstName like 'U%'; 
-- Employees_Under_Supervisor name beginning with Gregory
SELECT FirstName,Lastname,EmployeeStatus  
FROM employee_data
WHERE SUPERVISOR REGEXP ('^Gregory');
-- Supervisors with name ending Like White
SELECT Supervisor
FROM employee_data
WHERE Supervisor REGEXP('White$');
-- Payzone and EmployeeClassificationType
SELECT payzone,
sum(CASE WHEN EmployeeclassificationType='Full-time' THEN 1 ELSE 0 END) AS 'Full-Time',
SUM(CASE WHEN EmployeeclassificationType='Temporary' THEN 1 ELSE 0 END) AS 'Temporary',
sum(CASE WHEN EmployeeclassificationType='Part-time' THEN 1 ELSE 0 END) AS 'Part-time',
COUNT(payzone) as Total
FROM employee_data
GROUP BY PayZone
ORDER BY Total DESC;
-- Payzone,Performance score,Current employee rating
-- =================================================
-- Performance Score Aggregation
SELECT DISTINCT Performance_Score,COUNT(*) as Total
FROM employee_data
GROUP BY Performance_Score;
-- Payzone and Performance_Score
SELECT payzone,
sum(CASE WHEN Performance_Score='Fully Meets' THEN 1 ELSE 0 END) AS 'Fully Meets',
SUM(CASE WHEN Performance_Score='Exceeds' THEN 1 ELSE 0 END) AS 'Exceeds',
sum(CASE WHEN Performance_Score='Needs Improvement' THEN 1 ELSE 0 END) AS 'Needs Improvent',
sum(CASE WHEN Performance_Score='PIP' THEN 1 ELSE 0 END) AS 'PIP',
COUNT(payzone) as Total
FROM employee_data
GROUP BY PayZone
ORDER BY TOTAL DESC;
-- count of employee rating
SELECT distinct current_employee_rating,
COUNT(*) AS Total
FROM employee_data
GROUP BY 	current_employee_rating
ORDER BY current_employee_rating ASC;
-- Current_Employee_Rating and Performance_Score
SELECT DISTINCT current_employee_rating,
sum(CASE WHEN Performance_Score='Fully Meets' THEN 1 ELSE 0 END) AS 'Fully Meets',
SUM(CASE WHEN Performance_Score='Exceeds' THEN 1 ELSE 0 END) AS 'Exceeds',
sum(CASE WHEN Performance_Score='Needs Improvement' THEN 1 ELSE 0 END) AS 'Needs Improvent',
sum(CASE WHEN Performance_Score='PIP' THEN 1 ELSE 0 END) AS 'PIP',
COUNT(Current_Employee_Rating) as Total
FROM employee_data
GROUP BY Current_Employee_Rating
ORDER BY  current_employee_rating ASC;
-- 👀 Performance score and Marital Status
SELECT DISTINCT Maritaldesc 
From  employee_data;
SELECT DISTINCT Performance_score,
sum(CASE WHEN Maritaldesc='Single' THEN 1 ELSE 0 END) AS 'Single',
SUM(CASE WHEN Maritaldesc ='Married' THEN 1 ELSE 0 END) AS 'Married',
sum(CASE WHEN Maritaldesc='Divorced' THEN 1 ELSE 0 END) AS 'Divorced',
sum(CASE WHEN Maritaldesc='Widowed' THEN 1 ELSE 0 END) AS 'Widowed',
COUNT(Performance_Score) as Total
FROM employee_data
GROUP BY performance_score;

-- DepartmentType and Terminition Status
SELECT DISTINCT(TERMINATIONTYPE)
FROM employee_data;

UPDATE employee_data
SET TerminationType='Unknown'
WHERE Terminationtype='Unk';

SELECT DISTINCT(DepartmentType)
FROM employee_data;

SELECT distinct(DepartmentType),SUM(CASE WHEN terminationtype='Voluntary' THEN 1 ELSE 0 END) AS 'Voluntary',
SUM(CASE WHEN terminationtype='Retirement' THEN 1 ELSE 0 END) AS 'Retirement',
SUM(CASE WHEN terminationtype='Resignation' THEN 1 ELSE 0 END) AS 'Resignation',
SUM(CASE WHEN terminationtype='inVoluntary' THEN 1 ELSE 0 END) AS 'InVoluntary',
SUM(CASE WHEN terminationtype='Unknown' THEN 1 ELSE 0 END) AS 'Unkown',
count(DepartmentType) AS  Total
FROM employee_data
GROUP BY DepartmentType
ORDER BY TOTAL DESC;
 -- Employee age  and Churn(To be Reviewed)
  SELECT  DATE_FORMAT(curdate(),'%d/%m/%Y') Today;
  SELECT year(DOB)  FROM employee_data2;
  SELECT extract(year FROM DOB) FROM employee_data2;
  SELECT Year(startdate)
  FROM employee_data2;
 SELECT date_format(DOB,'%d-%m-%Y') FROM employee_data2;
 SELECT datediff(exitdate,startdate) From employee_data;
 
 -- JOINS
 SELECT e.empid,firstname,title,performance_score,Satisfaction_score
 FROM employee_data e
 LEFT JOIN employee_engagement_survey_data  ees
 ON e.EmpID=ees.Employee_ID
 WHERE Satisfaction_Score>=3
 ORDER BY Satisfaction_Score desc;
SELECT date_format(survey_date,'%Y/%m/%d') FROM employee_engagement_survey_data;
CREATE TABLE Tarehe (Start_date  Date ,End_date  date);
INSERT INTO TAREHE
VALUES( 2016-02-12,2018-02-12);
INSERT INTO TAREHE
VALUES
(2017-04-17,2018-07-16),
(2018-09-23,2020-08-13),
(2019-07-22,2021-09-30);
SELECT date_format(start_date,'%d/%m/%Y') AS Start_date,
date_format(end_date,'%d/%m/%Y') AS Start_date
FROM tarehe;
SELECT year(start_date)
FROM tarehe;
SELECT ROUND((datediff(end_date,start_date)/365),1) AS Year
FROM tarehe;

