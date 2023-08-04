---alter table
create table amazon_orders
(
order_id integer, 
order_date date,
amount decimal(6,2),
product_name varchar(100),
customer_id varchar(20),
payment_mode varchar(10)
--mobile_number varchar(10)
);
--credit card
insert into amazon_orders values(1,'2023-07-25',3999.9,'baybee', 'ankitbansal6','UPI');
insert into amazon_orders values(2,'2023-07-25',5000,'baybee', 'rahulbansal','Credit');

alter table amazon_orders add mobile_number varchar(10)

alter table amazon_orders drop column mobile_number 

--alter table amazon_orders rename column mobile_number to mobile

alter table amazon_orders alter column order_date datetime
delete from amazon_orders where order_id=3
insert into amazon_orders values(3,'2023-07-26 02:10:05',6000,'shirt', 'amit','Credit','9999900000');

alter table amazon_orders alter column payment_mode varchar(10)
alter table amazon_orders alter column product_name integer

select * from amazon_orders

insert into amazon_orders(order_id,amount) values(4,5000);

insert into amazon_orders(amount,order_id) values(6000,5);

delete from amazon_orders
----------------------
--constraints
create table amazon_orders
(
--order_id integer not null ,  --not null constraint
--order_id integer unique,  --not null constraint
order_id integer primary key,  --not null constraint
order_date date,
amount decimal(6,2) not null,
product_name varchar(100),
customer_id varchar(20) not null,
payment_mode varchar(10),
mobile_number varchar(10)
);

insert into amazon_orders values(null,'2023-07-26 02:10:05',6000,'shirt', 'amit','Credit','9999900000');
--primary key -> not null + unique

create table amazon_orders
(
--order_id integer not null ,  --not null constraint
--order_id integer unique,  --not null constraint
order_id integer primary key,  --not null constraint
order_date date,
amount decimal(6,2) not null check (amount>0),
product_name varchar(100),
customer_id varchar(20) not null,
payment_mode varchar(15) check(payment_mode in ('UPI','CREDIT CARD','DEBIT CARD')),
mobile_number varchar(10) default '0000000000'
);

insert into amazon_orders values(1,'2023-07-26 02:10:05',100,'shirt', 'amit','CASH','9999900000');
insert into amazon_orders values(2,'2023-07-26 02:10:05',100,'shirt', 'amit','UPI',default);

create table amazon_orders
(
--order_id integer not null ,  --not null constraint
--order_id integer unique,  --not null constraint
order_id integer primary key,  --not null constraint
order_date date,
amount decimal(6,2) not null ,
product_name varchar(100),
customer_id varchar(20) not null,
payment_mode varchar(15) check(payment_mode in ('UPI','CREDIT CARD','DEBIT CARD')),
mobile_number varchar(10) default '0000000000',
constraint amount_positive check (amount>0 and payment_mode in ('UPI') )
);

insert into amazon_orders values(2,'2023-07-26 02:10:05',0,'shirt', 'amit','UPI',default);

select * from amazon_orders

create table amazon_orders
(
order_id integer, 
order_date date,
amount decimal(6,2),
product_name varchar(100),
customer_id varchar(20),
payment_mode varchar(10),
mobile_number varchar(10)
);

alter table amazon_orders add constraint un_orderid unique(order_id)

alter table amazon_orders add constraint amount_positive check(amount>0)

alter table amazon_orders drop constraint amount_positive check(amount>0)


create table amazon_orders
(
--order_id integer not null ,  --not null constraint
--order_id integer unique,  --not null constraint
order_id integer primary key,  --not null constraint
order_date date not null unique,
amount decimal(6,2) not null check (amount>0),
product_name varchar(100) not null unique,
customer_id varchar(20) not null,
payment_mode varchar(15) check(payment_mode in ('UPI','CREDIT CARD','DEBIT CARD')),
mobile_number varchar(10) default '0000000000'
);

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'MY_SCHEMA' AND TABLE_NAME= 'MY_TABLE' ;

SELECT *
FROM INFORMATION_SCHEMA.TABLES
describe amazon_orders

EXEC sp_helpconstraint 'amazon_orders';
EXEC sp_help 'amazon_orders';




insert into amazon_orders values(2,'2023-07-26 02:10:05',100,'shirt', 'amit','UPI',default);

insert into amazon_orders(order_id,amount) values(null,100);
select * from amazon_orders
create table amazon_orders
(
order_id integer unique, 
order_date date,
amount decimal(6,2),
product_name varchar(100),
customer_id varchar(20),
payment_mode varchar(10),
mobile_number varchar(10) default '0000000000'
primary key p_abc (order_id,product_id)
);

select * from amazon_orders
shirt 
Shirt

