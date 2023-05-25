show databases;
use hr;

/*
1.Write a query to display the names (first_name, last_name) using alias 
name “First Name", "Last Name
*/
#sol:-
select first_name as 'First Name', last_name as 'Last Name' from employees order by 'First Name' desc, 'Last Name' desc;
/*
2.Write a query to get unique department ID from employee table.
*/
#sol:- 
select destinct dept_id from employees;
/*
3. Write a query to get all employee details from the employee table order 
by first name, descending.
*/
#sol:- 
select * from employees order by first_name desc;
/*
4. Write a query to get the names (first_name, last_name), salary, PF of all 
the employees (PF is calculated as 15% of salary).
*/
#sol:- 
 select first_name, last_name, salary, salary*.15 PF from employees;
/*
5. Write a query to get the employee ID, names (first_name, last_name), 
salary in ascending order of salary.
*/
#sol:- 
select employee_id,first_name,last_name,salary from employees order by salary ;
/*
6. Write a query to get the total salaries payable to employees.*/
#sol:- 
select sum(salary) from employees ;
/*
7. Write a query to get the maximum and minimum salary from employees 
table.
*/
#sol:- 
select min(salary) from employees;
select max(salary) from employees;
/*
8. Write a query to get the average salary and number of employees in the 
employees table
*/
#sol:- 
select count(employee_id), avg(salary) from employees;
/*
9. Write a query to get the number of employees working with the 
company.
*/
#sol:- 
select count(employee_id) from employees;
/*
10. Write a query to get the number of jobs available in the 
employees table.
*/
#sol:- 
 select count(distinct job_id) from employees;
/*
11. Write a query to display the name (first_name, last_name) and 
salary for all employees whose salary is not in the range $10,000 through $15,000.
*/
#sol:- 
select first_name, last_name, salary, department_id from employees where salary NOT BETWEEN 10000 and 15000;
/*
12. Write a query to display the name (first_name, last_name) and 
department ID of all employees in departments 30 or 100 in ascending 
order
*/
#sol:- 
select first_name, last_name, department_id from employees where department_id in (30, 100) order by  department_id  ;
/*
13. Write a query to display the name (first_name, last_name) and 
salary for all employees whose salary is not in the range $10,000 
through $15,000 and are in department 30 or 100.
*/
#sol:-
 select first_name, last_name, salary, department_id from employees where salary NOT BETWEEN 10000 and 15000  and department_id in (30, 100);
/*
14. Write a query to display the name (first_name, last_name) and 
hire date for all employees who were hired in 1987
*/
#sol:- 
select first_name, last_name,hire_date from employees where hire_date like ('%1987%');
/*
15. Write a query to display the first_name of all employees who have 
both "b" and "c" in their first name
*/
#sol:- 
select first_name from employees where first_name like '%b%' and first_name like '%c%';