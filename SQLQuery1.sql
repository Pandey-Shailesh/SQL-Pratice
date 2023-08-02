create table amazon_order 
(
order_id integer,
customer_id integer,
amount decimal(6,2),
order_date date,
customer_adderess varchar(100),
product_name varchar(50)
);
insert into amazon_order values (1,23,123.24,'2024-9-9','Lonawala','waterbag');
insert into amazon_order values (2,24,456.88,'2024-8-4','pune','keyboard');
insert into amazon_order values (3,25,823.24,'2024-6-19','mumbai','java book');
insert into amazon_order values (4,26,12.28,'2024-5-25','indore','bat');
insert into amazon_order values (5,27,783.2,'2024-8-11','delhi','clock');

select * from amazon_order order by customer_adderess desc;

delete amazon_order ;
select * from amazon_order;
drop table amazon_order;

-- update amazon_order set  order_id=23, customer_id= 43 where amount= 123.24;

-- DDL (Data defination language)
-- DML (Data manupulation Language)
-- DQL ( Data Query language)
-- DCL (Data Control Language )
-- TCL (Transaction  Control Language )