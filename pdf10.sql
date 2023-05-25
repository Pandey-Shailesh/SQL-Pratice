use employees;


SET GLOBAL log_bin_trust_function_creators = 1;
 
DELIMITER $$

CREATE FUNCTION CalculateTotalSalary(employeeId INT)
RETURNS DECIMAL(10, 2)  
 
BEGIN
    DECLARE totalSalary DECIMAL(10, 2);
    
    SELECT SUM(salary) INTO totalSalary
    FROM salaries
    WHERE emp_no = employeeId;
    
    RETURN totalSalary;
END $$

DELIMITER ;


SET @employeeId = 1001; -- Provide the desired employee ID

SET @totalSalary = dbo.CalculateTotalSalary(@employeeId);

-- Use the value of @totalSalary as needed

select @totalSalary;

















DELIMITER //

CREATE FUNCTION GetAverageSalaryMax()
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avgSalary DECIMAL(10, 2);
    
    SELECT max(salary) INTO avgSalary
    FROM salaries;
    
    RETURN avgSalary;
END //

DELIMITER ;

SELECT CalculateTotalSalary(10001); -- Call the function with an argument

SELECT GetAverageSalaryMax(); -- Call the function without arguments