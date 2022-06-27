CREATE SCHEMA hr;
GO
CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);


INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');


INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

-- SQL Server Inner Join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    INNER JOIN hr.employees e 
        ON e.fullname = c.fullname;

-- SQL Server Left Join
SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	LEFT JOIN hr.employees e 
		ON e.fullname = c.fullname;

-- WHERE Clause in LEFT join

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    LEFT JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE 
    e.id IS NULL;

-- SQL Server Right Join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    RIGHT JOIN hr.employees e 
        ON e.fullname = c.fullname;

-- WHERE Clause in Right join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    RIGHT JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE
    c.id IS NULL;

-- SQL Server full join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    FULL JOIN hr.employees e 
        ON e.fullname = c.fullname;

-- WHERE Clause in full join
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    FULL JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE
    c.id IS NULL OR
    e.id IS NULL;

---CROSS JOIN
CREATE TABLE Meals(MealName VARCHAR(100));
CREATE TABLE Drinks(DrinkName VARCHAR(100));
INSERT INTO Drinks VALUES ('Orange Juice'), ('Tea'), ('Cofee');
INSERT INTO Meals VALUES ('Omlet'), ('Fried Egg'), ('Sausage');
SELECT * FROM Meals;
SELECT * FROM Drinks;

SELECT * FROM Meals 
CROSS JOIN Drinks;

SELECT
    MealName,
    DrinkName,
	0 AS quantity
FROM
    Meals
CROSS JOIN Drinks
ORDER BY
    MealName,
    DrinkName;

/**** --SELF JOIN -- ****/
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

-- Using self join to compare rows within a table
SELECT
    c1.city,
    c1.first_name + ' ' + c1.last_name customer_1,
    c2.first_name + ' ' + c2.last_name customer_2
FROM
    customers c1
INNER JOIN customers c2 ON c1.customer_id >= c2.customer_id
AND c1.city = c2.city
ORDER BY
    city,
    customer_1,
    customer_2;
-- The following query returns the customers located in pune:
SELECT 
   customer_id, first_name + ' ' + last_name c, 
   city
FROM 
  customers
WHERE
   city = 'pune'
ORDER BY 
   c;

--- FULL OUTER JOIN ---
CREATE TABLE projects(
    id INT PRIMARY KEY IDENTITY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE members(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) 
        REFERENCES projects(id)
);
INSERT INTO 
    projects(title)
VALUES
    ('New CRM for Project Sales'),
    ('ERP Implementation'),
    ('Develop Mobile Sales Platform');


INSERT INTO
    members(name, project_id)
VALUES
    ('John Doe', 1),
    ('Lily Bush', 1),
    ('Jane Doe', 2),
    ('Jack Daniel', null);

SELECT * FROM projects;
SELECT * FROM members;

SELECT 
    m.name member, 
    p.title project
FROM 
    members m
    FULL OUTER JOIN projects p 
        ON p.id = m.project_id;

/* To find the members who do not participate in any project and projects which do not have any members, 
you add a WHERE clause to the above query: */
SELECT 
    m.name member, 
    p.title project
FROM 
    members m
    FULL OUTER JOIN projects p 
        ON p.id = m.project_id
WHERE
    m.id IS NULL OR
    P.id IS NULL;
