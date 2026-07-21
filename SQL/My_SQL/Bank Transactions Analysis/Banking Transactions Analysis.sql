USE banking_transactions_analysis;
-- Creating a customer table
CREATE TABLE customers (customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
gender VARCHAR(10),
city VARCHAR(50),
account_open_date DATE);
-- creating account table
CREATE TABLE accounts (account_id INT PRIMARY KEY,
customer_id INT,
account_type VARCHAR(30),
branch_name VARCHAR(100),
opening_balance DECIMAL(12,2));
-- Creating Transaction Table
CREATE TABLE transactions (transaction_id INT PRIMARY KEY,
account_id INT,
transaction_date TIMESTAMP,
transaction_type VARCHAR(20),
amount DECIMAL(12,2));
-- Inserting Sample Customers
INSERT INTO customers VALUES
(1,'Rahul Sharma','Male','Mumbai','2023-01-10'),
(2,'Priya Verma','Female','Delhi','2023-02-18'),
(3,'Amit Patel','Male','Pune','2023-04-12'),
(4,'Sneha Joshi','Female','Bangalore','2023-05-22'),
(5,'Rohan Gupta','Male','Hyderabad','2023-08-01');
-- Inserting Sample Accounts
INSERT INTO accounts VALUES
(101,1,'Savings','Mumbai',50000),
(102,2,'Savings','Delhi',35000),
(103,3,'Current','Pune',100000),
(104,4,'Savings','Bangalore',45000),
(105,5,'Current','Hyderabad',75000);
-- Inserting Sample Transactions
INSERT INTO transactions VALUES
(1001,101,'2025-01-05 10:15:00','Deposit',15000),
(1002,101,'2025-01-06 12:30:00','Withdrawal',5000),
(1003,102,'2025-01-07 14:20:00','Deposit',25000),
(1004,103,'2025-01-08 16:10:00','Withdrawal',30000),
(1005,104,'2025-01-09 09:45:00','Deposit',12000),
(1006,105,'2025-01-10 11:00:00','Withdrawal',10000);
-- Total Transactions WITH 0 DECIMAL PLACE
SELECT TRUNCATE( SUM(AMOUNT),0) as Total_Transactions
FROM transactions;
-- Total Deposits
SELECT Transaction_type,sum(amount) AS Total_Deposits
FROM transactions
GROUP BY transaction_type
HAVING transaction_type='deposit';
-- Total Withdrawals
SELECT Transaction_type,Truncate(sum(amount),0) AS Total_Withdrawal
FROM transactions
GROUP BY transaction_type
HAVING transaction_type='Withdrawal';
-- Average Transactions
SELECT Concat('$',Round(avg(amount),2)) AS AVG_Transaction
FROM transactions;
-- Net cash flow
CREATE VIEW depo AS(
SELECT Transaction_type,sum(amount) AS Total_Deposits
FROM transactions
GROUP BY transaction_type
HAVING transaction_type='deposit');

CREATE VIEW With_drawal AS (
SELECT Transaction_type,Truncate(sum(amount),0) AS Total_Withdrawal
FROM transactions
GROUP BY transaction_type
HAVING transaction_type='Withdrawal');

SELECT concat( '$',Truncate((Total_Deposits-Total_Withdrawal),0)) AS Net_Cash_Flow
FROM depo,with_drawal;
-- Current Account Balance
SELECT 
    o.account_id,
    o.opening_balance,
    -- Calculate total deposits (defaulting to 0 if none exist)
    COALESCE(SUM(CASE WHEN t.transaction_type = 'deposit' THEN t.amount ELSE 0 END), 0) AS total_deposits,
    -- Calculate total withdrawals (defaulting to 0 if none exist)
    COALESCE(SUM(CASE WHEN t.transaction_type = 'withdrawal' THEN t.amount ELSE 0 END), 0) AS total_withdrawals,
    -- Final current balance formula
    (o.opening_balance 
     + COALESCE(SUM(CASE WHEN t.transaction_type = 'deposit' THEN t.amount ELSE 0 END), 0) 
     - COALESCE(SUM(CASE WHEN t.transaction_type = 'withdrawal' THEN t.amount ELSE 0 END), 0)
    ) AS current_balance
FROM accounts o
LEFT JOIN transactions t ON o.account_id = t.account_id
GROUP BY o.account_id, o.opening_balance;
-- *Account_type analysis
SELECT a.account_type,COALESCE(SUM(CASE WHEN account_type='Savings' THEN a.opening_balance ELSE 0 END),0) AS SAVINGS,
COALESCE(SUM(CASE WHEN account_type='Current' THEN a.opening_balance ELSE 0 END ),0) AS CURRENT,
COALESCE(SUM(CASE WHEN transaction_type='Deposit' THEN t.amount ELSE 0 END),0)AS 'Deposit',
COALESCE(SUM(CASE WHEN transaction_type='Withdrawal' THEN t.amount ELSE 0 END),0)AS 'Withdrawal',
(a.account_type
+COALESCE(SUM(CASE WHEN transaction_type='Deposit' THEN t.amount ELSE 0 END),0)
-COALESCE(SUM(CASE WHEN transaction_type='Withdrawal' THEN t.amount ELSE 0 END),0)) AS Balance
FROM  accounts a
LEFT JOIN transactions t
ON a.account_id=t.account_id
GROUP BY a.account_type;
-- Branch balance
SELECT a.branch_name,a.opening_balance,COALESCE(SUM(CASE WHEN transaction_type='Deposit'THEN t.amount ELSE 0 END),0) AS Deposit,
COALESCE(SUM(CASE WHEN transaction_type='Withdrawal'THEN t.amount ELSE 0 END),0) AS Withdrawal,
(a.opening_balance
+COALESCE(SUM(CASE WHEN transaction_type='Deposit'THEN t.amount ELSE 0 END),0)
-COALESCE(SUM(CASE WHEN transaction_type='Withdrawal'THEN t.amount ELSE 0 END),0) )as Balance
FROM accounts a
LEFT JOIN transactions t ON a.account_id=t.account_id
GROUP BY  a.branch_name,a.opening_balance
ORDER BY Balance desc;
-- Peak hours
SELECT Transaction_type,substring(TIME(transaction_date),1,5) AS Trasaction_Time
FROM TRANSACTIONS;
