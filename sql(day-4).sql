create database joshini;
use joshini;
create table student(id int primary key auto_increment,name varchar(50),marks int);
insert into student(name,marks)values("joshni",67),("ramya",89),("kavya",45),("puji",100);
select * from student;

-- operators and aggregators
-- operators


-- arithmetic operators:-----  +,-,*,/,%
select name,marks,marks+200 as increment_marks from student double_marks;
select name,marks,marks-25 as decrement_marks from student double_marks;

-- comparision operators-- =,>,<,>=,<=,!=
select * from student where name="joshni";
select* from student where marks>40;
select* from student where marks<70;
select* from student where marks>=50;
select* from student where marks<=50;
select * from student where marks!=50;

-- logical operators --- and,or,not
select * from student where name ="ramya" and marks>=50;
select * from students where name="janu" or marks=67;
select * from student where name ="puji" or marks=100;
select * from student where not name="kavya";


-- special operators:--- between ,in, like,null, and not null

select * from student where name="ramya" and marks>=45;
select * from student where marks between 56 and 92;

select * from student where marks=45 or marks=67;
select * from student where marks in(45,67);

select * from student where name like "k%";
select * from student where name like "%i";

select * from student where name is null;
select * from student where name is not null;


-- Aggregators
-- count(),sum(),min(),max() and avg()


select count(*)as noofstds from student;
select sum(marks)as totalmarks from student;
select max(marks)as highestmarks from student; 
select min(marks)as lowestmarks from student; 
select avg(marks)as avgmarks from student; 

