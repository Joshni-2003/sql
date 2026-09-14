create database custo;
use custo;
create table products(id int primary key auto_increment,name varchar(5),price int,quality varchar(20));
insert into products(name,price,quality)values("ram",1000,"good"),("sai",20000,"excellent"),("hari",4500,"very bad"),("banu","3000","cheap");
select * from products;
select name from products;
# to add a column to the existing table
alter table products add column item_name varchar(50);
# to add data to that one column we use update
update products set item_name="AC" where id=4;
update products set item_name="laptop";
insert into products(name,price,quality,item_name)value("joshni",15000,"super","washing machine");
alter table products modify name varchar(20);
update products set name="venu" where id=4;

-- alter-----> modifications,add,delete  ---- to change the table strucure we use alter command-- 
-- update ----> to add data to one column or replaace the data we use update cmnd

alter table products rename to product;  --- rename the table name
select * from product;

alter table product
rename column id to produccct_id;  --- rename the column



