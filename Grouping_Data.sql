Create database Grouping_Data;
use Grouping_Data;

/* Section 6. Grouping data  */

CREATE TABLE Sales ( Country VARCHAR(50), Region VARCHAR(50), Sales INT );

INSERT INTO sales VALUES (N'Canada', N'Alberta', 100);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 200);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 300);
INSERT INTO sales VALUES (N'United States', N'Montana', 100);

SELECT Country, Region, SUM(sales) AS TotalSales
FROM Sales
GROUP BY Country, Region;

-- GROUP BY ()
SELECT Country, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY GROUPING SETS ( Country, () );

--GROUP BY ROLLUP
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY ROLLUP (Country, Region);

-- GROUP BY CUBE ( )
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY CUBE (Country, Region);

-- GROUP BY GROUPING SETS ( )
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY GROUPING SETS ( ROLLUP (Country, Region), CUBE (Country, Region) );

-- The results are the same as this query that returns a union of the two GROUP BY statements.
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY ROLLUP (Country, Region)
UNION ALL
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY CUBE (Country, Region);

/** HAVING CLAUSE **/
CREATE TABLE Employee(
   EmployeeId int,
   Name Varchar(20),
   Gender Varchar(20),
   Salary int,
   Department Varchar(20),
   Experience Varchar(20)
);
INSERT INTO Employee VALUES (1, 'Rachit', 'M', 50000, 'Engineering', '6 year')
INSERT INTO Employee VALUES (2, 'Shobit', 'M', 37000, 'HR', '3 year')
INSERT INTO Employee VALUES (3, 'Isha', 'F', 56000, 'Sales', '7 year')
INSERT INTO Employee VALUES (4, 'Devi', 'F', 43000, 'Management', '4 year')
INSERT INTO Employee VALUES (5, 'Akhil', 'M', 90000, 'Engineering', '15 year')

SELECT * FROM Employee;

SELECT Department, sum(Salary) as Salary
FROM employee
GROUP BY department
HAVING SUM(Salary) >= 50000; 

CREATE TABLE Student(
   student Varchar(20),
   percentage int
);

INSERT INTO Student VALUES ('Isha Patel', 98)
INSERT INTO Student VALUES ('Harsh Das', 94)
INSERT INTO Student VALUES ('Rachit Sha', 93)
INSERT INTO Student VALUES ('Sumedha', 98)
INSERT INTO Student VALUES ('Rahat Ali', 98)

SELECT * FROM Student;

SELECT student, percentage
FROM Student
GROUP BY student, percentage
HAVING percentage > 95;

SELECT student  
FROM Student
WHERE percentage > 90
GROUP BY student, percentage
HAVING SUM(percentage) < 1000 AND AVG(percentage) > 95;

