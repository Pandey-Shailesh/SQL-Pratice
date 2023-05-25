create database IF NOT EXISTS SALES;
use SALES;
create table sales( purchase_number int not null primary key auto_increment,
data_of_purchese date not null,
custer_id int,
item_code varchar(10) not null);

create table customers(
customer_id int,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key(customer_id)
);

create table items(
item_code varchar(255),
item varchar(255),
unit_price numeric(10,2),
company_id varchar(255),
primary key(item_code)
);

create table companies(
company_id varchar(255),
copany_name varchar(255),
headquater_phone_number int(12),
primary key(company_id)
);
 drop table companies;
show tables ;

create table companies(
company_id varchar(255),
copany_name varchar(255),
headquater_phone_number int(12),
primary key(company_id)
);
show tables ;
##use sales;
##alter table sales
##ADD foreign key(coustomer_id) references customers(customer_id) On Delete Cascade;
alter table customers 
ADD unique key (email_address);

drop table customers;

create table customers (
    customer_id int auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
primary key (customer_id)
);

alter table customers
add column gender enum('M', 'F') after last_name;
insert into customers (first_name, last_name, gender, email_address, number_of_complaints)
values ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);


select * from customers;