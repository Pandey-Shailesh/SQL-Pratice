use DB_for_Join_OPerations;

# explict inner joint

SELECT Employees.FName, Departments.Name 
FROM Employees JOIN Departments 
ON Employees.DepartmentId = Departments.Id;

# implict inner joint

SELECT e.FName, d.Name 
FROM Employees e, Departments d 
WHERE e.DepartmentId = d.Id;

#=============================================================================================================
use employees;
show tables;
/*
1.
If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.

Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

(If you don’t currently have the ‘departments_dup’ table set up, create it. Let it contain two columns: dept_no and dept_name. Let the data type of dept_no be CHAR of 4, 
and the data type of dept_name be VARCHAR of 40. Both columns are allowed to have null values. Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)

Then, insert a record whose department name is “Public Relations”.

Delete the record(s) related to department number two.

Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.
2.
Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.
3.
Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  

Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.
4. Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
5.Return a list with the first 10 employees with all the departments they can be assigned to.

Hint: Don’t use LIMIT; use a WHERE clause.
*/
select * from dept_manager;
select * from employees;
-- 2
select dept_manager.emp_no,first_name, last_name,Dept_no, hire_date from employees inner join dept_manager on dept_manager.emp_no = employees.emp_no ;

-- 3
select dept_manager.emp_no,first_name, last_name,Dept_no from employees inner join dept_manager on dept_manager.emp_no = employees.emp_no where employees.last_name='Markovitch' ;

select employees.emp_no,first_name, last_name from employees left outer join dept_manager on dept_manager.emp_no = employees.emp_no where employees.last_name='Markovitch' ;
-- 4
select d.emp_no, dp.dept_no from dept_manager d  cross join dept_manager dp where dp.dept_no ='d009';
-- 5
SELECT e.*, d.* FROM employees e CROSS JOIN departments d WHERE e.emp_no < 10011 ORDER BY e.emp_no, d.dept_name;