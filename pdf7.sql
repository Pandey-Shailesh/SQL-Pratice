use employees;
/*
Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual,
 and returns their employee number.

*/
#soln-
drop PROCEDURE emp_info;
DELIMITER //

CREATE PROCEDURE emp_info(
 IN fname VARCHAR(255),
 IN lname varchar(255),
 out employee_number int
)
BEGIN
 SELECT  emp_no 
 into employee_number
  FROM employees 
  where
	 fname = first_name  and 
	 lname =last_name ;
END //

DELIMITER ;

call emp_info("Aruna","Journel",@hello);            
select @hello as employe_number;


select * from employees where first_name = 'Aruna' and last_name ='Journel';

/*
Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

Finally, select the obtained output.
*/
#soln-

set @v_emp_no =0;
call emp_info("Aruna","Journel",@v_emp_no);
select @v_emp_no as employe_number;
/*
Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee,
 and returns the salary from the newest contract of that employee.

Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date 
that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

Finally, select this function.
*/
#soln:-


/*
4. Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
*/
create index salary_index on salaries(salary);
select * from salaries where salary =89000;

/*
5. Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, 
and last name of all employees with a number higher than 109990. Create a fourth column in the query, 
indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee.*/
#soln:-
select e.emp_no, e.first_name,e.last_name ,
case when d.emp_no is not null then 'manager'
else 'employee'
end as is_manager from employees as e
left join dept_manager as d on e.emp_no = d.emp_no where e.emp_no >109990;



/*6. Extract a dataset containing the following information about the managers: employee number, first name, and last name.
 Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
 and another one saying whether this salary raise was higher than $30,000 or NOT.
If possible, provide more than one solution.
*/
#soln:- 
select e.emp_no, e.first_name, e.last_name , max(s.salary)- min(s.salary) as diff_in_salary,
case when  max(s.salary) - min(s.salary) >30000 
then 'increased'
else 'not_increased'
end as rise_in_salary
from dept_manager d join
employees e
on e.emp_no = d.emp_no
join salaries s 
on s.emp_no = d.emp_no
group by s.emp_no;




/*
7. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
 called “current_employee” saying “Is still employed” if the employee is still working in the company, 
 or “Not an employee anymore” if they aren’t.

Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.
*/
#soln:-

	select e.emp_no, e.first_name,e.last_name,
    case when max(d.to_date)>current_date()
    then 'is_still_employed'
    else
    'Not_an_employee_anymore'
    end as current_employee from 
    dept_emp as d join employees as e
    on d.emp_no = e.emp_no
    group by d.emp_no 
    limit 100 ;
