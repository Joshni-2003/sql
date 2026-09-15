create database havng;
use havng;

-- having:--to filter the groups.after group by we write having clause


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);
INSERT INTO employees VALUES
(1, 'Alice', 'IT', 60000, 'Hyderabad'),
(2, 'Bob', 'HR', 45000, 'Vijayawada'),
(3, 'Charlie', 'IT', 75000, 'Hyderabad'),
(4, 'David', 'Sales', 50000, 'Chennai'),
(5, 'Emma', 'HR', 55000, 'Hyderabad'),
(6, 'Frank', 'IT', 80000, 'Bangalore'),
(7, 'Grace', 'Sales', 65000, 'Hyderabad'),
(8, 'Henry', 'Finance', 70000, 'Chennai'),
(9, 'Ivy', 'Finance', 60000, 'Hyderabad'),
(10, 'Jack', 'Sales', 55000, 'Bangalore'),
(11, 'Kiran', 'IT', 65000, 'Chennai'),
(12, 'Latha', 'HR', 50000, 'Bangalore');
select * from employees;

-- Find the number of employees in each department.
select department,count(emp_id)
from employees
group by department;


-- Find departments having more than 2 employees.
select department,count(emp_id)as count
from employees
group by department
having count>2;

-- Find the average salary of each department.
select department,avg(salary)
from employees
group by department;


-- Find the total salary paid by each department.
select department,sum(salary)
from employees
group by department;

-- Find departments where the total salary is greater than 150000.
select department,sum(salary) as totalsal
from employees
group by department
having totalsal>150000;

-- Find cities having more than 2 employees.
select city,count(emp_id)as totalemps
from employees
group by city
having totalemps>2;

-- Limit 

-- Display the first 5 employees.
select * from employees limit 5;

-- Display the top 3 employees with the highest salary.
select * from employees order by salary desc limit 3;

-- Display the 2 employees with the lowest salary.
select * from employees order by salary limit 2;

-- Display the top 5 highest-paid employees.
select * from employees order by salary desc limit 5;

-- Display employees after skipping the first 3 records
select * from employees ;
select * from employees limit 7 offset 3;


-- Display 3 employees after skipping the first 2 records.
select * from employees limit 3 offset 2;

-- Display the 4th, 5th and 6th employees based on salary from highest to lowest.
select * from employees order by salary desc limit 3 offset 3;

-- Find departments having more than 2 employees, and display only the first 2 department
select department,count(emp_id) as count
from employees
group by department
having count>2
order by department limit 2;

-- Find departments whose average salary is greater than 55000, and display them in descending order of average salary.
select department,avg(salary)
from employees
group by department
having avg(salary)>55000 
order by avg(salary) desc;

-- Find the second-highest salary 
select * from employees order by salary desc limit 1 offset 1;

-- Find the 3rd highest salary using LIMIT and OFFSET.
select * from employees order by salary desc limit 1 offset 2;

-- Find the top 3 highest-paid employees from Hyderabad.
select * from employees where city="hyderabad" order by salary desc limit 3 ;

-- Find departments where:

-- number of employees is greater than 2
-- average salary is greater than 55000
-- sort by average salary in descending order



select department,count(emp_id) as count,avg(salary)as avgsal
from employees
group by department
having count>2 and avgsal>55000
order by avgsal desc;


