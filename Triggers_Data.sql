 create database triggers;
 use triggers;
/* syntax of triggers:-
CREATE TRIGGER schema.trigger_name  
ON table_name  
AFTER  {INSERT, UPDATE, DELETE}   
AS 
BEGIN
{SQL_Statements} 
END
The following syntax removes DML triggers:
DROP TRIGGER [IF EXISTS] schema_name.trigger_name; 
*/

CREATE TABLE Employee  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT  
)  

INSERT INTO Employee VALUES (1,'Steffan', 82000, 'Male', 3),  
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3)  

SELECT * FROM Employee;

CREATE TABLE Employee_Audit_Test  
(    
Id int IDENTITY,   
Audit_Action text   
)  

---After insert
ALTER TRIGGER trInsertEmployee   
ON Employee  
FOR INSERT  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

INSERT INTO Employee VALUES (2,'KIRAN', 42000, 'Male', 2);

SELECT * FROM Employee_Audit_Test;
SELECT * FROM Employee;

---After update
CREATE TRIGGER trUpdateEmployee   
ON Employee  
FOR UPDATE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is updated at ' + CAST(Getdate() AS VARCHAR(22)))  
  END

update Employee set Salary=90000 where Id=1;

SELECT * FROM Employee;

---After Delete
CREATE TRIGGER trDeleteEmployee   
ON Employee  
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from deleted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
  END

DELETE FROM Employee WHERE Id = 2;  

SELECT * FROM Employee_Audit_Test;











