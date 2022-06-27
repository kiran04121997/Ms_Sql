create database Quering_Data;
use Quering_Data;

 CREATE TABLE Customers (
    Customer_id int NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    phone bigint NOT NULL UNIQUE,
	email varchar(255) not null,
    city varchar(15) NOT NULL,
	state varchar(45) not null,
	zip_code bigint not null
);

drop table Customers;

INSERT INTO Customers (Customer_id, first_name, last_name, phone, email, city,state,zip_code) VALUES
(1, 'Ram', 'Kumar', 35451112, 'kb@123gmail.com', 'Agra', 'MH',413513),
(2, 'sham', 'lal', 3548112, 'sb@153gmail.com', 'delhi', 'KA',413514),
(3, 'Dipak', 'Mandale', 36651112, 'gh@173gmail.com', 'pune', 'MH',413512),
(4, 'Kiran', 'Bhosale', 35478112, 'kf@783gmail.com', 'mumbai', 'MH',413515),
(5, 'Vikram', 'Bhosale', 35451165, 'vb@123gmail.com', 'nashik', 'MH',412513),
(6, 'Ronit', 'Waje', 4548112, 'rw@153gmail.com', 'bengluru', 'KA',413514),
(7, 'vishnu', 'dole', 36652112, 'vd@173gmail.com', 'chapra', 'BI',413515),
(8, 'Maruti', 'karne', 35578112, 'mk@783gmail.com', 'chennai', 'KL',413516),
(9, 'SUNIL', 'Chavan', 3648112, 'dc@153gmail.com', 'hubli', 'KA',423514),
(10, 'Mohan', 'vanale', 36671112, 'mv@173gmail.com', 'hyderabad', 'AP',413517);


select * from Customers;

--Section 1. Querying data
---- A. The following query finds the first name and last name of all customers:
SELECT
    first_name,
    last_name,
    email
FROM
    customers;

---- B) SQL Server SELECT – retrieve all columns from a table example:
SELECT
    *
FROM
    customers;

---- C) SQL Server SELECT – sort the result set:

 SELECT
    *
FROM
    customers
WHERE
    state = 'MH';

SELECT
    *
FROM
    customers
WHERE
    state = 'MH'
ORDER BY
    first_name;


---- D) SQL Server SELECT – group rows into groups example

SELECT
    city,
    COUNT (*)
FROM
    customers
WHERE
    state = 'MH'
GROUP BY
    city
ORDER BY
    city;

----E) SQL Server SELECT – filter groups example
SELECT
    city,
    COUNT (*)
FROM
   customers
WHERE
    state = 'MH'
GROUP BY
    city
HAVING
    COUNT (*) < 2
ORDER BY
    city;


--- Section 2. Sorting data :-
-- A) Sort a result set by one column in ascending order:-

SELECT
    first_name,
    last_name
FROM
    customers
ORDER BY
    first_name;

-- B) Sort a result set by one column in descending order

SELECT
	first_name,
	last_name
FROM
	customers
ORDER BY
	first_name DESC;

-- C) Sort a result set by multiple columns
SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    city,
    first_name;

-- D) Sort a result set by multiple columns and different orders
SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    city DESC,
    first_name ASC;


-- D) Sort a result set by multiple columns and different orders

SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    city DESC,
    first_name ASC;

-- E) Sort a result set by a column that is not in the select list

SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    state;

-- F) Sort a result set by an expression

SELECT
    first_name,
    last_name
FROM
    customers
ORDER BY
    LEN(first_name) DESC;

-- G) Sort by ordinal positions of columns
SELECT
    first_name,
    last_name
FROM
   customers
ORDER BY
    1,
    2;

-- Section 3. Limiting rows

-- a.The following query returns all data from the customers table and sorts the customers by their list first_name and zip_code:
SELECT
    first_name,
    zip_code
FROM
    customers
ORDER BY
    zip_code,
   first_name 

 -- b.To skip the first 5 names and return the rest, you use the OFFSET clause as shown in the following statement:

SELECT
    first_name,
    zip_code
FROM
    customers
ORDER BY
    zip_code,
   first_name 
OFFSET 5 ROWS;

select * from customers;

-- c.To skip the first 5 products and select the next 10 names, you use both OFFSET and FETCH clauses as follows:

SELECT
    first_name,
    last_name
FROM
    customers
ORDER BY
    last_name,
   first_name
OFFSET 6 ROWS 
FETCH NEXT 5 ROWS ONLY;

-- d. To get the top 10 most names you use both OFFSET and FETCH clauses:

SELECT
    first_name,
    last_name
FROM
    customers
ORDER BY
    last_name DESC,
   first_name
OFFSET 0 ROWS 
FETCH NEXT 5 ROWS ONLY;

--1) Using TOP with a constant value
SELECT TOP 6
    first_name, 
    zip_code
FROM
    customers
ORDER BY 
    zip_code DESC;

	
select * from customers;


-- 2) Using TOP to return a percentage of rows

SELECT TOP 1 PERCENT
    first_name, 
    zip_code
FROM
    customers
ORDER BY 
    zip_code DESC;

-- 3) Using TOP WITH TIES to include rows that match the values in the last row

SELECT TOP 3 WITH TIES
    first_name, 
    zip_code
FROM
    customers
ORDER BY 
    zip_code DESC;

-- Section 4. Filtering data

-- A) DISTINCT one column example
SELECT
    city
FROM
    customers
ORDER BY
    city;

-- B) DISTINCT multiple columns example

SELECT
    city,
    state
FROM
   customers
ORDER BY 
    city, 
    state;

-- C) DISTINCT with all values example

SELECT DISTINCT
    phone
FROM
    customers
ORDER BY
    phone;

-- D) DISTINCT vs. GROUP BY

SELECT 
	city, 
	state, 
	zip_code
FROM 
   customers
GROUP BY 
	city, state, zip_code
ORDER BY
	city, state, zip_code


--	SQL Server WHERE
-- A) Finding rows by using a simple equality
SELECT
    first_name,
    last_name,
    phone,
    email,
    zip_code
FROM
    customers
WHERE
    customer_id = 2
ORDER BY
    zip_code DESC;

select * from customers;

-- B) Finding rows that meet two conditions
SELECT
    first_name,
    last_name,
    phone,
    email,
	state,
    zip_code
FROM
    customers
WHERE
    customer_id = 2 AND state = 'KA'
ORDER BY
    zip_code DESC;

-- C) Finding rows by using a comparison operator

ALTER TABLE customers
ADD Price int; 

UPDATE customers
SET Price = 2254
WHERE customer_id = 6;

select * from customers;

SELECT
    first_name,
    last_name,
    phone,
    email,
	state,
	Price,
    zip_code
FROM
    customers
WHERE
    Price > 3000 AND state = 'MH'
ORDER BY
    zip_code DESC;

-- D) Finding rows that meet any of two conditions
SELECT
    first_name,
    last_name,
    phone,
    email,
	state,
	Price,
    zip_code
FROM
    customers
WHERE
    Price > 3000 OR state = 'MH'
ORDER BY
    zip_code DESC;

-- E) Finding rows with the value between two values
SELECT
    first_name,
    last_name,
    phone,
    email,
	state,
	Price,
    zip_code
FROM
    customers
WHERE
    Price BETWEEN 4000 AND 7000
ORDER BY
    zip_code DESC;

-- F) Finding rows that have a value in a list of values

SELECT
    first_name,
    last_name,
    phone,
    email,
	state,
	Price,
    zip_code
FROM
    customers
WHERE
    Price IN (7864, 1000, 4512)
ORDER BY
    zip_code DESC;

select * from customers;

-- G) Finding rows whose values contain a LIKE
SELECT
    first_name,
    last_name,
    phone,
    email,
	state,
	Price,
    zip_code
FROM
    customers
WHERE
    first_name LIKE '%Kiran%'
ORDER BY
    zip_code DESC;

select * from customers;

-- The following example finds the customers whose last name starts with the letter z:
SELECT
    customer_id,
    first_name,
    last_name
FROM
    customers
WHERE
    last_name LIKE 'k%'
ORDER BY
    first_name;

-- The following example returns the customers whose last name ends with the string "an":
SELECT
    customer_id,
    first_name,
    last_name
FROM
    customers
WHERE
    last_name LIKE '%an'
ORDER BY
    first_name;

-- The following statement retrieves the customers whose last name starts with the letter c and ends with the letter n:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    customers
WHERE
    last_name LIKE 'c%n'
ORDER BY
    first_name;

-- The _ (underscore) wildcard example
SELECT
    customer_id,
    first_name,
    last_name
FROM
    customers
WHERE
    last_name LIKE '_u%'
ORDER BY
    first_name; 

select * from customers;

-- The NOT LIKE operator example
SELECT
    customer_id,
    first_name,
    last_name
FROM
   customers
WHERE
    first_name NOT LIKE 'R%'
ORDER BY
    first_name;

--SQL Server column alias:-
SELECT
    first_name + ' ' + last_name AS full_name
FROM
    customers
ORDER BY
    first_name;

























































