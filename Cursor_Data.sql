create database Cursor_Data;
use Cursor_Data;

CREATE TABLE Employee (
  E_Name varchar(50) NOT NULL,
  Salary int NOT NULL
  );

INSERT INTO Employee ( E_Name,Salary) VALUES 
('KIRAN',25000),
('DIPAK',35000),
('VIKAS',20000),
('NIKITA',42000),
('AJAY',50000);

Select * from Employee;

/* In SQL procedures, a cursor make it possible to define a result set (a set of data rows) and 
perform complex logic on a row by row basis. */

/* EXAMPLE OF CURSOR */

---Declare variable
DECLARE @E_Name varchar(50), @Salary int
---Declare cursor
DECLARE DB_Cursor CURSOR
FOR SELECT E_Name,Salary FROM Employee

OPEN DB_Cursor

FETCH NEXT FROM DB_Cursor INTO @E_Name,@Salary

WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @E_Name+' '+CAST(@Salary AS VARCHAR)
FETCH NEXT FROM DB_Cursor INTO @E_Name,@Salary
END

Close DB_Cursor
DEALLOCATE DB_Cursor     --DEALLOCATE removes the association between a cursor and the cursor name or cursor variable.

Select * from Employee;

