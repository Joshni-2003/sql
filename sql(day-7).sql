create database joinu;
use joinu;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT,
    age INT,
    city VARCHAR(50)
);
INSERT INTO Students (student_id, student_name, dept_id, age, city)
VALUES
(1, 'Ramesh', 10, 20, 'Hyderabad'),
(2, 'Sita', 20, 21, 'Chennai'),
(3, 'Kiran', 10, 22, 'Bangalore'),
(4, 'Lakshmi', 30, 23, 'Hyderabad'),
(5, 'Rajesh', NULL, 24, 'Pune');
select * from Students;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    hod VARCHAR(50),
    fee_per_year INT
);
INSERT INTO Departments (dept_id, dept_name, location, hod, fee_per_year)
VALUES
(10, 'CSE', 'Hyderabad', 'Dr. Rao', 50000),
(20, 'ECE', 'Chennai', 'Dr. Kumar', 45000),
(30, 'Mechanical', 'Bangalore', 'Dr. Singh', 48000),
(40, 'Civil', 'Pune', 'Dr. Sharma', 40000);

select * from Departments;

-- join:combine two or more tables
-- LEFT JOIN :--- all records from left table and matching records from right table.
-- Show all students with department name, ordered by student_name ASC. 
select s.student_name,d.dept_name
from Students s
left join Departments d
on s.dept_id=d.dept_id
order by s.student_name;


select s.student_name,d.dept_name
from Students s
left join Departments d
using(dept_id) order by s.student_name;

-- List students with dept_name and fee_per_year, ordered by fee_per_year DESC, limit 3 rows.
select s.student_name,d.dept_name,d.fee_per_year
from Students s
left join Departments d
using(dept_id)
order by d.fee_per_year desc
limit 3;


-- 	 Count total number of students in each department (use GROUP BY dept_name). 
select d.dept_name,count(s.student_id)
from Students s
left join Departments d
using(dept_id)
group by d.dept_name;

--   Show dept_name, number of students, and use HAVING COUNT(student_id) > 1
select d.dept_name,count(s.student_id) 
from students s
left join departments d
using(dept_id)
group by d.dept_name
having count(s.student_id) >1;


-- Find average age of students in each department (include departments with no students). 
select d.dept_name,avg(s.age)
from departments d
left join students s
using(dept_id)
group by d.dept_name;


-- Show dept_name and total fees collected (SUM(fee_per_year)) only for departments with at least 2 students. 
select d.dept_name,sum(d.fee_per_year),count(s.student_id)
from students s
left join departments d
using(dept_id)
group by d.dept_name
having count(s.student_id)>=2;

-- Display student_name, dept_name, and location, but skip first 2 rows using OFFSET. 
select s.student_name,d.dept_name,d.location
from students s
left join departments d
using(dept_id) limit 3 offset 2;

-- Show dept_name, max student age in each dept, order by age DESC. 
select d.dept_name,max(s.age)
from students s
left join departments d
using(dept_id)
group by d.dept_name
order by max(s.age) desc;


-- Find all students with no department assigned (NULL dept_id).
select *
from students s
left join departments d
using(dept_id)
where s.dept_id is null;

-- Show dept_name, student_name, and HOD for first 5 rows, ordered by dept_name.
select d.dept_name,s.student_name,d.hod 
from students s
left join departments d
using(dept_id) order by d.dept_name limit 5;


-- Right join

--  Show all departments with student names, ordered by dept_name ASC
select d.dept_name,d.location,d.hod,d.fee_per_year,s.student_name
from students s
right join departments d	
using(dept_id)
order by d.dept_name;


-- Show dept_name, fee_per_year, and student_name, replace NULL with "No Student", limit 4 rows.

select d.dept_name,d.fee_per_year,coalesce(s.student_name,"no student")
from students s
right join departments d
using(dept_id) limit 4;


--  Count number of students in each department (use GROUP BY dept_name), ordered by count DESC
select d.dept_name,count(s.student_id)
from students s
right join departments d
using(dept_id)
group by d.dept_name
order by count(s.student_id) desc;

SELECT d.dept_name, COUNT(s.student_id) AS student_count
FROM Departments d
LEFT JOIN Students s
USING(dept_id)
GROUP BY d.dept_name
ORDER BY student_count DESC;

-- Show dept_name and total number of students, only where count > 0 (use HAVING)
select d.dept_name,count(s.student_id)
from students s
right join departments d
using(dept_id)
group by d.dept_name
having count(s.student_id)>0;

-- Find average age of students per department, include departments without students
select d.dept_name,avg(s.age)
from students s
right join departments d
using(dept_id)
group by d.dept_name;


--  Show dept_name, total fees collected (SUM(fee_per_year)), order by SUM DESC
select d.dept_name,sum(d.fee_per_year) as total
from students s
right join departments d
using(dept_id)
group by d.dept_name
order by total desc;

-- Find departments with no students (student_name IS NULL)
select d.dept_name,s.student_name
from students s
right join departments d
using(dept_id)
where s.student_name is null;


-- Show dept_name, fee_per_year, and student_name, but skip first 2 results using OFFSET
select d.dept_name,d.fee_per_year,s.student_name
from students s
right join departments d
using(dept_id) limit 3 offset 2;

-- Show max age of students per department, limit to 3 rows
select d.dept_name,max(s.age)
from students s
right join departments d
using(dept_id)
group by d.dept_name limit 3;


--  Group by dept_name, show dept_name and count of students, and filter with HAVING COUNT(student_id) >= 2
select d.dept_name,count(s.student_id)
from students s
right join departments d
using(dept_id)
group by d.dept_name
having count(s.student_id)>=2;
