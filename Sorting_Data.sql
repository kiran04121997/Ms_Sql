create database Practice;
use Practice;

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

-- A) Sort a result set by one column in ascending order
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

--C) Sort a result set by multiple columns
SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    city,
    first_name;

--D) Sort a result set by multiple columns and different orders
/*The following statement sorts the customers by the city in descending order 
and then sorts the sorted result set by the first name in ascending order. */
SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    city DESC,
    first_name ASC;

--E) Sort a result set by a column that is not in the select list
SELECT
    city,
    first_name,
    last_name
FROM
    customers
ORDER BY
    state;

--F) Sort a result set by an expression
SELECT
    first_name,
    last_name
FROM
    customers
ORDER BY
    LEN(first_name) DESC;

--G) Sort by ordinal positions of columns
--Ordinal position is A number that represents the position of the column in a set of columns.
SELECT
    first_name,
    last_name,
	city
FROM
    customers
ORDER BY
    1,
    2,
	3;


