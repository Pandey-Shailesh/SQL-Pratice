use hr;
select * from employees;
/*
1.Write a query to list the number of jobs available in the employees table
*/
#sol:-
select count(distinct job_id) from employees;
/*
2. Write a query to get the total salaries payable to employees
*/
#sol:-
select sum(salary) from employees; 
/*
3. Write a query to get the minimum salary from employees table.
*/
#sol:-
select min(salary) from employees;
/*
4. Write a query to get the maximum salary of an employee working as a Programmer.
*/
#sol:-
select max(salary) from employees where job_id='IT_PROG';
/*
5. Write a query to get the average salary and number of employees working the department 90.
*/
#sol:-
select avg(salary),count(*) from employees where department_id ='90';
/*
6. Write a query to get the highest, lowest, sum, and average salary of all employees.
*/
#sol:-
select max(salary),min(salary),sum(salary),avg(salary) from employees;
/*
7. Write a query to get the number of employees with the same job.
*/
#sol:-
select job_id,count(job_id) from employees group by job_id; 
 /*
8. Write a query to get the difference between the highest and lowest salaries
*/
#sol:-
select (max(salary)-min(salary)) from employees;
 /*
9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
*/
#sol:-
select manager_id,salary from employees order by salary asc limit 1 ;
 /*
10. Write a query to get the department ID and the total salary payable in each department.
*/
#sol:-
select department_id , sum(salary) from employees group by department_id;
/*
11. Write a query to get the average salary for each job ID excluding programmer.
*/
#sol:-
select job_id , avg(salary) from employees group by job_id;
/*
12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
*/
#sol:-
select job_id ,sum(salary),max(salary),min(salary),avg(salary) from employees where department_id='90' group by job_id ;
/*
13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
*/
#sol:-
select job_id,max(salary) from employees where salary>=4000 group by job_id;
/*
14. Write a query to get the average salary for all departments employing more than 10 employees.
*/
#sol:-
select * from departments;
select department_id,avg(salary) from employees group by department_id having department_id>10; 



