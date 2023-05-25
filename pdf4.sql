use pratices1;
show tables;
select * from employees;
-- 2.1 Select the last name of all employees.
-- soln:-
select lastname from employees;
-- 2.2 Select the last name of all employees, without duplicates.
-- soln:-
select destinct lastnamme from employees;
-- 2.3 Select all the data of employees whose last name is "Smith".
-- soln:-
select * from employees where lastname = 'smith';
-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
-- soln:-
select * from employees where lastname = 'smith' or lastname = 'doe';
-- 2.5 Select all the data of employees that work in department 14.
-- soln:-
select * from departments where code = '14';
-- 2.6 Select all the data of employees that work in department 37 or department 77.
-- soln:-
select * from departments where code = '37' or code = '77';
-- 2.7 Select all the data of employees whose last name begins with an "S".
-- soln:-
select * from employees where lastname like ('S%');
-- 2.8 Select the sum of all the departments' budgets.
-- soln:-
select sum(budget) as sum_of_budget from departments;
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
-- soln:-
select department as dept_code, count(department) as number_of_emp from employees group by Department;
-- 2.10 Select all the data of employees, including each employee's department's data.
-- soln:-
select * from employees where department in (select code , name, budget from departments);
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
-- soln:-
#select name , lastname  from employees where department  in ( select code, budget from departments); ---> dot operator
-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
-- soln:-
select name , lastname  from employees where Department in (select code from departments where Budget> 60000);
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.      
-- soln:-
select code ,budget from departments where budget > (select avg(budget) from departments);
-- 2.14 Select the names of departments with more than two employees.
-- soln:-
select name from departments where code in(select department from employees group by department having count(department)>2);
-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
-- soln:-
select e.name, e.lastName from employees as e where e.department = (select s.code from (select * from departments order by budget limit 2) as s  order by budget desc limit 1);
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- soln:-
insert into departments (code , name , budget) values ('11','Quality Assurance','40000');
select * from departments;
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
-- soln:-
insert into employees (SSN , name , lastname , department) values ('847219811','Mary','Moore','11');
select * from employees;
-- 2.17 Reduce the budget of all departments by 10%.
-- soln:-
select budget - budget*0.10 as reduce_budget from departments;
-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
-- soln:-
update  employees set department ='14' where department='77';
-- 2.19 Delete from the table all employees in the IT department (code 14).
-- soln:-
delete from employees where department = '14';
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
-- soln:-
select * from departments;
delete from employees where department in ( select code from departments where budget >= 60000 );
-- 2.21 Delete from the table all employees.
-- soln:-
delete from employees;
#rollback;
select * from employees;