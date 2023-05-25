use hr;
show tables;

/*
1• Write a query to find the addresses (location_id, street_address, city, 
state_province, country_name) of all the departments.
*/
#soln:-
select location_id, street_address, city, state_province, country_name from locations as l
left join countries as c on l.country_id = c.country_id  ;
/*
2• Write a query to find the name (first_name, last name), department ID and name 
of all the employees.
*/
#soln:-
select first_name ,last_name , d.department_id, department_name from departments as d right join employees on d.department_id = employees.department_id;
/*
3• Write a query to find the name (first_name, last_name), job, department ID and 
name of the employees who works in London.
*/
#soln:-
select e.first_name, e.last_name, e.job_id , d.department_id, d.department_name from employees as e join departments as d on e.department_id = d.department_id
join locations as l on l.location_id = d.location_id where l.city = 'london';
/*
4• Write a query to find the employee id, name (last_name) along with their 
manager_id and name (last_name).
*/
#soln:-
select employee_id ,last_name , d.manager_id , last_name from employees as e right join departments as d on e.manager_id = d.manager_id;
/*
5• Write a query to find the name (first_name, last_name) and hire date of the 
employees who was hired after 'Jones'.
*/
#soln:-
select first_name ,last_name , hire_date from employees  where  hire_date>(select hire_date from employees  where last_name = 'Jones') ;
/*
6• Write a query to get the department name and number of employees in the department.
*/
#soln:-
select d.department_name,count(e.department_id) as no_of_emp from departments as d join employees as e on d.department_id = e.department_id group by e.department_id ;
/*
•7 Write a query to find the employee ID, job title, number of days between ending 
date and starting date for all jobs in department 90.
*/
#soln:-
select e.employee_id,j.job_title , d.department_id, d.department_name from jobs as j ,employees as e join departments as d on e.department_id = d.department_id
join locations as l on l.location_id = d.location_id where l.city = 'london';
/*
8• Write a query to display the department ID and name and first name of manager.
*/
#soln:-
select d.department_id,d.department_name, e.first_name from departments as d join employees as e on d.manager_id = e.manager_id  ;
/*
9• Write a query to display the department name, manager name, and city.
*/
#soln:-
select e.first_name,d.department_name, l.city from departments as d join employees as e on d.manager_id = e.manager_id join locations as l on d.location_id=l.location_id  ;
/*
10• Write a query to display the job title and average salary of employees
*/
#soln:-
select j.job_title,avg(salary) from employees as e join jobs as j on j.job_id= e.job_id group by e.job_id ;
/*
11• Write a query to display job title, employee name, and the difference between 
salary of the employee and minimum salary for the job.
*/
#soln:-
select j.job_title,e.first_name,((e.salary)-min(e.salary)) as dfference_in_salary from employees as e join jobs as j on j.job_id= e.job_id group by e.job_id;
/*
12• Write a query to display the job history that were done by any employee who is 
currently drawing more than 10000 of salary.
*/
#soln:-
select * from employees;
select * from countries;
select * from  locations;
select * from departments;
select * from jobs;
select * from regions;
select * from job_history;

select jh.*, e.salary from job_history as jh join employees as e on jh.employee_id= e.employee_id where salary>10000;

/*
13• Write a query to display department name, name (first_name, last_name), hire 
date, salary of the manager for all managers whose experience is more than 15 
years.
*/
#soln:-
select department_name, first_name,last_name, hire_date,salary from employees as e join departments as d on d.manager_id =e.employee_id;