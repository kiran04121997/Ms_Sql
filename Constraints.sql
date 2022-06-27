create database kirandb1;
use kirandb1;

 CREATE TABLE Constraints (
    id int NOT NULL PRIMARY KEY,
    name_ varchar(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 18),
    gender varchar(1) NOT NULL,
    phone bigint NOT NULL UNIQUE,
    city varchar(15) NOT NULL DEFAULT 'Agra'
);

drop table constraints;

 SELECT *  FROM Constraints;
 
INSERT INTO Constraints (id, name_, age, gender, phone, city) VALUES
(1, 'Ram Kumar', 19, 'M', '4051358', 'Agra');
  
---- TEST NOT NULL constraints for gender column ---- 
INSERT INTO Constraints (id, name_, age, phone, city) VALUES
(2, 'sarita', 20, '4054359', 'Agra');  

--- Test DEFAULT VALUE for city column ---   
INSERT INTO Constraints (id, name_, age, gender, phone) VALUES
(2, 'Sarita', 21, 'F', '4064858');  

SELECT *  FROM Constraints;

INSERT INTO Constraints (id, name_, age, gender, phone, city) VALUES
(3, 'Nikita', 25, 'F', '4064958', 'dellhi');  
SELECT *  FROM Constraints; 

--- Test UNIQUE for phone column no change in phone number ---   
INSERT INTO Constraints (id, name_, age, gender, phone, city) VALUES
(4, 'Suvarna', 26, 'F', '4064958', 'Agra');  
SELECT *  FROM Constraints;
  
---- After changing in phone number ---
INSERT INTO Constraints (id, name_, age, gender, phone, city) VALUES
(4, 'Suvarna', 26, 'F', 4064458, 'Agra'); 
SELECT *  FROM Constraints;

--- Test for CHECK Constraints ---
INSERT INTO Constraints (id, name_, age, gender, phone, city) VALUES
(5, 'Kiran', 15, 'M', '4164468', 'Pune'); 

--- After adding the age above 18 according to our condition ---
INSERT INTO Constraints (id, name_, age, gender, phone, city) VALUES
(5, 'Kiran', 25, 'M', '4164468', 'Agra'); 

SELECT *  FROM Constraints;

ALTER TABLE Constraints
ADD Start_DATE DATETIME; 

ALTER TABLE Constraints
DROP COLUMN Start_DATE; 

ALTER TABLE Constraints
ADD End_DATE DATETIME; 

ALTER TABLE Constraints
DROP COLUMN End_DATE; 

UPDATE Constraints
SET Start_DATE = 2020-08-27
WHERE id = 1;

 SELECT *  FROM Constraints;

UPDATE Constraints
SET name_ = 'Gopal'
WHERE id = 1;

UPDATE Constraints
SET name_ = 'Renuka'
WHERE id = 3;


---- Where, Select Clauses And Operators ---

SELECT *  FROM Constraints;

SELECT *  FROM Constraints
WHERE age < 20;

SELECT *  FROM Constraints
WHERE city = 'Agra';

SELECT *  FROM Constraints
WHERE city != 'Agra';

SELECT *  FROM Constraints
WHERE gender = 'M' AND city = 'Agra';

SELECT *  FROM Constraints
WHERE age < 20 OR city = 'Agra';

SELECT *  FROM Constraints
WHERE NOT gender = 'M';

SELECT *  FROM Constraints
WHERE age BETWEEN 18 AND 24;

SELECT *  FROM Constraints
WHERE id BETWEEN 2 AND 4;

SELECT *  FROM Constraints
WHERE id NOT BETWEEN 2 AND 4;

SELECT *  FROM Constraints;

SELECT *  FROM Constraints
ORDER BY name_ ASC;

SELECT *  FROM Constraints
WHERE city = 'Agra'
ORDER BY name_ DESC;
SELECT *  FROM Constraints;

SELECT *  FROM Constraints
ORDER BY id ASC;


---- primary and foreign key Constraints ----

CREATE TABLE City2 (
    cid int NOT NULL PRIMARY KEY,    
    cityname varchar(50) NOT NULL
);

INSERT INTO City2 (cid, cityname) VALUES
(1,'Mumbai');

SELECT * FROM City2;

CREATE TABLE Personal2 (
    id int NOT NULL PRIMARY KEY,
    name_ varchar(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 18),
    gender varchar(1) NOT NULL,
    city int NOT NULL,
	cid int FOREIGN KEY REFERENCES City2(cid) 
);

drop table Personal2;

select * from Personal2 where age > (select avg(age) from Personal2 where age>18);

INSERT INTO Personal2 (id, name_, age, gender, city) VALUES
(1, 'Ram Kumar', 19, 'M', 1),
(2, 'sarita', 20, 'F', 2) ,
(3, 'Nikita', 25, 'F',  1), 
(4, 'Suvarna', 22,'F', 3),
(5, 'Anil', 29,'M', 1),
(6, 'Vishnu', 24,'M', 3),
(7, 'Vishal', 30,'M', 1);

SELECT * FROM Personal2;
