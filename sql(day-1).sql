# table:it is a collection of rows and cols
# row :it is nothing but one record 
# col:vertical data
# database:it is a collection of tables


create database college;    # creates a new database
show databases;
use college;


create table students(id int primary key,name varchar(50),grade varchar(10));   # to create a table
show tables;
select * from students;    # to fetch all records in a table
select name from students;



insert into students(id,name,grade)    # primary key was givesz so it will comes in order
values(1,"ramu","a"),                    # main purpose of primary key is to aviod duplicates
(2,"ravi","b"),
(3,"vani",'a'),
(5,"joshni",'f'),
(4,"janu","d");
insert into students(id,name,grade) 
values(6,"sai","a+");





