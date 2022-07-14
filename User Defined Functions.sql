create database User_DefinedFunction;
use User_DefinedFunction;

--SYSTEM DEFINED FUNCTIONS
--GETDATE(0, APP_NAME(), COALESCE, CURRENT_USER


SELECT GetDate();
select APP_NAME();
select CURRENT_USER
Declare @FName Varchar(50)
select COALESCE(@FName, 'Smith')

--- HOW TO CREATE SCALAR FUNCTION
---RETURN SINGLE VALUE

CREATE FUNCTION AddDigit (@num1 int,@num2 int)
RETURNS int
AS
BEGIN
Declare @result int;
Set @result=@num1+@num2;
RETURN @result
END

select dbo.AddDigit(4,5)

--Example of Scalar function

CREATE TABLE Student_Marks (
    RollNo int NOT NULL PRIMARY KEY,
    Science int,
    Math int,
    Eng int
);

INSERT INTO Student_Marks (RollNo, Science, Math, Eng) VALUES
(1, 34, 78, 54),
(2, 78, 43, 87),
(3, 45, 32, 78),
(4, 36, 78, 32),
(5, 12, 22, 87),
(6, 45, 32, 67),
(7, 34, 78, 54),
(8, 89, 78, 54);

select * from Student_Marks;

select RollNo, Science, Math, Eng,dbo.GetTotal(RollNo) as Total from Student_Marks;

CREATE FUNCTION GetTotal2 (@RollNo int)
RETURNS int
AS
BEGIN
Declare @result int;
select @result=(Science+Math+Eng) from  Student_Marks where RollNo=@RollNo;
RETURN @result
END

select dbo.GetTotal2(2);

---HOW TO CREATE TABLE VALUED FUNCTION (IT RETURNS A TABLE)
/*
AN INLINE  TABLE VALUED FUNCTION CONTAINS A SINGLE STATEMENT
THAT MUST BE A SELECT STATEMENT.
THERE IS NO NEEED FOR A BEGIN-END BLOCK IN AN INLINE FUNCTION.
*/

CREATE FUNCTION GetStudentList(@total int)
RETURNS TABLE
AS
return Select * from Student_Marks where (Science+Math+Eng) > @total;

 select * from dbo.GetStudentList(150);

 /*
 Multi-statement Table Valued Function
 A Multi-statement contains multiple SQL statements enclosed in BEGIN-END blocks.
 In a multi-statement Table Valued function the return value is declared as a table variable and includes the full structure
 of the table to be return 
 The RETURN statement is without a value and the declared table variable is returned
 */
 CREATE TABLE Marksheet (
    RollNo int NOT NULL PRIMARY KEY,
	StName VARCHAR(255),
    Science int,
    Math int,
    Eng int
);

INSERT INTO Marksheet (RollNo, StName, Science, Math, Eng) VALUES
(1,'KIRAN', 34, 78, 54),
(2,'ROHIT', 78, 43, 87),
(3,'RONIT', 45, 32, 78),
(4,'VIKRAM', 36, 78, 32),
(5,'VISHNU', 12, 22, 87),
(6,'AJAY', 45, 32, 67),
(7,'NILESH', 34, 78, 54),
(8,'NITESH', 89, 78, 54);

CREATE TABLE Student (
    RollNo int NOT NULL PRIMARY KEY,
	Student_Name VARCHAR(255)
);

INSERT INTO Student (RollNo, Student_Name) VALUES
(1,'KIRAN'),
(2,'ROHIT'),
(3,'RONIT');





 ALTER FUNCTION MultiStatementGetAllStudents(@RollNo INT)
 RETURNS @Marksheet
 TABLE (StName VARCHAR(50), RollNo INT, Math INT, Eng INT,
 Science INT, Average DECIMAL(4,2),Percentage DECIMAL(4,2))
 AS
 BEGIN
 DECLARE @Avg DECIMAL(4,2);
 DECLARE @Per DECIMAL(4,2);
 DECLARE @StName VARCHAR(100);

 SELECT @StName=student_name FROM Student WHERE RollNo=@RollNo
 SELECT @Avg=((Science+Math+Eng)/3) FROM Student_Marks WHERE RollNo=@RollNo
 SELECT @Per=((Science+Math+Eng)/300) FROM Student_Marks WHERE RollNo=@RollNo

 INSERT INTO @Marksheet (StName,RollNo,Science, Math, Eng,Average,Percentage)
 SELECT @StName,RollNo,Science, Math, Eng,@Avg,@Per FROM Student_Marks WHERE RollNO=@RollNo
 RETURN
 END

 SELECT * FROM dbo.MultiStatementGetAllStudents(3);

--- Simple View ---
 create view student_marks2
as
select * from student;
select * from student_marks2;

select * from student_Marks;

--- Complex View ---
ALTER view student_marks3
as
select Student.RollNo,Student.Student_Name,student_Marks.Eng,student_Marks.Math,student_Marks.Science from student
 inner join student_marks
on Student.RollNo=Student_Marks.RollNo;

select * from student_marks3;

