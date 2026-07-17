-- Creating a database 
CREATE DATABASE  ECommerce_analytics;
USE ECommerce_analytics;
--  Creating Customers Table
CREATE TABLE Customers
(Customer_id int,
Customer_name varchar(30),
Gender varchar(17),
City varchar(30),
Signup_Date DATE);
SELECT * FROM Customers;
-- Creating products table
CREATE TABLE Products(
Products_id int,
Product_name varchar(10),
Category varchar(17),
Price DECIMAL(10,2));
-- Creating Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30));
-- Creating Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2));
-- Inserting into sample customers
INSERT INTO customers VALUES
(1,'Rahul','Male','Mumbai','2025-01-10'),
(2,'Priya','Female','Delhi','2025-01-15'),
(3,'Amit','Male','Pune','2025-02-01'),
(4,'Sneha','Female','Bangalore','2025-02-10'),
(5,'Rohan','Male','Hyderabad','2025-03-05');
-- Inserting into Products
INSERT INTO products VALUES
(101,'Laptop','Electronics',65),
(102,'Headphones','Electronics',25),
(103,'Office Chair','Furniture',0.7),
(104,'Keyboard','Electronics',1.80),
(105,'Water Bottle','Home',0.60);
-- Inserting into Orders
INSERT INTO orders VALUES
(1001,1,'2025-03-01','Delivered'),
(1002,2,'2025-03-03','Delivered'),
(1003,1,'2025-03-10','Delivered'),
(1004,3,'2025-03-15','Cancelled'),
(1005,4,'2025-03-20','Delivered');
-- Inserting into Order_Items
INSERT INTO Order_items VALUES
(1,1001,101,1,65000),
(2,1001,102,2,2500),
(3,1002,103,1,7000),
(4,1003,104,1,1800),
(5,1004,105,3,600),
(6,1005,101,1,65000);
-- Identifying the repeat customers
SELECT customer_id,count(ORDER_ID) as Repeat_Customer
FROM orders
GROUP BY customer_id
HAVING count(ORDER_ID) >1;
-- Finding customer who never placed an order
SELECT CUSTOMER_NAME,O.CUSTOMER_ID as Zero_ID
FROM customers c
LEFT JOIN orders O  ON  C.customer_id=O.customer_id
WHERE  O.CUSTOMER_ID IS NULL;
-- Finding inactive customers who had no order in the last 90days
SELECT customer_name,datediff(current_date,order_date) AS days
FROM customers c
LEFT JOIN orders O ON c.Customer_id=o.customer_id
WHERE datediff(current_date,order_date)<90 OR datediff(current_date,order_date)<90 is null;

-- Find the best selling products category
SELECT P.Category,sum(oi.quantity) AS Total_Sales
FROM products p
JOIN order_items oi on p.productS_id=oi.product_id
GROUP BY P.Category
ORDER BY TOTAL_SALES DESC
LIMIT 1;
-- ProductS and their revenue
SELECT product_name,sum(quantity*unit_price) AS revenue
FROM products p
JOIN order_items oi
ON p.Products_id=oi.product_id
GROUP BY Product_name
ORDER BY REVENUE DESC;
-- The cheapest product
SELECT product_name,sum(quantity*unit_price) AS revenue
FROM products p
JOIN order_items oi
ON p.Products_id=oi.product_id
GROUP BY Product_name
ORDER BY REVENUE ASC
LIMIT 1;
-- Average orders per product
SELECT Round(AVG( Total_Quantities),2) as Average
FROM(SELECT order_item_id,sum(quantity) as Total_Quantities
From order_items
GROUP BY order_item_id)T;
-- Orders worth more than 10000
SELECT  product_id,sum(unit_price*quantity) AS Total
FROM order_items  
GROUP BY Product_id
HAVING sum(unit_price*quantity)>10000;
-- Top 3 cities by revenue
SELECT City,sum(unit_price*quantity) AS TOTAL
FROM order_items oi
JOIN orders o ON oi.order_id=o.order_id
JOIN customers C ON O.Customer_id= C.Customer_id
GROUP BY CITY
ORDER BY sum(unit_price*quantity) DESC ;
-- Alternative
SELECT C.CITY,sum(oi.unit_price*oi.quantity) AS Revenue
FROM customers c
JOIN  ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID
JOIN order_items OI ON OI.order_id=O.order_id
GROUP BY C.CITY
ORDER BY sum(oi.unit_price*oi.quantity)  DESC
LIMIT 3;
