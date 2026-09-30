-- Step 1: Create Database

CREATE DATABASE smartmart_db;
USE smartmart_db;

-- Step 2: Create Tables

-- Customers Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

-- Products Table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Sales Table

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);


-- Step 3: Insert Sample Data

-- Customers

INSERT INTO customers VALUES
(1,'Rahul Sharma','Delhi',28),
(2,'Priya Verma','Mumbai',32),
(3,'Amit Singh','Bangalore',25),
(4,'Neha Kapoor','Delhi',29),
(5,'Rohit Mehta','Pune',35),
(6,'Anjali Gupta','Mumbai',27),
(7,'Karan Patel','Ahmedabad',31),
(8,'Sneha Reddy','Hyderabad',26);

-- Products

INSERT INTO products VALUES
(101,'Laptop','Electronics',80000),
(102,'Smartphone','Electronics',40000),
(103,'Headphones','Electronics',2000),
(104,'T-Shirt','Clothing',800),
(105,'Jeans','Clothing',2000),
(106,'Microwave','Home Appliances',7000),
(107,'Refrigerator','Home Appliances',30000),
(108,'Air Conditioner','Home Appliances',45000);

-- Sales

INSERT INTO sales VALUES
(1001,1,101,1,'2024-01-10'),
(1002,2,102,2,'2024-01-11'),
(1003,3,104,3,'2024-01-12'),
(1004,4,105,2,'2024-01-12'),
(1005,5,103,4,'2024-01-13'),
(1006,6,106,1,'2024-01-14'),
(1007,7,108,1,'2024-01-14'),
(1008,8,102,1,'2024-01-15'),
(1009,1,103,2,'2024-01-16'),
(1010,2,104,5,'2024-01-17'),
(1011,3,105,1,'2024-01-18'),
(1012,4,101,1,'2024-01-19');

-- Display all customers.
select * from customers;

-- Show only customer_name and city.
select customer_name,city from customers;

-- Display all products in the Electronics category.
select * from products where category='Electronics';


-- Show products with price greater than 10,000.
select * from products where price > 10000;

-- Display unique categories.
select distinct category from products;




-- 6.	Show customers who live in Delhi.
select * from customers where city = 'Delhi';

-- 7.	Show customers with age greater than 30.
select * from customers where age > 30;

-- 8.	Display products with price between 2000 and 50000.
select * from products where price between 2000 and 50000;

-- 9.	Find orders placed after 2024-01-12.
select * from sales where order_date > '2024-01-12';

-- 10.	Display sales where quantity > 2.
select * from sales where quantity > 2;


-- 11.	Display products sorted by price (highest first).
SELECT *  FROM products ORDER BY price DESC;
-- 12.	Show top 3 most expensive products.
select * from products order by price desc limit 3;
-- 13.	Display customers sorted by age ascending.
select * from customers order by age asc;
-- 14.	Show latest 5 orders.
select * from sales order by order_date desc limit 5;

UPDATE customers
SET city = NULL
WHERE customer_id = 8;

-- 15.	Find customers where city IS NULL
select * from customers where city is null;

-- 16.	Find customers where city IS NOT NULL
select * from customers where city is not null;

-- Level  5 – Aggregations
-- 17.	Find total number of customers.
select count(*) as total_customers from customers;

-- 18.	Find average product price.
select avg(price) as avg_product_price from products;

-- 19.	Find maximum product price.
select max(price) as max_product_price from products;

-- 20.	Find total quantity sold.
select count(quantity) as total_quantity_sold from sales;

-- Level 6 – GROUP BY
-- 21.	Find number of products in each category.
select category, count(*) as total_products from products group by category;

-- 22.	Find total sales quantity by product_id.
select product_id, count(quantity) as total_sales from sales group by product_id;

-- 23.	Find average price by category.
select category, avg(price) as avg_price from products group by category;

-- Level 7 – HAVING Clause
-- 24.	Find categories where average price > 10,000.
select category, avg(price) as avg_price from products group by category having avg(price) > 10000;

-- 25.	Find products where total quantity sold > 3.
select product_id, sum(quantity) as total_quantity_sold from sales 
group by product_id having sum(quantity) > 3;

-- 26.	Find categories having more than 2 products.
select category, count(*) as product_count from products group by category having count(*) > 2;



-- Business Questions (Real Analyst Thinking)
-- 27.	Which category generates the most sales volume?
select p.category, sum(s.quantity) as total_sales 
from sales s inner join products p on s.product_id = p.product_id 
group by p.category order by sum(s.quantity) desc limit 1;
-- 28.	Which product sells the most units?
select p.product_name, sum(s.quantity) as total_units 
from sales s
 join products p on s.product_id = p.product_id 
 group by p.product_name order by total_units desc limit 1;
-- 29.	Which city has the most customers?
select city, count(*) as total_customers 
from customers group by city order by total_customers desc limit 1;
-- 30.	Which product has the highest price?
select product_name, price from products order by price desc limit 1;

