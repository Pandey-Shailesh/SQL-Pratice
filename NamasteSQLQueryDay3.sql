--select
select * from orders;

select order_id , product_name , order_date 
from orders;
-- top 
select top 5 * 
from orders;
--order by (asc)
select order_id , product_name , order_date 
from orders 
order by order_date;
--order by (desc)
select order_id , product_name , order_date ,customer_id
from orders 
order by order_date desc,customer_id asc;

select top 10 order_id , product_name , order_date ,customer_id
from orders 
order by order_date desc,customer_id asc;

-- order of execution :-  from -> select ->order by -> top 

-- where clause 
select order_id, order_date,category, sales 
from orders 
where category='Furniture';

select order_id, order_date,category, sales,quantity
from orders 
where order_date='2019-10-11';

select order_id, order_date,category, sales,quantity
from orders 
where quantity !=3;
-- in clause 
select order_id, order_date,category, sales 
from orders 
where category in ('Furniture','Technology');

select order_id, order_date,category, sales,quantity
from orders 
where quantity in (3,4,7);

-- between clause
select order_id, order_date,category, sales,quantity
from orders 
where quantity between 4 and 8;

select order_id, order_date,category, sales,quantity
from orders 
where order_date between '2019-10-11' and '2019-12-12'
order by order_date;
--distinct keyword
select distinct category from orders;

select  distinct quantity
from orders 
where quantity between 4 and 8
order by quantity;


--not in (!)
select order_id, order_date,category, sales 
from orders 
where category not in ('Furniture','Technology');

select order_id, order_date,category, sales,quantity
from orders 
where quantity not in (3,4,7);

-- not between (!)
select order_id, order_date,category, sales,quantity
from orders 
where quantity not between 4 and 8;


-- and clause
select order_id, order_date,category, sales,quantity,segment 
from orders 
where category='Furniture' and  segment='Consumer'
and order_date between '2019-10-11' and '2019-12-12'
order by order_date;

--or clause 
select order_id, order_date,category, sales,quantity,segment 
from orders 
where category='Furniture' or  segment='Consumer'
or order_date between '2019-10-11' and '2019-12-12'
order by order_date;


select order_id, order_date,category, sales,quantity,segment 
from orders 
where (category='Furniture' or  segment='Consumer')
and (order_date between '2019-10-11' and '2019-12-12'and quantity =3)
order by order_date;

-- is null
select * 
from orders 
where postal_code is null;

-- is not null 
select * 
from orders 
where postal_code is not null;

--Pattern Matching
--like(%)
select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like 'b%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%b%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%b';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%ab%';


--like (_)
select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '_t%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like 'm_t%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '__t%';

--not like 
select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name not like '%a_t%';


select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%e[i ]g%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%e[^i apq]g%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%a[a-d]i%';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%a%a%a';

select order_id, order_date,customer_name, sales,quantity,segment 
from orders
where customer_name like '%a%a%a' escape '%'; --symbole we use after escape

--order of exection ->  from-> where ->select (or distinct) ->order by ->top