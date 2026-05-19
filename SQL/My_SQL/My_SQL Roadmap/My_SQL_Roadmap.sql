DROP DATABASE IF  EXISTS MY_SQL_Roadmap;
CREATE DATABASE MY_SQL_Roadmap;
USE MY_SQL_Roadmap;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `products` VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO `products` VALUES (2,'Pork - Bacon,back Peameal',49,4.65);
INSERT INTO `products` VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO `products` VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO `products` VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO `products` VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO `products` VALUES (7,'Sweet Pea Sprouts',98,3.29);
INSERT INTO `products` VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO `products` VALUES (9,'Longan',67,2.26);
INSERT INTO `products` VALUES (10,'Broom - Push',6,1.09);
CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL);
  INSERT INTO `order_items` VALUES (1,4,4,3.74);
INSERT INTO `order_items` VALUES (2,1,2,9.10);
INSERT INTO `order_items` VALUES (2,4,4,1.66);
INSERT INTO `order_items` VALUES (2,6,2,2.94);
INSERT INTO `order_items` VALUES (3,3,10,9.12);
INSERT INTO `order_items` VALUES (4,3,7,6.99);
INSERT INTO `order_items` VALUES (4,10,7,6.40);
INSERT INTO `order_items` VALUES (5,2,3,9.89);
INSERT INTO `order_items` VALUES (6,1,4,8.65);
INSERT INTO `order_items` VALUES (6,2,4,3.28);
INSERT INTO `order_items` VALUES (6,3,4,7.46);
INSERT INTO `order_items` VALUES (6,5,1,3.45);
INSERT INTO `order_items` VALUES (7,3,7,9.17);
INSERT INTO `order_items` VALUES (8,5,2,6.94);
INSERT INTO `order_items` VALUES (8,8,2,8.59);
INSERT INTO `order_items` VALUES (9,6,5,7.28);
INSERT INTO `order_items` VALUES (10,1,10,6.01);
INSERT INTO `order_items` VALUES (10,9,9,4.28);
CREATE TABLE `offices` (
  `office_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL);
  INSERT INTO `offices` VALUES (1,'03 Reinke Trail','Cincinnati','OH');
INSERT INTO `offices` VALUES (2,'5507 Becker Terrace','New York City','NY');
INSERT INTO `offices` VALUES (3,'54 Northland Court','Richmond','VA');
INSERT INTO `offices` VALUES (4,'08 South Crossing','Cincinnati','OH');
INSERT INTO `offices` VALUES (5,'553 Maple Drive','Minneapolis','MN');
INSERT INTO `offices` VALUES (6,'23 North Plaza','Aurora','CO');
INSERT INTO `offices` VALUES (7,'9658 Wayridge Court','Boise','ID');
INSERT INTO `offices` VALUES (8,'9 Grayhawk Trail','New York City','NY');
INSERT INTO `offices` VALUES (9,'16862 Westend Hill','Knoxville','TN');
INSERT INTO `offices` VALUES (10,'4 Bluestem Parkway','Savannah','GA');
CREATE TABLE `shippers` (
  `shipper_id` smallint(6) ,
  `name` varchar(50) );

INSERT INTO `shippers` VALUES (1,'Hettinger LLC');
INSERT INTO `shippers` VALUES (2,'Schinner-Predovic');
INSERT INTO `shippers` VALUES (3,'Satterfield LLC');
INSERT INTO `shippers` VALUES (4,'Mraz, Renner and Nolan');
INSERT INTO `shippers` VALUES (5,'Waters, Mayert and Prohaska');
USE My_SQL_Roadmap;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
   `phone` varchar(50) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0');
  INSERT INTO `customers` VALUES (1,'Babara','MacCaffrey','781-932-9754',2273);
INSERT INTO `customers` VALUES (2,'Ines','Brushfield','804-427-9456',947);
INSERT INTO `customers` VALUES (3,'Freddi','Boagey','719-724-7869',2967);
INSERT INTO `customers` VALUES (4,'Ambur','Roseburgh','407-231-8017',457);
INSERT INTO `customers` VALUES (5,'Clemmie','Betchley',NULL,3675);
INSERT INTO `customers` VALUES (6,'Elka','Twiddell','312-480-8498',3073);
INSERT INTO `customers` VALUES (7,'Ilene','Dowson','615-641-4759',1672);
INSERT INTO `customers` VALUES (8,'Thacher','Naseby','941-527-3977',205);
INSERT INTO `customers` VALUES (9,'Romola','Rumgay','559-181-3744',1486);
INSERT INTO `customers` VALUES (10,'Levy','Mynett','68 Lawn Avenue',796);
  CREATE TABLE Windows_Functions(
      customer_id int,
      first_name varchar(25),
      last_name varchar(25),
      points int);
INSERT INTO Windows_Functions
VALUES(1,'Chief','Kiogothe',700);
INSERT INTO Windows_Functions
VALUES
      (2,'Sheikh','Mustaafa',600),
      (3,'Pambana','Kastuka',600),
      (4,'Ras' ,'Matejagwo',500),
      (5,'Kuniara','Kaniaru',450),
      (6,'Loise','Nyagacheke',450),
      (7,'Coquette','Jane',100);
      INSERT INTO windows_functions
      VALUES(8,'Karwimbo','Kega',600),
      (9,'Aisha','Rehema',100),
      (10,'Stellar','Performance',600);
      ALTER TABLE windows_functions
      ADD COLUMN (Criteria int);
      UPDATE windows_functions
      SET Criteria=1
      WHERE points=700;
      UPDATE windows_functions
      SET Criteria=2
      WHERE points=600;
      UPDATE windows_functions
      SET Criteria=3
      WHERE points=500;
      UPDATE windows_functions
      SET Criteria=4
      WHERE points=450;
      UPDATE windows_functions
      SET Criteria=5
      WHERE points=100;
       CREATE TABLE MY_TIME
   (ID int,Start_Date DATE,End_Date DATE);
    INSERT INTO MY_TIME
   VALUES(1,'2025-03-12','2025-06-02'),
   (2,'2025-03-12','2025-06-01'),
   (3,'2025-03-12','2025-05-27'),
(4,'2025-03-12','2025-04-07');
USE MY_SQL_Roadmap;
  CREATE TABLE FRUITS(Consumer varchar(25) Primary Key,Fruit Varchar(25),Quantity int);
   INSERT INTO FRUITS
   VALUES('Kamanuu','Horn_melon',2),
   ('Kamanuu','Pawpaw',1),
 ('MC Njege','Banana',7),
 ('Kamanuu','Apple',24),
 ('MC Njege','Horn_melon',5),
    ('Kafenia','Apple',3),
    ('Kafenia','Pawpaw',9),
    ('Kafenia','Banana',17);
CREATE TABLE Merchandise (Product_id int,Product varchar(30),Selling_price float,Need varchar(30));
INSERT INTO Merchandise
      VALUES(1,"Jersey",1700,"LOOK"),
      (2,"Laptop",2100,"Asset"),
      (3,"Sling",700,"LOOK"),
      (4,"Dumpy Level",3600,"Asset"),
      (5,"Watch",400,"LOOK");
      CREATE TABLE Sales(Sale_id int,Sold_product varchar(30),Price float,Sales varchar(30));
  -- self joins ('USING' Clause)
  SELECT p.product_id,p.name,p.quantity_in_stock,oi.quantity
  FROM products p
  JOIN order_items oi
  USING(product_id)
  ORDER BY quantity_in_stock DESC
  LIMIT 10;
  -- Joining on multiple tables
  SELECT p.product_id,p.name,o.city,state,p.quantity_in_stock,oi.quantity
  FROM products p
  JOIN order_items oi
  USING(product_id)
  JOIN offices o
  ON oi.product_id=o.office_id
  ORDER BY QUANTITY_IN_STOCK DESC;
  -- OUTER JOINS(LEFT&RIGHT)
  SELECT p.product_id,p.name,o.address
  FROM products p 
  LEFT JOIN offices o
  ON p.product_id=o.office_id;
  SELECT oi.product_id,o.office_id,o.address,p.name,p.quantity_in_stock
  FROM products p 
  RIGHT JOIN offices o
  ON o.office_id=p.product_id
  LEFT JOIN order_items oi
  ON o.office_id=oi.product_id;
  -- implicit cross join
  SELECT p.name,sh.shipper_id
  FROM products p 
  CROSS JOIN shippers sh
  ORDER BY shipper_id;
  CREATE VIEW implicit_join AS
   SELECT p.name,sh.shipper_id
  FROM products p ,shippers sh
   ORDER BY shipper_id;
   
   SELECT count(name) FROM IMPLICIT_JOIN;
  -- Explicit cross join
    SELECT p.name,sh.shipper_id
  FROM products p ,shippers sh
   ORDER BY shipper_id;
   CREATE VIEW explicit_join AS
    SELECT p.name,sh.shipper_id
  FROM products p ,shippers sh
   ORDER BY shipper_id;
   
   SELECT count(name) FROM explicit_join;
   -- UNIONS
   SELECT *,'Bronze' as Points_Rank
   FROM CUSTOMERS
   WHERE points<2000
   UNION
   SELECT *,'Silver' as Points_Rank
   FROM CUSTOMERS
   WHERE points BETWEEN 2000 AND 3000
   UNION
   SELECT *,'Gold' as Points_Rank
   FROM CUSTOMERS
   WHERE points>3000;
   CREATE VIEW UNIO AS   SELECT *,'Bronze' as Points_Rank
   FROM CUSTOMERS
   WHERE points<2000
   UNION
   SELECT *,'Silver' as Points_Rank
   FROM CUSTOMERS
   WHERE points BETWEEN 2000 AND 3000
   UNION
   SELECT *,'Gold' as Points_Rank
   FROM CUSTOMERS
   WHERE points>3000;
   -- UNION ALL
   SELECT *,'Bronze' as Points_Rank
   FROM CUSTOMERS
   WHERE points<2000
   UNION ALL
   SELECT *,'Silver' as Points_Rank
   FROM CUSTOMERS
   WHERE points BETWEEN 2000 AND 3000
   UNION ALL
   SELECT *,'Gold' as Points_Rank
   FROM CUSTOMERS
   WHERE points>3000;
   -- LIKE& NOT-LIKE AND REGEXP
   SELECT * FROM Customers WHERE first_name LIKE 'A%';-- (percentage)
   SELECT * FROM Customers WHERE first_name LIKE '___S';-- (Underscore select an exact match)
   SELECT * FROM products WHERE NAME REGEXP ('plate$') ; -- $ end with
   SELECT * FROM products WHERE NAME REGEXP ('^pork') ;-- ^begin with

   -- Checking for duplicates
   SELECT state,count(*) from offices GROUP BY state HAVING count(*)>1;
   -- Sub-queries
   UPDATE customers
   SET first_name=' DE_SILVER'
   WHERE customer_id IN (
   SELECT customer_id FROM UNIO where points BETWEEN 2000 AND 3000);
   
SELECT customer_id,first_name,last_name,points AVERAGE FROM customers 
WHERE  points>(SELECT avg(points) FROM CUSTOMERS) ;
-- Insert subquery
INSERT INTO Sales
SELECT product_id,product,selling_price,Need FROM Merchandise 
WHERE product_id IN(SELECT product_id from merchandise where selling_price>1000 )
ORDER BY selling_price DESC;

-- Window Functions
-- Row_number
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,points, Row_number() OVER(ORDER BY POINTS DESC) AS 'Row_Number'
FROM windows_functions;

-- 2.Rank
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,points,RANK() OVER(ORDER BY points DESC) AS 'RANK'
FROM windows_functions;
-- 3.Dense_Rank
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,points,DENSE_RANK() OVER(ORDER BY points DESC) AS 'Dense_RANK'
FROM windows_functions;
CREATE VIEW DENSE_RANK_2 AS SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME,points,DENSE_RANK() OVER(ORDER BY points DESC) AS 'Densi_RANK'
FROM windows_functions;
SELECT * FROM DENSE_RANK_2 WHERE DENSi_RANK <= 2 limit 4;
-- 4.Lead
SELECT CUSTOMER_ID,first_name,last_name,points,criteria,Lead(Customer_id) 
OVER ( partition by Criteria Order By Points desc) AS Lead_Status
FROM Windows_Functions;
SELECT CUSTOMER_ID,first_name,last_name,points,criteria,Lag(Customer_id) 
OVER ( partition by Criteria Order By Points desc) AS Lag_Status
FROM Windows_Functions;

-- CTE's 
WITH CTE007 AS (SELECT * FROM UNIO)
SELECT * FROM CTE007 WHERE phone IS Null;
-- Maths Functions
    -- 1.abs(absolute)
    SELECT abs(5);
    SELECT abs(-5);
    -- 2.ceiling/ceil
    SELECT ceil(3.1);
	SELECT ceil(-3.1);
      -- 3.Floor
    SELECT floor(2.4);  
	SELECT floor(-2.4);
    -- 4.Power(base,power)
    SELECT power(3,2);
    -- Round(n,d)
    SELECT round(37.006,-1) AS Rounded;
   -- Date/time functions
   SELECT current_timestamp();
   SELECT *,current_time() as 'NOW' FROM my_time ;
   SELECT*,date_format( Start_date,'%m/%d/%Y') AS 'Zen_Time' FROM MY_TIME;
   SELECT *,datediff(End_date,Start_date) AS No_of_Days FROM MY_TIME;
   SELECT *,date_sub(End_date,interval 7 day) AS No_of_Days FROM MY_TIME;
	SELECT *,date_add(End_date,interval 7 day) AS 'Healing_Days' FROM MY_TIME;
	SELECT *,date_add(End_date,interval 7 month) AS 'Competetative_Anxiety_Days' FROM MY_TIME;
	SELECT *,date_add(End_date,interval 7 year) AS 'I_Married_Her' FROM MY_TIME;
    SELECT *,extract(YEAR FROM END_DATE) AS YEAR FROM MY_TIME;-- MONTH & DAY can also be extracted;
    -- MY_SQL pivot
    SELECT consumer,SUM(CASE WHEN Fruit='Horn melon' THEN Quantity ELSE 0 END) AS 'Horn_melon',
					SUM(CASE WHEN Fruit='Pawpaw' THEN Quantity ELSE 0 END) AS 'Pawpaw',
                    SUM(CASE WHEN Fruit='Banana' THEN Quantity ELSE 0 END) AS 'Banana',
                    SUM(CASE WHEN Fruit='Apple' THEN Quantity ELSE 0 END) AS 'Apple'
   FROM fruits GROUP BY consumer;
   -- Creating Views
   CREATE VIEW Sweet_Fruits AS SELECT* FROM fruits;
 INSERT INTO Fruits
 values('Kamodoki','Dragon_Fruit',10);
 SELECT * FROM sweet_fruits;
 -- Creating Triggers
 CREATE TABLE Fruit_Mania(Consumer varchar(30),Fruit varchar(30),Quantity int)
 DELIMITER $$
 CREATE TRIGGER Fruit_Trigger
 AFTER INSERT ON fruits
 FOR EACH ROW
 BEGIN
 INSERT INTO Fruit_mania(Consumer,Fruit,Quantity)
 VALUES(New.consumer,New.Fruit,New.Quantity);
 END$$
 DELIMITER ;
 INSERT INTO FRUITS
 VALUES('Wagashoto','Cherry',27),
 ('Yombo','Pearl',13);
 
 SELECT* FROM Fruit_mania;
 DROP TRIGGER IF EXISTS update_fruit_mania;
 DELIMITER //
 CREATE TRIGGER update_fruit_mania
 AFTER UPDATE ON FRUITS
 FOR EACH ROW
 BEGIN
 INSERT Fruit_mania(Consumer,Fruit,Quantity)
 VALUES (New.Consumer,New.Fruit,New.Quantity);
 END//
 DELIMITER ; 
 UPDATE FRUITS
 SET CONSUMER ='Yombo Ule Msee'
 WHERE Fruit='Pearl';
 SELECT * FROM fruit_mania;
 -- EVENTS
 SHOW VARIABLES LIKE "EVENT%";
 DROP EVENT IF EXISTS Delete_POINTS3675;

 DELIMITER //
 CREATE EVENT Delete_POINT3675
 ON SCHEDULE EVERY 10 SECOND
 DO
 BEGIN
 DELETE FROM Customers WHERE points= 3675;
 END//
 DELIMITER ;

 SELECT * FROM customers;
 -- String functions
-- 1.Upper_Function
SELECT UPPER(Consumer),Fruit,Quantity FROM fruit_mania;
-- 2.Lower function
SELECT LOWER(Consumer),Fruit,Quantity FROM fruit_mania;
-- 3.Concat
SELECT concat('My','SQL') AS Title;
-- 4.Concat_ws(Separator,String)
SELECT Concat_ws('_','My','SQL') AS Title;
-- 5.Length
SELECT length('Mstakabala') AS Number_Characters;
SELECT *,Length(City) AS Count_City_Character FROM sql_invoicing.clients;
-- 6.Trim(),Ltrim() & Rtrim()
SELECT '    SQL    ' AS UNTRIMED,trim('    SQL    ') AS TRIMED;
SELECT '   SQL' AS UNTRIMED,ltrim('   SQL' ) AS TRIMED;
SELECT 'SQL   ' AS UNTRIMED,Rtrim('   SQL' ) AS TRIMED;
SELECT 'United States of Africa.' AS Country,Trim(TRAILING'.''United States of Africa.');
-- 7.Substring() or substr()
SELECT 'MySQLISFUN' AS COMMENT,substring('MySQLISFUN',8,3) AS 'LIKE';
SELECT 'MySQLISFUN' AS COMMENT,substr('MySQLISFUN',8,3) AS 'LIKE';
-- 8.Reverse()
SELECT REVERSE('EWE') AS UN_REVERSABLE;
-- 9.Locate(substring,string)
SELECT locate('fun','MySQLisfun') AS 'Where';
-- 10.Replace()
SELECT Replace('MySQLisboring','boring','Fascinating')AS MY_Comment;
 
    
   


  
  
  
  

