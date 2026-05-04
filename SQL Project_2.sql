CREATE DATABASE shop_db;
USE shop_db;
DROP database shop_db;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO Customers VALUES
(1,'Karthiga','Chennai'),
(2,'Ram','Madurai'),
(3,'Kishor','Coimbatore'),
(4,'Nirmal','Trichy'),
(5,'Dhanush','Salem');
SELECT*FROM Customers;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders VALUES
(101,1,'2024-01-01',5000),
(102,2,'2024-01-02',3000),
(103,3,'2024-01-03',7000),
(104,1,'2024-01-04',2000),
(105,5,'2024-01-05',9000);
SELECT*FROM Orders;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO Products VALUES
(1,'Laptop','Electronics',50000),
(2,'Phone','Electronics',20000),
(3,'Shoes','Fashion',3000),
(4,'Watch','Accessories',4000),
(5,'Bag','Fashion',1500);
SELECT*FROM Products;

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
    );
INSERT INTO Order_Items VALUES
(1,101,1,1),
(2,102,2,2),
(3,103,3,1),
(4,104,4,1),
(5,105,5,3);
SELECT*FROM Order_Items;
ALTER TABLE Customers ADD email VARCHAR(100);
ALTER TABLE Customers DROP COLUMN email;
UPDATE Customers SET city='Chennai' WHERE customer_id=2;
SELECT * FROM Customers;

SELECT DISTINCT city FROM Customers;

SELECT * FROM Customers WHERE city='Chennai';

SELECT * FROM Customers ORDER BY name;

SELECT * FROM Customers WHERE name LIKE 'K%';

SELECT * FROM Orders WHERE amount BETWEEN 2000 AND 7000;

SELECT * FROM Customers WHERE customer_id IN (1,3,5);

SELECT * FROM Customers WHERE name LIKE 'K%';

SELECT * FROM Orders WHERE amount BETWEEN 2000 AND 7000;

SELECT * FROM Customers WHERE customer_id IN (1,3,5);

SELECT COUNT(*) FROM Customers;

SELECT SUM(amount) FROM Orders;

SELECT AVG(amount) FROM Orders;

SELECT MIN(amount), MAX(amount) FROM Orders;

SELECT customer_id, SUM(amount) 
FROM Orders 
GROUP BY customer_id;
SELECT customer_id, SUM(amount) 
FROM Orders 
GROUP BY customer_id
HAVING SUM(amount) > 5000;SELECT c.name, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id=o.customer_id;

SELECT c.name, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id=o.customer_id;

SELECT c.name, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id=o.customer_id;

SELECT c.name, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id=o.customer_id
UNION
SELECT c.name, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id=o.customer_id;

SELECT * FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Orders 
    WHERE amount > (SELECT AVG(amount) FROM Orders)
);
SELECT * FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders);

SELECT customer_id, RANK() OVER(ORDER BY amount DESC) FROM Orders;

SELECT customer_id, DENSE_RANK() OVER(ORDER BY amount DESC) FROM Orders;

EXPLAIN 
SELECT c.name, o.amount
FROM Customers c
JOIN Orders o 
ON c.customer_id = o.customer_id;