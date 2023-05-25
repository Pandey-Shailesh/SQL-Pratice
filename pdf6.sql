use classicmodels;
show tables; 
-- -----------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE GetCustomers()
	BEGIN
		SELECT GetCustomers
			  customerName, 
			  city, 
			  state, 
			  postalCode, 
			  country
		FROM
			customers
	ORDER BY customerName;    
END$$
	DELIMITER ;
-- --------------------------------------------------------------
call GetCustomers();

-- --------------------------------------------------------------

DELIMITER //
 CREATE PROCEDURE Var_Example()
    BEGIN
		DECLARE productCount INT DEFAULT 0;

		  SELECT COUNT(*) 
		  INTO productCount 
		  FROM products;
	END //

DELIMITER ;

call Var_Example();

-- --------------------------------------------------------
-- In parameter stores procedures
DELIMITER //

CREATE PROCEDURE GetOfficeByCountry(
 IN countryName VARCHAR(255)
)
BEGIN
 SELECT * 
  FROM offices
 WHERE country = countryName;
END //

DELIMITER ;

call GetOfficeByCountry("USA");
call GetOfficeByCountry("france");
--  ---------------------------------------------------------------
--  out parameter stores procedures
DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus (
 IN  orderStatus VARCHAR(25),
 OUT total INT
)
BEGIN
 SELECT COUNT(orderNumber)
 INTO total
 FROM orders
 WHERE status = orderStatus;
END$$

DELIMITER ;

CALL GetOrderCountByStatus('in process',@total);
SELECT @total AS  total_in_process;
-- ---------------------------------------------------------
-- InOut parameter stores procedures
DELIMITER $$

CREATE PROCEDURE SetCounter(
 INOUT counter INT,
    IN inc INT
)
BEGIN
 SET counter = counter + inc;
END$$

DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
SELECT @counter; -- 8

CALL SetCounter(@counter,1); -- 3
SELECT @counter; -- 8

CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8

-- ------------------------------------------------------------------------------
-- If Statements

DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, -- input variable 140
    OUT pCustomerLevel  VARCHAR(20)) -- return variable
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0; -- locla/ dummy variable 
    
    SELECT creditLimit 
    into credit -- store into dummy variable for the later on use
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN -- checking the credit (dummy variable who hold the values from select query)
    
        SET pCustomerLevel = 'PLATINUM'; -- assigned the value to return variable 
    END IF;
END$$

DELIMITER ;

CALL GetCustomerLevel(141, @out_for_me);
select @out_for_me as Status;

CALL GetCustomerLevel(140, @out_for_me);
select @out_for_me as Status;

-- -----------------------------------------------------------
-- if else statements

DELIMITER $$
CREATE PROCEDURE GetCustomerLevel_if_else(
    IN  pCustomerNumber INT, -- input variable 140
    OUT pCustomerLevel  VARCHAR(20)) -- return variable
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0; -- locla/ dummy variable 
    
    SELECT creditLimit 
    into credit -- store into dummy variable for the later on use
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN -- checking the credit (dummy variable who hold the values from select query)    
        SET pCustomerLevel = 'PLATINUM'; -- assigned the value to return variable 
    else
  set pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$

DELIMITER ;

CALL GetCustomerLevel_if_else(141000, @out_for_me);
select @out_for_me as Status;

CALL GetCustomerLevel_if_else(141, @out_for_me);
select @out_for_me as Status;

-- ------------------------------------------------------------
-- if elseif ... else statements

#drop procedure GetCustomerLevel_if_elseif_else;
DELIMITER $$
CREATE PROCEDURE GetCustomerLevel_if_elseif_else(
    IN  pCustomerNumber INT, -- input variable 140
    OUT pCustomerLevel  VARCHAR(20)) -- return variable
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0; -- locla/ dummy variable 
    
    SELECT creditLimit 
    into credit -- store into dummy variable for the later on use
    FROM customers
    WHERE customerNumber = pCustomerNumber;
-- Silver, GOld, Platinum
    IF credit > 500000 THEN -- checking the credit (dummy variable who hold the values from select query)    
        SET pCustomerLevel = 'PLATINUM'; -- assigned the value to return variable 
    elseif credit >400000 and credit <50000 THEN
  set PCustomerLevel = 'Gold';
 elseif credit > 100000 and credit <400000 then 
  set PCustomerLevel = 'Silver';
 else 
  set PCustomerLevel = 'NO Level';
    END IF;
END$$

DELIMITER ;

CALL GetCustomerLevel_if_elseif_else(141, @out_for_me);

select @out_for_me as Status;
-- -----------------------------------------------------------
-- case statement

drop procedure getCustomerShipping;
DELIMITER $$
CREATE PROCEDURE getCustomerShipping(
    IN  pCustomerNumber INT, -- input variable 140
    OUT pShipping  VARCHAR(50)) -- return variable
BEGIN
    DECLARE customerCountry varchar(100); -- locla/ dummy variable 
    
    SELECT country 
    into customerCountry -- store into dummy variable for the later on use
    FROM customers
    WHERE customerNumber = pCustomerNumber;

	case customerCountry
    when 'USA' THEN -- checking the credit (dummy variable who hold the values from select query)    
        SET pShipping = '2-day shipping'; -- assigned the value to return variable 
   when 'canada' THEN
  set pShipping = '3-day shipping';
	else 
  set pShipping = '5-day shipping';
    END case;
END$$

DELIMITER ;

CALL getCustomerShipping("USA", @out_for_me);

select @out_for_me as Status;


-- -----------------------------------------------------------------------

use classicmodels;

DROP PROCEDURE if exists LoopDemo;

DELIMITER $$
CREATE PROCEDURE LoopDemo()
BEGIN
 DECLARE x  INT;
 DECLARE str  VARCHAR(255); 
 SET x = 1;
 SET str = ""; 
    
 loop_label:  LOOP
  IF  x > 10 THEN 
   LEAVE  loop_label;
  END  IF;
            
  SET  x = x + 1;
  IF  (x mod 2) THEN
   ITERATE  loop_label;
  ELSE
   SET  str = CONCAT(str,x,",");
  END  IF;
 END LOOP;
 SELECT str;
END$$
DELIMITER ;

call LoopDemo();

-- -------------------------------------------------------------
-- Creating the table

CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);


DELIMITER $$
CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt, 
        EXTRACT(DAY FROM dt),
        EXTRACT(MONTH FROM dt),
        EXTRACT(QUARTER FROM dt),
        EXTRACT(YEAR FROM dt)
    );
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE LoadCalendars(
    startDate DATE, 
    day INT
)
BEGIN
    
    DECLARE counter INT DEFAULT 1;
    
    DECLARE dt DATE DEFAULT startDate;
    
WHILE counter <= day DO
        CALL InsertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt,INTERVAL 1 day);
    END WHILE;

END$$
DELIMITER ;

CALL LoadCalendars('2019-06-01',31);

select * from calendars;

-- ---------------------------------------------------------------------------
drop procedure if exists RepeatDemo;
DELIMITER $$
CREATE PROCEDURE RepeatDemo()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(1000) DEFAULT '';   
    
    REPEAT
    
        SET result = CONCAT(result,counter,','); -- 1,2,3,4,5,6 
        SET counter = counter + 1;
    
    UNTIL counter >= 1000
    END REPEAT;
    -- display result
    SELECT result;
END$$
DELIMITER ;
-- -------------------------------------------------------------------------------------

-- Exception Handling

CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);

DELIMITER $$
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
  SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
-- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
-- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS InsertSupplierProduct;
DELIMITER $$
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
 SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
-- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
-- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
END$$
DELIMITER ;


CALL InsertSupplierProduct(1,1); 
CALL InsertSupplierProduct(1,2); 
CALL InsertSupplierProduct(1,3);


DROP PROCEDURE IF EXISTS InsertSupplierProduct;
DELIMITER $$
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062 SELECT 'Duplicate keys error encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 'SQLSTATE 23000' ErrorCode;
-- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
-- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
END$$
DELIMITER ;


CALL InsertSupplierProduct(1,3);

-- ------------------------------------------------------------------------------------------
-- MySql Cursor
use classicmodels;

show tables;

DELIMITER $$
CREATE PROCEDURE createEmailList (
 INOUT emailList varchar(4000)
)
BEGIN
 DECLARE finished INTEGER DEFAULT 0;
 DECLARE emailAddress varchar(100) DEFAULT "";

 -- declare cursor for employee email
 DEClARE curEmail 
  CURSOR FOR 
   SELECT email FROM employees;

 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
 OPEN curEmail;
 getEmail: LOOP
  FETCH curEmail INTO emailAddress;
  IF finished = 1 THEN 
   LEAVE getEmail;
  END IF;
  -- build email list
  SET emailList = CONCAT(emailAddress,";",emailList);
 END LOOP getEmail;
 CLOSE curEmail;
END$$
DELIMITER ;

SET @emailList = ""; 
CALL createEmailList(@emailList); 
SELECT @emailList;

-- ----------------------------------------------------------------------------------------
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();

CREATE TRIGGER after_employee_update 
    after UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();



show triggers;

drop trigger classicmodels.afte_employee_update;


UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;

SELECT * FROM employees_audit;




show databases;








-- ===============================================================================================
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

-- -----------------
/*
Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

Finally, select the obtained output.
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
DECLARE v_emp_no INT DEFAULT 0;

 SELECT emp_no 
 into v_emp_no
  FROM employees
  where 
	 fname = first_name and
	 lname = last_name;
END //

DELIMITER ;

call emp_info("Aruna","Journel",@hello);
select @hello as employe_number;
/*
Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee,
 and returns the salary from the newest contract of that employee.

Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date 
that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

Finally, select this function.
*/
#soln:-
select * from salaries;
drop PROCEDURE emp_info;
DELIMITER //

CREATE PROCEDURE emp_info(
 IN fname VARCHAR(255),
 IN lname varchar(255),
 out emp_salary int
)
BEGIN
DECLARE v_salary DECIMAL (10,2) DEFAULT 0 ;
DECLARE v_max_from_date date;

 SELECT s.salary 
 into v_salary
  FROM employees as e , salaries as s
  where 
	 fname = e.first_name and
	 lname = e.last_name  and
     s.from_date>(select max(from_date) from salaries);
END //

DELIMITER ;

call emp_info("Aruna","Journel",@hello);
select @hello as employe_number;

/*
4. Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
*/


/*
5. Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, 
and last name of all employees with a number higher than 109990. Create a fourth column in the query, 
indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee.
6. Extract a dataset containing the following information about the managers: employee number, first name, and last name.
 Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
 and another one saying whether this salary raise was higher than $30,000 or NOT.

If possible, provide more than one solution.*/

/*
7. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
 called “current_employee” saying “Is still employed” if the employee is still working in the company, 
 or “Not an employee anymore” if they aren’t.

Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.
*/
#soln:-
DELIMITER //

CREATE PROCEDURE emp_info(
 out emp_salary int
)
BEGIN
DECLARE current_employee DECIMAL (10,2) DEFAULT 0 ;

	select employee_number, first_name,last_name 
	from employees 
	order by employee_number limit 100 ;
END //

DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------


