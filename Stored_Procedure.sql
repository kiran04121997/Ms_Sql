create database Stored_Procedure;
use Stored_Procedure;

 CREATE TABLE Customers (
    Customer_id int NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    phone bigint NOT NULL UNIQUE,
	email varchar(255) not null,
    city varchar(15) NOT NULL,
	state varchar(45) not null,
	list_price int,
	product_name varchar(255),
	zip_code bigint not null
);

drop table Customers;

INSERT INTO Customers (Customer_id, first_name, last_name, phone, email, city,state,list_price,product_name,zip_code) VALUES
(1, 'Ram', 'Kumar', 35451112, 'kb@123gmail.com', 'Agra', 'MH',4000,'Computers',413513),
(2, 'sham', 'lal', 3548112, 'sb@153gmail.com', 'delhi', 'KA',5000,'mobile',413514),
(3, 'Dipak', 'Mandale', 36651112, 'gh@173gmail.com', 'pune', 'MH',6000,'clothes',413512),
(4, 'Kiran', 'Bhosale', 35478112, 'kf@783gmail.com', 'mumbai', 'MH',7000,'shirts',413515),
(5, 'Vikram', 'Bhosale', 35451165, 'vb@123gmail.com', 'nashik', 'MH',8000,'cameras',412513),
(6, 'Ronit', 'Waje', 4548112, 'rw@153gmail.com', 'bengluru', 'KA',9000,'equipments',413514),
(7, 'vishnu', 'dole', 36652112, 'vd@173gmail.com', 'chapra', 'BI',1000,'luggage',413515),
(8, 'Maruti', 'karne', 35578112, 'mk@783gmail.com', 'chennai', 'KL',2000,'bicycle',413516),
(9, 'SUNIL', 'Chavan', 3648112, 'dc@153gmail.com', 'hubli', 'KA',3000,'car',423514),
(10, 'Mohan', 'vanale', 36671112, 'mv@173gmail.com', 'hyderabad', 'AP',4000,'motor',413517);

select * from Customers;

-- Creating a simple stored procedure
SELECT 
	product_name, 
	list_price
FROM 
	Customers
ORDER BY 
	product_name;

-- To create a stored procedure that wraps this query, you use the CREATE PROCEDURE statement as follows:

ALTER PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        Customers
    ORDER BY 
        product_name;
END;

EXEC uspProductList;

DROP PROCEDURE uspProductList;

-- Creating a stored procedure with one parameter

ALTER PROCEDURE uspProductList(@min_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        Customers
    WHERE
        list_price >= @min_list_price
    ORDER BY
        list_price;
END;

EXEC uspProductList 1000;


-- Creating a stored procedure with multiple parameters
ALTER PROCEDURE uspProductList(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        Customers
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price
    ORDER BY
        list_price;
END;

EXEC uspProductList 3000,9000;


-- STORED PROCEDURE USING IF ELSE STATEMENT 
CREATE PROCEDURE uspCalcVelocity
                 @distance float,
                 @time float,
                 @velocity float OUTPUT
AS

IF (@time = 0.00)
BEGIN
   -- we can't divide by zero, so assume time is 1 hour
   Select @time = 1;
   SELECT @velocity = @distance / @time;
END
ELSE
BEGIN
   SELECT @velocity = @distance / @time;   
END

Declare @v float
EXECUTE uspCalcVelocity 140.00, 2.00, @v OUTPUT
SELECT @v

-- SQL Server TRY CATCH examples
CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH 
END;
GO

DECLARE @r decimal;
EXEC usp_divide 20, 2, @r output;
PRINT @r;

    
	
	
	/* SQL Server RAISE ERROR examples */

BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO































































