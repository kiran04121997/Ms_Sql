create database Set_Operators;
use Set_Operators;
/** Section 8. Set Operators **/
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


CREATE TABLE Person (
    Person_id int NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    phone bigint NOT NULL UNIQUE,
    city varchar(15) NOT NULL,
	zip_code bigint not null
);
INSERT INTO Person (Person_id, first_name, last_name, phone, city,zip_code) VALUES
(1, 'Vishal', 'Kumar', 35451112, 'Amaravati',412513),
(2, 'sham', 'lal', 3548142,'delhi',413614),
(3, 'Sameer', 'Mandale', 36651112, 'Thane',411512),
(4, 'John', 'Bhosale', 35479112,'mumbai',423515);

drop table Person;

-- SQL Server INTERSECT example
SELECT
    city
FROM
    Customers
INTERSECT
SELECT
    city
FROM
    Person
ORDER BY
    city;

-- A) Simple EXCEPT example
SELECT
    city
FROM
    Customers
EXCEPT
SELECT
    city
FROM
    Person

 ORDER BY 
	   city;

CREATE TABLE Sales ( Country VARCHAR(50), Region VARCHAR(50), Sales INT );

INSERT INTO sales VALUES (N'Canada', N'Alberta', 100);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 200);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 300);
INSERT INTO sales VALUES (N'United States', N'Montana', 100);

-- Union:- The results are the same as this query that returns a union of the two GROUP BY statements.
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY ROLLUP (Country, Region)
UNION ALL
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY CUBE (Country, Region);
