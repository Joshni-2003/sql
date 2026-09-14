create database employee;
use employee;
create table employee(id int primary key,name varchar(50),role varchar(50));
insert into employee(id,name,role)
values(1,"joshni","fullstack"),(2,"raju","frontend"),(3,"vamsi","backend"),(4,"janu","testing");
select * from employee;
alter table employee add column age int;    #alter:modify the structure of existing table
alter table employee add column location varchar(50);
update employee set age=12,location="tvr" where id=1;   # update the data inside table
   
update employee set age=15,location="hyd" where id=2; 

update employee set age=19,location="bang" where id=3;
update employee set age=20,location="godavari" where id=4;


alter table employee 
add column sal int default "20000",
add column blood_group varchar(10) default "o-";

alter table employee add column joining_date date default "2025-03-03";


alter table employee drop column location; 
alter table employee drop column bloodgroup; 

update employee set role="ass.eng" where id=1;

alter table employee modify column role varchar(70);   

select * from employee where name like "j_%";