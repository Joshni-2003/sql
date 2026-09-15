create database grp;
use grp;


-- group by :group the rows ,we have to use aggregate function.


CREATE TABLE Orders (
order_id INT PRIMARY KEY, customer_name VARCHAR(50), product_category VARCHAR(30), product_name VARCHAR(50), quantity INT,
price DECIMAL(8,2),
order_date DATE
);
select * from orders;
INSERT INTO Orders VALUES
(1, 'Alice', 'Electronics', 'Mobile', 2, 15000, '2025-01-12'),
(2, 'Bob', 'Electronics', 'Laptop', 1, 55000, '2025-01-13'),
(3, 'Alice', 'Clothing', 'T-Shirt', 3, 500, '2025-01-14'),
(4, 'David', 'Clothing', 'Jeans', 2, 1200, '2025-01-15'),
(5, 'Bob', 'Electronics', 'Headphones', 4, 2000, '2025-01-16'),
(6, 'Charlie', 'Furniture', 'Chair', 5, 3000, '2025-01-17'),
(7, 'Alice', 'Electronics', 'Laptop', 1, 55000, '2025-01-18'),
(8, 'David', 'Clothing', 'T-Shirt', 2, 500, '2025-01-19'),
(9, 'Charlie', 'Furniture', 'Table', 1, 7000, '2025-01-20'),
(10, 'Bob', 'Clothing', 'Shirt', 3, 800, '2025-01-21');

-- 	Find the total quantity ordered by each customer.
select customer_name,sum(quantity)
from orders
group by customer_name;

--  Count the number of orders placed by each customer.
select customer_name,count(order_id)
from orders
group by customer_name;
select customer_name,count(*)
from orders
group by customer_name;

-- Find the total revenue (quantity × price) for each product category.
select product_category,sum(quantity*price)as totalrevenue
from orders
group by product_category;

-- Show the average price of products in each category.
select product_category,avg(price)
from orders
group by product_category;

-- Find the total quantity of each product ordered
select product_name,sum(quantity)
from orders
group by product_name;

-- Show the total revenue per customer.
select customer_name,sum(quantity*price)as totalrev
from orders
group by customer_name;

-- Find the maximum quantity ordered in each product category.
select product_category,max(quantity)
from orders
group by product_category;

-- Show the average quantity per order for each customer.
select customer_name,avg(quantity)
from orders
group by customer_name;

-- Find the number of different products ordered in each category.
select product_category,count(product_name)
from orders
group by product_category;

select product_category,count(distinct product_name)as unq
from orders
group by product_category;

-- Show the total orders placed on each date.
select order_date,count(order_id)
from orders
group by order_date;



-- ORDERBY CLAUSE :--
-- Show all orders sorted by order_date in ascending order.
select * from orders order by order_date;
select * from orders order by order_date asc;

-- Show all orders sorted by price in descending order.
select * from orders order by price desc;

-- List all orders sorted by quantity in ascending order.
select * from orders order by quantity asc;

-- Display all products sorted alphabetically by product_name.
select * from orders order by product_name asc;

-- Show all orders sorted by customer_name alphabetically.
select * from orders order by customer_name asc;

-- Show all orders sorted first by product_category, then by price descending.
select * from orders order by  product_category,price desc;

-- Display all orders sorted by customer_name, then by order_date descending.
select * from orders order by customer_name,order_date desc;


-- Show all orders sorted by price ascending, then quantity descending.
select * from orders order by price asc,quantity desc;


-- Display all orders sorted by order_date descending, then price descending.
select * from orders order by order_date desc,price desc;

-- List all products sorted by product_category ascending and product_name descending.
select * from orders order by product_category asc,product_name desc;

-- Find the total quantity ordered by each customer and sort the results by total quantity in descending order.
select customer_name,sum(quantity)as totalqnt
from orders
group by customer_name
order by totalqnt desc;

-- Find the total revenue per product category and sort the results by revenue in descending order.
select product_category,sum(quantity*price)as totalrev
from orders
group by product_category
order by totalrev desc;

--  Find the average price per product category and sort the results alphabetically by category name.
select product_category,avg(price)
from orders
group by product_category
order by product_category asc;

-- Find the number of orders per customer and sort the results by customer name alphabetically.
select customer_name,count(order_id)as numoforders
from orders
group by customer_name
order by customer_name;

-- Find the total quantity ordered per product and sort the results by quantity in descending order.
select product_name,sum(quantity)
from orders
group by product_name
order by sum(quantity) desc;