use employees;
select * from employees;
/*
1.Find the average salary of the male and female employees in each department.
*/
#soln-
select d.dept_name, e.gender, avg(salary)
from salaries s
join employees e on s.emp_no = e.emp_no
join dept_emp dm on e.emp_no = dm.emp_no
join departments d on d.dept_no = dm.dept_no
group by dm.dept_no, e.gender
order by dm.dept_no;
/*
2.Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest 
department number.
*/
#soln-
select min(dept_no) from dept_emp;

select max(dept_no) from dept_emp;

/*
3.Obtain a table containing the following three fields for all individuals whose employee number is not 
greater than 10040: 
- employee number 
- the lowest department number among the departments where the employee has worked in (Hint: use 
a subquery to retrieve this value from the 'dept_emp' table) 
- assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020, 
and '110039' to those whose number is between 10021 and 10040 inclusive. 
Use a CASE statement to create the third field. 
If you've worked correctly, you should obtain an output containing 40 rows. 
Here’s the top part of the output. Does it remind you of an output you’ve obtained earlier in the course?
*/
#soln-
select emp_no,
(
select min(dept_no)
from dept_emp de
where e.emp_no = de.emp_no
) dept_no,

case
when emp_no <= 10020 then '110022'
else '110039'

end as manager
from employees e
where emp_no <= 10040;



/*
4.Retrieve a list of all employees that have been hired in 2000.
*/
#soln-
select *
from employees 
where year(hire_date)  like '2000%';



/*
5.Retrieve a list of all employees from the ‘titles’ table who are engineers. 
Repeat the exercise, this time retrieving a list of all employees from the ‘titles’ table who are senior 
engineers. 
After LIKE, you could indicate what you are looking for with or without using parentheses. Both options are 
correct and will deliver the same output. We think using parentheses is better for legibility and that’s why 
it is the first option we’ve suggested.
*/
#soln-
select *
from titles
where title like ('%engineer%');

/*
6.Create a procedure that asks you to insert an employee number and that will obtain an output containing 
the same number, as well as the number and name of the last department the employee has worked in. 
Finally, call the procedure for employee number 10010. 
If you've worked correctly, you should see that employee number 10010 has worked for department 
number 6 - "Quality Management".
*/
#soln-
select * from employees;
DELIMITER //
CREATE PROCEDURE last_dept (
IN p_emp_no int)

BEGIN

SELECT e.emp_no, d.dept_no, d.dept_name
FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
		WHERE e.emp_no = p_emp_no
		AND de.from_date = (SELECT MAX(from_date)
				FROM dept_emp
WHERE emp_no = p_emp_no) ;

END //
 DELIMITER ;

call last_dept(10010);

/*
7.How many contracts have been registered in the ‘salaries’ table with duration of more than one year and 
of value higher than or equal to $100,000? 
Hint: You may wish to compare the difference between the start and end date of the salaries contracts.
*/
#soln-
select count(*)
from salaries
where salary >= 100000
and DATEDIFF(to_date, from_date) > 365;


/*
8.Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set the 
hire date to equal the current date. Format the output appropriately (YY-mm-dd). 
Extra challenge: You can try to declare a new variable called 'today' which stores today's data, and then 
use it in your trigger! 
After creating the trigger, execute the following code to see if it's working properly.
*/
#soln-




/*
9.Define a function that retrieves the largest contract salary value of an employee. Apply it to employee 
number 11356. 
In addition, what is the lowest contract salary value of the same employee? You may want to create a new 
function that to obtain the result.
*/
#soln-
 select e.* from employees as e , salaries as s where
s.salary in (
select min(s.salary)
from s.salary group by e.emp_no);


/*
10.Based on the previous exercise, you can now try to create a third function that also accepts a second 
parameter. Let this parameter be a character sequence. Evaluate if its value is 'min' or 'max' and based on 
that retrieve either the lowest or the highest salary, respectively (using the same logic and code structure 
from Exercise 9). If the inserted value is any string value different from ‘min’ or ‘max’, let the function 
return the difference between the highest and the lowest salary of that employee.
*/
#soln-


