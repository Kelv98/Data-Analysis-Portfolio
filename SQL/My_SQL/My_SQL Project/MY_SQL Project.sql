SELECT order_id,oi.product_id,quantity_in_stock,p.unit_price
FROM sql_store.order_items oi
join products p on oi.product_id=p.product_id
order by quantity_in_stock DESC
LIMIT 10;

 -- self-joins
 USE sql_hr;
 SELECT  m.employee_id,m.first_name,e.job_title,e.first_name
 from employees e
 join employees m 
 on e.employee_id=m.reports_to;
 -- Join across multiple tables
 use sql_invoicing;
 select 
 c.client_id,
 c.name, 
 c.address,
 c.city,
 p.date,
 p.amount,
 pm.name
 from clients c
 join payments p
 on c.client_id=p.client_id
 join payment_methods pm
 on p.payment_method=pm.payment_method_id;
 -- outer joins
 SELECT p.product_id,
 p.name,
 oi.quantity
 FROM products p
 LEFT JOIN order_items oi 
 ON p.product_id=oi.product_id;
 -- outer joins across multiple tables
 SELECT o.order_date,
 o.order_id,
 sh.name AS Shipper,
 os.name AS Status
 FROM shippers sh
 LEFT JOIN orders o
 ON o.shipper_id=sh.shipper_id
 LEFT JOIN order_statuses os
 ON o.status=os.order_status_id; 
 -- Using clause
 SELECT p.date,
 p.client_id,
 c.name,
 p.amount,
 pm.name
 FROM payments p
 JOIN clients c USING (client_id)
 LEFT JOIN payment_methods pm
 on p.payment_method=pm.payment_method_id;
 -- implicit cross join
 SELECT p.name,
 sh.shipper_id
 FROM products p
 CROSS JOIN shippers sh
 ORDER BY shipper_id;
 -- explicit cross join
 SELECT P.name,
 sh.shipper_id
 FROM products P,shippers sh
 ORDER BY sh.shipper_id;
 -- INSERT INTO
 INSERT INTO clients
 VALUES (6,'Analyst KELV','O21 KIGANJO NYERI','CHAKA','CT',254-055-5096);
  INSERT INTO products (name,quantity_in_stock,unit_price)
 VALUES('KELVIN THE Analyst',70,10.07),
 ('KIDERO THE Governor',60,9.06),
 ('AGRICULTURE MANIAC',50,8.05);
 -- Unions
 SELECT customer_id,
 first_name,
 points,
 'Bronze' AS Type
 FROM customers
 WHERE points<2000
UNION
  SELECT customer_id,
 first_name,
 points,
 'Silver' AS Type
 FROM customers
 WHERE points BETWEEN 2000 AND 3000
 UNION
  SELECT customer_id,
 first_name,
 points,
 'Gold' AS Type
 FROM customers
 WHERE points>3000
 order by points desc;
 -- Create Table
 CREATE TABLE invoices_archieved AS 
 SELECT i.invoice_id,
 i.number,
  c.name AS Client,
 i.invoice_total,
 i.payment_total,
 i.invoice_date,
 i.due_date,
 i.payment_date
 FROM invoices i
 JOIN clients c
 USING(client_id)
 WHERE payment_date IS NOT NULL;
 -- Duplicates
 SELECT state,  COUNT(*)
 FROM sql_store.customers
 group by state
 having count(*)>1;
 -- Update
 UPDATE customers
 SET points= points +50
 WHERE birth_date<'1990-01-01';
 -- Sub-queries
 UPDATE orders
 SET comments='Gold Customer'
 WHERE customer_id IN 
      (SELECT customer_id
      FROM customers
      WHERE points>3000);
      -- Windows functions
      CREATE TABLE Windows_Functions(
      customer_id int,
      first_name varchar(25),
      last_name varchar(25),
      points int);
      INSERT INTO Windows_Functions
      VALUES(1,'Kelvin','Warutere',700);
      INSERT INTO Windows_Functions
      VALUES
      (2,'Curren','Gitahi',600),
      (3,'Tiffany','Wanjiru',600),
      (4,'Ras' ,'Matejagwo',500),
      (5,'Mr','Kaniaru',450),
      (6,'Mrs','Kaniaru',450),
      (7,'Coquette','Bitch',100);
       INSERT INTO Windows_Functions
      VALUES
      (8,'Kelv','The Analyst',250),
      (9,'Foreman','Bazuu',90);
      -- 1.Row_numbers
      SELECT customer_id,first_name,last_name,points,
      row_number() over (order by points DESC) AS ROWS_NUMBER
      FROM windows_functions;
      
      -- Rank
      SELECT customer_id,first_name,last_name,points,
      Rank() over(order by points DESC) AS "Rank"
      FROM Windows_Functions;
      -- Dense Rank
        SELECT customer_id,first_name,last_name,points,
      Dense_rank() over(order by points DESC) AS "Dense Rank"
      FROM Windows_Functions;
      ALTER TABLE windows_functions
      ADD column Criteria int ;
      UPDATE windows_functions
      set Criteria=1
      WHERE points=700;
        UPDATE windows_functions
      set Criteria=2
      WHERE points=600;
        UPDATE windows_functions
      set Criteria=3
      WHERE points=500;
        UPDATE windows_functions
      set Criteria=4
      WHERE points=450;
        UPDATE windows_functions
      set Criteria=5
      WHERE points=100;
        UPDATE windows_functions
      set Criteria=6
      WHERE points=250;
      -- Lead
      SELECT Customer_id,first_name,last_name,points,Criteria,
      Lead(Customer_id) OVER (PARTITION  BY Criteria ORDER BY Points DESC) AS "LEAD"
      FROM Windows_functions;
      -- LAG
        SELECT Customer_id,first_name,last_name,points,Criteria,
      Lag(Customer_id) OVER (PARTITION  BY Criteria ORDER BY Points DESC) AS "Lag"
      FROM Windows_functions;
      -- CTE'S 
      With CTE1 AS(SELECT customer_id,first_name,last_name,points FROM windows_functions)
	SELECT * FROM CTE1;
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
    SELECT round(37.006,-1) AS Rounded_off;
   -- Date/time functions
   CREATE TABLE MY_TIME
   (ID int,Start_Date DATE,End_Date DATE);
   INSERT INTO MY_TIME
   VALUES(1,2010-03-12,2025-06-02),
   (2,20-03-12,2025-06-01),
   (3,2025-03-12,2025-05-27);
     INSERT INTO MY_TIME
   VALUES(4,'2010-03-12','2025-04-07');
   
   UPDATE my_time
   SET Start_Date='2025-03-12'
   WHERE ID=1;
    UPDATE my_time
   SET Start_Date='2025-03-12'
   WHERE ID=2;
     UPDATE my_time
   SET Start_Date='2025-03-12'
   WHERE ID=4;
   SELECT current_timestamp();
   SELECT NOW();
   SELECT*,current_Date() AS Current_Date_Column FROM my_time;
   SELECT *,Date_format(Start_date,'%Y/%m/%d') AS DIGITAL FROM my_time;
   SELECT *,datediff(End_date,Start_date) AS 'NO OF DAYS' FROM my_time;
    SELECT *,date_add(End_date ,interval 7 day) AS 'Heal Day' FROM my_time;
   SELECT *,date_add(End_date ,interval 7 month) AS 'Competative Days' FROM my_time;
   SELECT *,date_add(End_date ,interval 7 year) AS 'Married Days' FROM my_time;
   SELECT*,LAST_DAY(END_DATE) AS Last_day from my_time;
   SELECT *,EXTRACT(YEAR from end_date) as YEAR FROM my_time;
    SELECT *,EXTRACT(Month from end_date) as Month FROM my_time;
     WITH CTE2 AS ( SELECT *,EXTRACT(Month from end_date) as Month FROM my_time)
     SELECT *FROM CTE2;
   -- Pivot and Un-pivot
   CREATE TABLE FRUITS_Mania(Consumer varchar(25),Fruit Varchar(25),Quantity int primary key);
   INSERT INTO FRUITS_Mania
   VALUES('Kelvin','Horn melon',2),
   ('Kelvin','Pawpaw',1),
 ('Curren','Banana',7),
 ('Kelvin','Apple',24),
 ('Curren','Horn melon',5),
    ('Tifanny','Apple',3),
    ('Tiffany','Pawpaw',9),
    ('Kelvin','Banana',17);
    UPDATE FRUITS SET Fruit='Horn_melon'
    where Fruit='Horn melon';
    UPDATE Fruits Set Fruit='Dragon_fruit' where Consumer= 'MC Njege';
    SELECT* FROM fruits;
   UPDATE fruits_mania SET Consumer='Tiffany' where Quantity=3;
    -- MySQL Pivot
     SELECT distinct Consumer,SUM(CASE WHEN Fruit='Horn_melon' THEN Quantity ELSE 
     0 end) AS 'Horn_melon',
      SUM(CASE WHEN Fruit='Pawpaw' THEN Quantity ELSE 0 end) AS 'Pawpaw',
      SUM(CASE WHEN Fruit= 'Apple' THEN Quantity ELSE 0 end) AS 'Apple',
      SUM(CASE WHEN Fruit='Dragon_fruit' THEN Quantity ELSE 0 end) AS 'Dragon Fruit',
      SUM(CASE WHEN Fruit='Banana' THEN Quantity ELSE 0 end) AS 'Banana',
      SUM(CASE WHEN Fruit='Pearl' THEN Quantity ELSE 0  end) AS 'Pearl'
      FROM FRUITS_MANIA
      group by consumer;
      
      CREATE VIEW Pivot_fruit as
      SELECT Consumer,SUM(CASE WHEN Fruit='Horn_melon' THEN Quantity ELSE 0 end) AS 'Horn_melon',
      SUM(CASE WHEN Fruit='Pawpaw' THEN Quantity ELSE 0 end) AS 'Pawpaw',
      SUM(CASE WHEN Fruit= 'Apple' THEN Quantity ELSE 0 end) AS 'Apple',
      SUM(CASE WHEN Fruit='Dragon_fruit' THEN Quantity ELSE 0 end) AS 'Dragon Fruit',
      SUM(CASE WHEN Fruit='Banana' THEN Quantity ELSE 0 end) AS 'Banana',
      SUM(CASE WHEN Fruit='Pearl' THEN Quantity ELSE 0  end) AS 'Pearl'
      FROM FRUITS
      group by consumer;
      -- Stored_Procedures
      USE sql_invoicing;
      SELECT * FROM Fruits;
      call Get_Fruit_Cake;
      call Get_quantity(17);
      call Get_who('Kelvin');
      -- Subqueries
      -- Selecting Product_ID AND Name for  quantity_in_stock<AVERAGE quantity_in_stock
       use sql_inventory;
      SELECT Product_id,name FROM products
      WHERE quantity_in_stock< (SELECT AVG(quantity_in_stock) FROM products);
      -- Insert into subquery
      create table Merchandise (Product_id int,Product varchar(30),Selling_price float,Need varchar(30));
      INSERT INTO Merchandise
      VALUES(1,"Jersey",1700,"LOOK"),
      (2,"Laptop",2100,"Asset"),
      (3,"Sling",700,"LOOK"),
      (4,"Dumpy Level",3600,"Asset"),
      (5,"Watch",400,"LOOK");
      CREATE TABLE Sales(Sale_id int,Sold_product varchar(30),Price float);
      ALTER TABLE Sales
      ADD COLUMN Status varchar(30);
      Insert into Sales
      SELECT  Product_id,Product,Selling_price ,Need
      FROM Merchandise WHERE Product_id IN(SELECT  Product_id,Product,Selling_price,Need  FROM Merchandise WHERE Selling_price>1000 );
      -- Creating Views
      CREATE VIEW Most_Sweet_Fruits AS 
      SELECT * FROM fruits_mania ;
      SELECT * FROM most_sweet_fruits order  by quantity DESC;
       SELECT * FROM most_sweet_fruits group  by quantity having quantity=9 ;
       insert into Fruits_mania
       values("MC Njege","DRAGON FRUIT",8);
       SELECT* FROM sweet_fruits;
       -- Triggers sweet_fruits
       CREATE TABLE Fruit_Fanatics(Consumer varchar(30),Fruit varchar(30),Quantity int);
       DELIMITER $$
       CREATE TRIGGER Insert_fruit
       AFTER INSERT ON fruits_mania
       FOR EACH ROW 
       BEGIN
       INSERT INTO Fruit_Fanatics (Consumer,Fruit,Quantity)
       VALUES(New.Consumer,New.Fruit,New.Quantity);
       END $$
       DELIMITER ;
      Insert into fruits_mania
      values("KIDERO","Cherry",30),
      ("Governor","Pearl",19);
      SELECT* From Fruit_fanatics ;
-- Events
Show variables like"event%";
DELIMITER $$
CREATE EVENT Delete_Payment_Total
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
DELETE  FROM invoices WHERE payment_total=0.00;
END$$;
DELIMITER ;

-- String functions
-- 1.Upper_Function
SELECT UPPER(Consumer),Fruit,Quantity FROM fruits_mania;
-- 2.Lower function
SELECT LOWER(Consumer),Fruit,Quantity FROM fruits_mania;
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
-- 7.Substring() or substr()
SELECT 'MySQLISFUN' AS COMMENT,substring('MySQLISFUN',8,3) AS 'LIKE';
SELECT 'MySQLISFUN' AS COMMENT,substr('MySQLISFUN',8,3) AS 'LIKE';
-- 8.Reverse()
SELECT REVERSE('EWE') AS UN_REVERSABLE;
-- 9.Locate(substring,string)
SELECT locate('fun','MySQLisfun') AS 'Where';
-- 10.Replace()
SELECT Replace('MySQLisboring','boring','Fascinating')AS MY_Comment;



      

      
     

    
      
      
      
 
 