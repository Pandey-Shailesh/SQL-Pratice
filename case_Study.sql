CREATE database if not exists dannys_diner;
 
 use dannys_diner;
 
CREATE TABLE sales (
customer_id VARCHAR(1),
order_date DATE,
product_id int
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  product_id int,
  product_name VARCHAR(5),
  price int
);

 
INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
  
  show tables;
   select * from members;
   select * from menu;
   select * from sales;
  
  
  
-- 1. What is the total amount each customer spent at the restaurant?
#soln:-
select sales.customer_id , sum(menu.price) from menu , sales  where  menu.product_id = sales.product_id group by sales.customer_id;
-- 2. How many days has each customer visited the restaurant?
#soln:-
select  sales.customer_id, count( distinct sales.order_date) from sales group by sales.customer_id; 

-- 3. What was the first item from the menu purchased by each customer?
#soln:-
#select menu.product_name,sales.customer_id, min(order_date) from menu , sales  group by sales.customer_id;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
#soln:-
Select M.product_name , Count(S.product_id)
From Menu m, sales s 
where m.product_id = s.product_id
Group by M.product_name
Order by Count(S.product_id) desc;
-- 5. Which item was the most popular for each customer?
#soln:-
#select  sales.customer_id, max(sales.product_id), menu.product_name from sales, menu where sales.product_id=menu.product_id  group by sales.customer_id; 
-- 6. Which item was purchased first by the customer after they became a member?
#soln:-

-- 7. Which item was purchased just before the customer became a member?
#soln:-

-- 8. What is the total items and amount spent for each member before they became a member?
#soln:-
select sales.customer_id, sum(menu.price),count(sales.product_id)
from menu,sales,members
where (menu.product_id=sales.product_id)  and sales.order_date<members.join_date
 and (sales.customer_id=members.customer_id) 
 group by sales.customer_id;
-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
#soln:-

/*10. In the first week after a customer joins the program (including their join date) they 
earn 2x points on all items, not just sushi - how many points do customer A and B 
have at the end of January?
*/  
#soln:-
