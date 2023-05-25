use hr;
show tables;
select * from employees;
select * from departments;

/* 26. Write a subquery that returns a set of rows to find all departments that do actually 
have one or more employees assigned to them. */
#soln:-
select * from departments where DEPARTMENT_ID in (select DEPARTMENT_ID from employees);

/* 27. Write a query that will identify all employees who work in departments located in the 
United Kingdom. */
#soln:-
select * from employees where DEPARTMENT_ID in (select DEPARTMENT_ID from departments where LOCATION_ID in 
(select LOCATION_ID from locations where COUNTRY_ID in (select COUNTRY_ID from countries where COUNTRY_NAME ='United Kingdom')));

/* 28. Write a query to identify all the employees who earn more than the average and who 
work in any of the IT departments. */
#soln:-
#update employees set job_id =' ST_MAN' where job_id ='SALESMAN' ;
#update employees set job_id =' IT_PROG' where  job_id ='DEVELOPER';
select * from employees where salary > (select avg(salary) from employees where JOB_ID= 'IT_PROG') ;
/* 29. Write a query to determine who earns more than Mr. Ozer. */
#soln:- 
select * from employees where salary > (select salary from employees where LAST_NAME= 'Ozer') ;

/* 30. Write a query to find out which employees have a manager who works for a 
department based in the US. */
#soln:-


/* 31. Write a query which is looking for the names of all employees whose salary is greater 
than 50% of their department’s total salary bill. */
#soln:-
select first_name, last_name from employees where salary >(select sum(salary)*0.50 from employees);
/* 32. Write a query to get the details of employees who are managers. */
#soln:-
select e.* from employees as e join departments as d on e.EMPLOYEE_ID = d.manager_id;
/* 33. Write a query to get the details of employees who manage a department. */
#soln:-
select e.* from employees as e join departments as d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;
/* 34. Write a query to display the employee id, name (first name and last name), salary, 
department name and city for all the employees who gets the salary as the salary earn by 
the employee which is maximum within the joining person January 1st, 2002 and December 
31st, 2003. */
#soln:-

/* 35. Write a query in SQL to display the department code and name for all departments 
which located in the city London. */
#soln:-
select  d.department_id, d.department_name from employees as e join departments as d on e.department_id = d.department_id
join locations as l on l.location_id = d.location_id where l.city = 'london';

/* 36. Write a query in SQL to display the first and last name, salary, and department ID for 
all those employees who earn more than the average salary and arrange the list in 
descending order on salary. */
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
where e.salary> (select avg(salary)from employees) order by e.salary desc;
/* 37. Write a query in SQL to display the first and last name, salary, and department ID for 
those employees who earn more than the maximum salary of a department which ID is 40. 
*/
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
where e.salary> (select max(salary)from employees where DEPARTMENT_ID=40) order by e.salary desc;
/* 38. Write a query in SQL to display the department name and Id for all departments 
where they located, that Id is equal to the Id for the location where department number 30 
is located. */
#soln:-
select d.DEPARTMENT_NAME , d.department_id ,l.city ,l.LOCATION_ID from departments as d join locations as l on l.location_id = d.location_id
where d.DEPARTMENT_ID=30;
/* 39. Write a query in SQL to display the first and last name, salary, and department ID for 
all those employees who work in that department where the employee works who hold the 
ID 201. */
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
where e.EMPLOYEE_ID=201;
/* 40. Write a query in SQL to display the first and last name, salary, and department ID for 
those employees whose salary is equal to the salary of the employee who works in that 
department which ID is 40. */
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
where salary = (select salary from employees where DEPARTMENT_ID=40);
/* 41. Write a query in SQL to display the first and last name, and department code for all 
employees who work in the department Marketing. */
#soln:-
select e.first_name, e.last_name, d.department_id from employees as e ,departments as d where e.department_id = d.department_id  and d.department_name ='Marketing';
/* 42. Write a query in SQL to display the first and last name, salary, and department ID for 
those employees who earn more than the minimum salary of a department which ID is 40. 
*/
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
where salary > (select min(salary) from employees where DEPARTMENT_ID=40) order by e.salary;
/* 43. Write a query in SQL to display the full name, email, and hire date for all those 
employees who was hired after the employee whose ID is 165. */
#soln:-
select e.first_name, e.email, e.HIRE_DATE  from employees as e where e.HIRE_DATE>(select HIRE_DATE from employees where EMPLOYEE_ID=165);
/* 44. Write a query in SQL to display the first and last name, salary, and department ID for 
those employees who earn less than the minimum salary of a department which ID is 70. */
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
where salary < (select min(salary) from employees where DEPARTMENT_ID=70) order by e.salary;

/* 45. Write a query in SQL to display the first and last name, salary, and department ID for 
those employees who earn less than the average salary, and also work at the department 
where the employee Laura is working as a first name holder. */
#soln:-


/* 46. Write a query in SQL to display the first and last name, salary, and department ID for 
those employees whose department is located in the city London. */
#soln:-
select e.first_name, e.last_name, e.salary , d.department_id from employees as e join departments as d on e.department_id = d.department_id
join locations as l on l.location_id = d.location_id where l.city = 'london';
/* 47. Write a query in SQL to display the city of the employee whose ID 134 and works 
there. */
#soln:-
select * from employees;
select * from countries;
select * from  locations;
select * from departments;
select * from jobs;
select * from regions;
select * from job_history;

select l.city from locations as l join departments as d on d.location_id=l.location_id join employees as e on d.DEPARTMENT_ID = e.DEPARTMENT_ID where e.EMPLOYEE_ID=134;
/* 48. Write a query in SQL to display the the details of those departments which max salary 
is 7000 or above for those employees who already done one or more jobs. */
#soln:-
select * from departments ;
/* 49. Write a query in SQL to display the detail information of those departments which 
starting salary is at least 8000. */
#soln:-
select d.*,e.salary from departments as d , employees as e where e.salary>=8000;
/* 50. Write a query in SQL to display the full name (first and last name) of manager who is 
supervising 4 or more employees. */
#soln:-

/* 51. Write a query in SQL to display the details of the current job for those employees who 
worked as a Sales Representative in the past. */
#soln:-

/* 52. Write a query in SQL to display all the information about those employees who earn 
second lowest salary of all the employees. */
#soln:-
select * from employees where salary in (select min(SALARY) from employees where salary >(select min(salary) from employees));
/* 53. Write a query in SQL to display the details of departments managed by Susan. */
#soln:-

/* 54. Write a query in SQL to display the department ID, full name (first and last name), 
salary for those employees who is highest salary drawer in a department. */
#soln:-

/* 55. Write a query in SQL to display all the information of those employees who did not 
have any job in the past. */
#soln:-
select * from employees where EMPLOYEE_ID not in ( select EMPLOYEE_ID from job_history);