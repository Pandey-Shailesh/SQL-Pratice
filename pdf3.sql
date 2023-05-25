show databases;
use org;
show tables;

/*
1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
*/
#sol:-
select * from worker;
select first_name as worker_name from worker;
/*
2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
*/
#sol:-
#select first_name from worker;
/*
3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
*/
#sol:-
select distinct DEPARTMENT from worker;
/*
4. Write an SQL query to print the first three characters of FIRST_NAME from the Worker table.
*/
#sol:-
select first_name from worker where first_name like ('___');
/*
5. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
*/
#sol:-
select count(distinct department) from worker;
/*
6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
*/
#sol:-
select * from worker order by first_name asc;

/*
7. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
*/
#sol:-
select * from worker order by first_name asc ;
select * from worker order by DEPARTMENT desc ;
/*
8. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
*/
#sol:-
select * from worker where first_name = 'Vipul' or first_name = 'Satish' ;

/*
9. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
*/
#sol:-
select * from worker where first_name != 'Vipul'and first_name != 'Satish' ;

/*
10. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
*/
#sol:-
select * from worker where DEPARTMENT= 'Admin';
/*
11. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’
*/
#sol:-
select * from worker where FIRST_NAME like  '%a%';
/*
12. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
*/
#sol:-
select * from worker where FIRST_NAME like  '%a';

/*
13. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
*/
#sol:-
select * from worker where FIRST_NAME like  '%h' and FIRST_NAME like  '______' ;

/*
14. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
*/
#sol:-
select * from worker where salary>100000 and salary<500000  ;

/*
15. Write an SQL query to print details of the Workers who joined in Feb’2014
*/
#sol:-
select * from worker where joining_date like "2014-02%"  ;

/*
16. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
*/
#sol:-
select count(*) from worker where DEPARTMENT= 'Admin';
/*
17. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000
*/
#sol:-
select FIRST_NAME as Worker_Name, Salary from worker where WORKER_ID in (select WORKER_ID from worker where Salary >= 50000 and Salary <= 100000);
/*
18. Write an SQL query to fetch the no. of workers for each department in descending order.
*/
#sol:-
select department , count(worker_id) as no_of_workers from worker group by department order by no_of_workers desc;

/*
19. Write an SQL query to print details of the Workers who are also Managers.
*/
#sol:-

/*
21. Write an SQL query to show the top n (say 10) records of a table.
*/
#sol:-
select * from worker order by first_name asc limit 10;
/*
22. Write an SQL query to determine the nth (say n=5) highest salary from a table
*/
#sol:-
select * from worker order by salary desc limit 5;
/*
23. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
*/
#sol:-
select * from worker order by salary desc limit 5,1;
/*
24. Write an SQL query to fetch the list of employees with the same salary.
*/
#sol:-
/*
25. Write an SQL query to show the second-highest salary from a table.
*/
#sol:-
select * from worker order by salary desc limit 2,1;
/*
26. Write an SQL query to fetch the first 50% of records from a table.
*/
#sol:-
#select top 50 percent * from  worker ;