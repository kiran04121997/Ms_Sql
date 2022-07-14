create database Subquery_Data;
use Subquery_Data;


CREATE TABLE Orders (
    OrderNumber int NOT NULL UNIQUE,
    name_ varchar(50) NOT NULL,
    waiting_day INT NOT NULL,
    country varchar(20) NOT NULL,
    Delivery_Status varchar(255) NOT NULL,
    requiredDate DATE,
    shippedDate DATE
);

drop table Orders;

INSERT INTO Orders (OrderNumber, name_, waiting_day, country, Delivery_Status, requiredDate, shippedDate ) VALUES
(1, 'kiran', 0, 'ind','on_time', '2020-04-12','2022-01-24'), 
(2, 'vishnu', 1, 'eng','Late', '2019-01-25','2021-05-20'),
(3, 'Nikita', 5, 'pak', 'Very Late', '2017-08-20','2022-05-10'),
(4, 'ronit', 4,'aus', 'Late', '2018-01-04','2022-02-24'),
(5, 'Rohan', 12, 'sa', 'No Information', '2026-04-18','2020-01-28');

select * from  Orders; 


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

-- Introduction to SQL Server subquery

select * from Customers where Customer_id IN (select Customer_id from Customers WHERE Customer_id=2);

SELECT
    Customer_id,
    first_name, 
	last_name
FROM
    customers
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            customers
        WHERE
            city = 'pune'
    )
ORDER BY
    first_name DESC;

-- SQL Server subquery is used with EXISTS or NOT EXISTS
SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM
    customers
WHERE
    EXISTS (
        SELECT
            customer_id
        FROM
            Customers
        WHERE
            city = 'pune'
    )
ORDER BY
    first_name,
    last_name;


