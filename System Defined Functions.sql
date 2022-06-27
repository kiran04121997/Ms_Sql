create database Function_Data;
use Function_Data;

CREATE TABLE Customers (
    CustomerID int,
    CustomerName varchar(255),
    ContactName varchar(255),
    Address_ varchar(255),
    City varchar(255)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address_, City) VALUES
 (1, 'Cardinal', 'tom', 'skagen21', 'Stavanger'),
 (2, 'kiran', 'sham', 'kc', 'wi'), 
 (3, 'sam', 'joe', 'uk', 'Berlin'),
 (4, 'vikram', 'ram', 'delhi', 'ind'),
 (5, 'vishnu', 'sk', 'mumbai', 'mh');

ALTER TABLE Customers
ADD Price int;

SELECT * FROM Customers;

UPDATE Customers
SET Price = 120
WHERE CustomerID = 2;


    --- String Functions ---
-- 1.Return the ASCII code value of a character
SELECT 
    ASCII('AB') A, 
    ASCII('Z') Z;
-- Convert an ASCII value to a character
SELECT 
    CHAR(65) char_65, 
    CHAR(90) char_90;
--- Search for a substring inside a string starting from a specified location and return the position of the substring.
 SELECT 
    CHARINDEX('SQL', 'SQL Server CHARINDEX') position;
--CONCAT:- Join two or more strings into one string
SELECT 
    'John' + ' ' + 'Doe' AS full_name;
---DIFFERENCE:- Compare the SOUNDEX() values of two strings
SELECT 
    SOUNDEX('Too') Too, 
    SOUNDEX('Two') Two;
--- Extract a given a number of characters from a character string starting from the left
SELECT LEFT('SQL Server',3) Result_string;

-- Return a number of characters of a character string
SELECT
    LEN('SQL Server LEN') length,
    LEN('SQL Server LEN   ') length_with_trailing_blanks;
-- Convert a string to lowercase
SELECT 
    LOWER('TEST') result;
-- Return a new string from a specified string after removing all leading blanks
SELECT 
    LTRIM('   SQL Server LTRIM Function') result;
-- Replace all occurrences of a substring, within a string, with another substring
SELECT 
    REPLACE(
        'It is a good tea at the famous tea store.', 
        'tea', 
        'coffee'
    ) result;

-- Returns the starting position of the first occurrence of a pattern in a string.
SELECT 
    PATINDEX('%ern%', 'SQL Pattern Index') position;

-- Return the reverse order of a character string
SELECT 
    REVERSE('ecnalubma') result;

-- Extract a given a number of characters from a character string starting from the right
SELECT RIGHT('SQL Server',6) Result_string;

-- Return a new string from a specified string after removing all trailing blanks
SELECT 
    RTRIM('SQL Server RTRIM Function   ') result;

--Returns a string of repeated spaces.

SELECT 
    'John' + SPACE(1) + 'Doe' full_name;

-- Returns character data converted from numeric data.
SELECT 
    STR(123.456, 6, 2) result

-- A table-valued function that splits a string into rows of substrings based on a specified separator.
SELECT 
    value  
FROM 
    STRING_SPLIT('red,green,,blue', ',');
/** The third row is empty because the input string contains two consecutive commas (,,). To get non-empty substrings,
you add a WHERE clause to the SELECT statement as shown in the following query: **/
 SELECT 
    value  
FROM 
    STRING_SPLIT('red,green,,blue', ',')
WHERE
    TRIM(value) <> '';
--Extract a substring within a string starting from a specified location with a specified length
SELECT 
    SUBSTRING('SQL Server SUBSTRING', 5, 6) result;
	
-- TRANSLATE() function to replace square braces with parentheses:
    SELECT 
    TRANSLATE('[408] 555 6789','[]','()') result;

--Return a new string from a specified string after removing all leading and trailing blanks
SELECT 
    TRIM('  Test string    ');

-- Convert a string to uppercase
SELECT 
    UPPER('sql') result;

   ----- Numeric Functions -----
--- 1.Return the absolute value of a number:----
SELECT ABS(-243.5);

--- 2.Return the arc cosine of a number:----
SELECT ACOS(0.25);

--- 3.Return the arc sine of a number:----
SELECT ASIN(0.25);

--- 4.Return the arc tangent of a number:----
SELECT ATAN(2.5);

--- 5.Return the average value for the "Price" column in the "Products" table:----
SELECT AVG(Price) AS Price FROM Customers;

--- 6.Return the cosine of a number:----
SELECT COS(2);

--- 7.Return the cotangent of a number:----
SELECT COT(6);

--- 8.Return the number of products in the "Products" table:----
SELECT COUNT(CustomerID) AS Price FROM Customers;

--- 9.Convert a radian value into degrees:----
SELECT DEGREES(1.5);

--- 10.Return e raised to the power of 1:----
SELECT EXP(10);

--- 11.Return the largest integer value that is equal to or less than 25.75:----
SELECT FLOOR(25.75) AS FloorValue;

--- 12.Return the natural logarithm of 2:----
SELECT LOG(2);

--- 13.Return the base-10 logarithm of 2:----
SELECT LOG10(2);

--- 14.Find the price of the most Price in the "Customers" table:----
SELECT MAX(Price) AS LargestPrice FROM Customers;

--- 15.Find the price of the cheapest product in the "Products" table:----
SELECT MIN(Price) AS SmallestPrice FROM Customers;

--- 16.Return the value of PI:----
SELECT PI();

--- 17.Return 4 raised to the three power:----
SELECT POWER(4, 3);

--- 19.Convert a degree value into radians:----
SELECT RADIANS(180);

--- 20.Return a random decimal number:----
SELECT RAND();

--- 21.Round the number to 2 decimal places:----
SELECT ROUND(235.415, 2) AS RoundValue;

--- 22.Return the sign of a number:----
SELECT SIGN(255.5);

--- 23.Return the sine of a number:----
SELECT SIN(2);

--- 24.Return the square root of a number:----
SELECT SQRT(64);

--- 25.Return the tangent of a number:----
SELECT TAN(1.75);

  --- DATE FUNCTIONS:-
        -- Returning the current date and time
--1.Returns the current system date and time without the time zone part.
SELECT 
    CURRENT_TIMESTAMP AS current_date_time;

--2. Returns the current system date and time of the operating system on which the SQL Server is running.
SELECT 
    GETDATE() current_date_time;

--3. Returns the current system date and time with more fractional seconds precision than the GETDATE() function.
SELECT 
    CONVERT(DATE, SYSDATETIME());

--4. Returns the current system date and time in UTC (Coordinated Universal Time)
SELECT 
   SYSUTCDATETIME() utc_time;

--5. Returns the current system date and time with the time zone.
SELECT 
    SYSDATETIMEOFFSET() [datetimeoffset with timezone];

-- Returning the date and time Parts
--6. Returns a date part of a date as a character string
SELECT
    DATEPART(year, '2018-05-10') [datepart], 
    DATENAME(year, '2018-05-10') [datename];

--7. Returns the day of a specified date as an integer

SELECT 
	DAY('2030-12-01') [DAY];
--8. Returns the month of a specified date as an integer
SELECT 
	MONTH('2020-12-01') [month];

--9.Returns the year of the date as an integer.
SELECT 
	YEAR('2019-02-01') [year];

	/* Modifying dates */
-- 10.Adds a value to a date part of a date and return the new date value.
SELECT 
    DATEADD(second, 1, '2018-12-31 23:59:59') result;
-- 11.Returns the last day of the month containing the specified date, with an optional offset.
SELECT 
    EOMONTH('2019-02-15') end_of_month_feb2019;
-- 12.Changes the time zone offset of a DATETIMEOFFSET value and preserves the UTC value.
CREATE TABLE dbo.switchoffset_demo(
    dtz DATETIMEOFFSET
); 
INSERT INTO dbo.switchoffset_demo
VALUES('2019-03-06 9:20:00 +07:00'); 
SELECT 
    dtz
FROM 
    dbo.switchoffset_demo;
  -- use the SWITCHOFFSET() function to switch the time zone to -08:00:
SELECT 
    SWITCHOFFSET(dtz, '-08:00') result
FROM 
    dbo.switchoffset_demo; 

-- 13.Transforms a DATETIME2 value into a DATETIMEOFFSET value.
SELECT
    TODATETIMEOFFSET (
        '2019-03-06 07:43:58',
        '-08:00'
    ) result;

-- 	Constructing date and time from their parts
--14. Return a DATE value from the year, month, and day.
SELECT 
    DATEFROMPARTS(2020,12,31) a_date;
--15.Returns a DATETIME2 value from the date and time arguments
SELECT 
    DATETIME2FROMPARTS ( 2020, 12, 31, 11, 59, 59, 0, 0 ) result;  
--16.Returns a DATETIMEOFFSET value from the date and time arguments
SELECT 
    DATETIMEOFFSETFROMPARTS(2020, 11, 12, 20, 35, 30, 5000, 10, 30, 4) Result;
--18.Returns a TIME value from the time parts with the precisions
SELECT 
    TIMEFROMPARTS(23, 59, 59, 0, 0) AS Time;

--      Validating date and time values
--19.Check if a value is a valid date, time, or datetime value
/* The ISDATE() function accepts an argument and returns 1 
if that argument is a valid DATE, TIME, or DATETIME value; otherwise, it returns 0. */
SELECT 
    ISDATE('2020-06-15') is_date





















































































