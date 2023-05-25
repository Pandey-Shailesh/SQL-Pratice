-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
use pratices2;
show tables;
select * from products;
-- 1.1 Select the names of all the products in the store.
-- soln:-
select name from products;
-- 1.2 Select the names and the prices of all the products in the store.
-- soln:-
select name, price from products;
-- 1.3 Select the name of the products with a price less than or equal to $200.
-- soln:-
select name from products where price <= 200;
-- 1.4 Select all the products with a price between $60 and $120.
-- soln:-
select * from products where price >= 60 and price <= 120 ;
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
-- soln:-
select name, price*100 as cents from products;
-- 1.6 Compute the average price of all the products.
-- soln:-
select avg(price) as avg_price from products;
-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
-- soln:-
select avg(price) as avg_price from products where Manufacturer = 2;
-- 1.8 Compute the number of products with a price larger than or equal to $180.
-- soln:-
select count(name) as no_of_products from products where price >= 180;
-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
-- soln:-
select name , price from products where price >=180 order by price desc ,name ;
-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
-- soln:-
select * from products;
select * from manufacturers;
select * from products where code in (select code from manufacturers);
-- 1.11 Select the average price of each manufacturer's products, showing only the manufacturer's code.
 -- soln:-
 select avg(price) as avg_price, manufacturer from  products group by manufacturer;
-- 1.12 Select the name and price of the cheapest product.
 -- soln:-
select name, price from Products where price = (select min(price)from products);
-- 1.13 Add a new product: Loudspeakers, $70, manufacturer 2.
 -- soln:-
insert into Products (code, name, price,manufacturer) values (11, 'Loudspeakers', 70, 2);
-- 1.14 Update the name of product 8 to "Laser Printer".
 -- soln:-
 update products set name = 'Laser Printer' where code=8;
-- 1.15 Apply a 10% discount to all products.
-- soln:-
select price - price*0.10 as discount_price from products;
-- 1.16 Apply a 10% discount to all products with a price larger than or equal to $120.
-- soln:-
select price - price*0.10 as discount_price from products where price>=120;
