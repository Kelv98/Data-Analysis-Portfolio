SELECT * FROM walmart_analysis.`walmartsalesdata.csv`;
-- customer type across various branches
SELECT Branch,count(Customer_type) AS Customer_Count FROM `walmartsalesdata.csv`
GROUP BY Branch
ORDER BY Customer_Count DESC;

-- productline count
SELECT Product_line,count(Quantity) AS Product_Count 
FROM `walmartsalesdata.csv`
GROUP BY Product_line
ORDER BY Product_Count DESC;
CREATE VIEW Product_Income AS(SELECT Product_line,count(Quantity) AS Product_Count 
FROM `walmartsalesdata.csv`
GROUP BY Product_line
ORDER BY Product_Count DESC);
SELECT* FROM Product_income; 

-- productline taxation
SELECT Product_line,Round(sum(tax*total) AS Total_tax,-2)
FROM  `walmartsalesdata.csv`
GROUP BY Product_line;
CREATE TABLE ROUNDED_TAX AS(
SELECT Product_line,sum(tax*total) AS Total_tax
FROM  `walmartsalesdata.csv`
GROUP BY Product_line);
SELECT Product_line,round(Total_tax,2) As Tax FROM ROUNDED_TAX;

-- Gender expenditure
SELECT Gender,round(Sum(Total) AS Total_Amount,2)
FROM `walmartsalesdata.csv`
GROUP BY Gender;
CREATE VIEW GENDER_TAX AS (SELECT Gender,Sum(Total) AS Total_Amount
FROM `walmartsalesdata.csv`
GROUP BY Gender);
SELECT Gender,round(Total_Amount,2) AS Total_Amount FROM GENDER_TAX;
-- amount received in various payments 
SELECT payment,Sum(Total) as Total_Amount
FROM`walmartsalesdata.csv`
GROUP BY Payment
ORDER BY Total_Amount DESC;
CREATE VIEW Payments_Amount AS(
SELECT payment,Sum(Total) as Total_Amount
FROM`walmartsalesdata.csv`
GROUP BY Payment
ORDER BY Total_Amount DESC);
SELECT Payment,round(Total_Amount,2) AS Total_Amount FROM Payments_Amount;

-- city and products they bought(To be reviewed)
select city,count(*) From `walmartsalesdata.csv` Group by city;
SELECT CITY,PRODUCT_LINE FROM `walmartsalesdata.csv`;
SELECT Product_line,count(CASE WHEN City='Yangon'
  THEN 'Yes' ELSE '-' END) AS 'Yangon',
count(CASE WHEN City='Naypyitaw'THEN 'Yes' ELSE '-' END) AS 'Naypyitaw',
count(CASE WHEN City='Mandalay' THEN 'Yes' ELSE '-' END) AS 'Mandalay'
FROM `walmartsalesdata.csv`
GROUP BY Product_line;

-- use of case in rating  average rating.
SELECT PRODUCT_LINE,AVG(rating) 
FROM `walmartsalesdata.csv`
GROUP BY Product_line;
SELECT  Product_line,(CASE WHEN AVG(rating)>=7 Then "Awesome" ELSE "Action Needed" END)AS Remarks
FROM `walmartsalesdata.csv`
GROUP BY Product_line;
-- CTE Example
WITH Descriptive_Data AS (
SELECT Gender,count(Gender) AS 'Head_Count', round(AVG(Total),2) AS 'AVERAGE',round(sum(Total),2) AS 'Total'
FROM `walmartsalesdata.csv`
group by Gender) ,
Transfomed_Data  AS (SELECT * FROM rounded_tax )
SELECT * FROM Descriptive_Data DD
JOIN Transformed_Data TD ON DD.Product_line=TD.Product_line;
 SHOW TABLES;
CREATE INDEX ROUNDED_TAX2
on  rounded_tax(Total_tax);
desc rounded_tax;
ALTER TABLE rounded_tax
Drop index ROUNDED_TAX2;
desc rounded_tax;
