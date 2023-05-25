show databases;
use employees;
show tables;
select * from departments;

#select dept_name from departments;
 /*
Select the information from the “dept_no” column of the “departments” table.
*/
#sol:-
select dept_no from departments;
 /*
Select all data from the “departments” table.
*/
#sol:-
select * from departments;
select * from employees;
 /*
Select all people from the “employees” table whose first name is “Elvis”. 
*/
#sol:-
select * from employees where first_name = 'Elvis';

select * from employees where first_name = 'Denis' and last_name ='Luga';
 /*
Retrieve a list with all employees whose first name is either Kellie or Aruna.
*/
#sol:-
select * from employees where first_name = 'Kellie' or first_name ='Aruna';


 /*
Retrieve a list with all female employees whose first name is either Kellie or Aruna.
*/
#sol:-
select * from employees where gender = 'f' and ( first_name ='Kellie' or first_name ='Aruna');
 /*
Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
*/
#sol:-
select * from employees where first_name in ( 'Denis' ,'Elvis');
 /*
Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
*/
#sol:-
select * from employees where first_name not in ( 'John' ,'Mark','Jacob');

 /*
Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”;
specify that the name can be succeeded by any sequence of characters.
*/
#sol:-
select * from employees where first_name like ('Mark%');
 /*
Retrieve a list with all employees who have been hired in the year 2000.
*/
#sol:-
select * from employees where hire_date like ('%2000%');
 /*
Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.
*/
#sol:-
select * from employees where emp_no like('1000_');

 /*
Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
*/
#sol:-
 select * from  salaries where salary between '66000' and '70000';
  /*
Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
*/
#sol:-
 select * from salaries where emp_no not between '10004' and '10012'; 

  /*
Select the names of all departments with numbers between ‘d003’ and ‘d006’.
*/
#sol:-
 select dept_name from departments where dept_no between'd003' and 'd006';
 
 
 
 
 /*
1. Select the names of all departments whose department number value is not null.
*/
#sol:-
 
select dept_name from departments where dept_no is not null;
/*
2. Retrieve a list with data about all female employees who were hired in the year 2000 or after.

Hint: If you solve the task correctly, SQL should return 7 rows.
*/
#sol:-
select * from employees where gender ='f' and hire_date >= '2000-01-01';
/*
Extract a list with all employees’ salaries higher than $150,000 per annum.
*/
#sol:-
select * from salaries where salary>150000;
/*
 3.Obtain a list with all different “hire dates” from the “employees” table.

Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.

In the next lecture, we will show you how to manipulate the limit rows count.
*/
#sol:-
select distinct hire_date from employees;
/*
4. How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
*/
#sol:-
select * from salaries where salary >=100000;

/*
How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
*/
#sol:-
select count(*) from dept_manager;

/*
5. Select all data from the “employees” table, ordering it by “hire date” in descending order.
*/
#sol:-
select * from employees order by hire_date desc;

/*
6. This will be a slightly more sophisticated task.

Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars.
 The second column, renamed to “emps_with_same_salary”,
must show the number of employees contracted to that salary.
 Lastly, sort the output by the first column
*/
#sol:-
select salary, count(salary) as emps_with_same_salary from salaries where salary >80000 group by salary  order by emps_with_same_salary desc  ;

#============================================================================================================================================

/*
15.Select all employees whose average salary is higher than $120,000 per annum.
*/
#sol:-
SELECT * FROM salaries;
select emp_no,avg(salary) from salaries group by emp_no having avg(salary)>12000 ;




/*
Select ten records from the “titles” table to get a better idea about its content.

Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.

At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.
INSERT INTO employees

VALUES

(

    999903,

    '1977-09-14',

    'Johnathan',

    'Creek',

    'M',

    '1999-01-01'

);
*/
#soln:-
select * from titles limit 10;
insert into titles (emp_no,title, from_date) values('999903','Senior Engineer','1997-10-01');

INSERT INTO employees VALUES (999903,'1977-09-14','Johnathan','Creek','M','1999-01-01');
select * from employees order by emp_no limit 10;


/*
Insert information about the individual with employee number 999903 into the “dept_emp” table.
 He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.
*/
#soln:-
select * from dept_emp limit 10;
insert into dept_emp (emp_no,dept_no, from_date,to_date) values('999903','d005','1997-10-01','9999-01-01');
select * from dept_emp order by emp_no desc;                              



/*
Change the “Business Analysis” department name to “Data Analysis”.
*/
select * from departments;
update  dapartments set dept_name ='Data_Analysis' where dept_no='d001';



/*
Remove the department number 10 record from the “departments” table.
*/
#soln:-
#delete from departments where dept_name=d001;



/*
How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
*/
#soln:-
select * from dept_emp;
select count(distinct dept_no) from dept_emp ;

/*
What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
*/
#soln:-
select sum(salary) from salaries where from_date ='1997-01-01';

/*
1. Which is the lowest employee number in the database?
*/
#soln:-
select max(emp_no) from employees ;
/*
2. Which is the highest employee number in the database?
*/
#soln:-
select min(emp_no) from employees;


/*
What is the average annual salary paid to employees who started after the 1st of January 1997?
*/
#soln:-
select * from salaries;
select avg(salary) from salaries where from_date ='1997-01-01';

/*
Round function 
*/
select round(avg(salary),-3) from salaries;
select round(avg(salary),2) from salaries;
/*
Write an SQL query to show the second-highest salary from a table.
*/
#soln:-
select salary from salaries order by salary desc limit 2;

select * from salaries;

select max(salary) from salaries where salary < (select max(salary) from salaries);
