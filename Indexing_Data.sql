create database Indexing_Data;
USE Indexing_Data;

CREATE TABLE production_parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);

INSERT INTO 
    production_parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');
	
SELECT 
    part_id, 
    part_name
FROM 
    production_parts
WHERE 
    part_id = 5;


/* SQL Server has two types of indexes: clustered index and non-clustered index. 
A clustered index stores data rows in a sorted structure based on its key values. 
Each table has only one clustered index because data rows can be only sorted in one order. 
A table that has a clustered index is called a clustered table. */

-- SQL Server Clustered Index and Primary key constraint
CREATE TABLE production_part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);

ALTER TABLE production_parts
ADD PRIMARY KEY(part_id);

-- Using SQL Server CREATE CLUSTERED INDEX statement to create a clustered index.  

CREATE CLUSTERED INDEX ix_parts_name
ON production_parts (part_name);   


      -- Non-clustered index --
/*-  A nonclustered index is a data structure that improves the speed of data retrieval from tables. 
  - A nonclustered index sorts and stores data separately from the data rows in the table. 
  - It is a copy of selected columns of data from a table with the links to the associated table. */

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


-- A) Using the SQL Server CREATE INDEX statement to create a nonclustered index for one column example
SELECT 
    customer_id, 
    city
FROM 
    customers
WHERE 
    city = 'Agra';
  
CREATE INDEX ix_customers_city
ON customers(city);

select * from Customers;

-- B) Using SQL Server CREATE INDEX statement to create a nonclustered index for multiple columns example
SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    customers
WHERE 
    last_name = 'Mandale' AND 
    first_name = 'Dipak';

CREATE INDEX ix_customers_name 
ON customers(last_name, first_name);

