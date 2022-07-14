create database BasicsofIndex;
use BasicsofIndex; 

CREATE TABLE [STUDENT](  
    id nchar(10),  
    name nchar(10),  
    age nchar(10),  
    salary nchar(10)  
);  

INSERT INTO [STUDENT]    
           ([ID]    
           ,[NAME]    
           ,[AGE]    
           ,[SALARY])    
     VALUES    
           (1, 'John', 27, 20000),     
           (2, 'Harris', 29, 28000),    
           (3, 'peter', 17, 25000),  
           (4, 'Marco', 29, 28000),    
           (5, 'Diego', 17, 35000),  
           (6, 'Antonio', 22, 48000),    
           (7, 'Steffen', 16, 35000);
	   
SELECT * FROM [STUDENT]; 
drop table [STUDENT]; 

SELECT * FROM [STUDENT] WHERE age>20; 

/* An index is a set of keys made up of single or multiple columns in a table or view.
Indexes are used to retrieve data from the database more quickly than otherwise. 
The users cannot see the indexes, they are just used to speed up searches/queries.  */

/* HOW TO CREATE INDEX
CREATE INDEX index_name  
ON table_name (column1, column2 ...);   */
CREATE INDEX index_age ON STUDENT (age); 
SELECT * FROM [STUDENT] WHERE age>20;
CREATE INDEX index_id ON STUDENT (id);

---HOW TO DROP INDEX
DROP INDEX  index_id ON STUDENT;

--Clustered indexing
CREATE CLUSTERED INDEX student_name
ON STUDENT (NAME); 

CREATE CLUSTERED INDEX student_salary
ON STUDENT (SALARY); 

--Non-Clustered indexing
CREATE INDEX student_salary
ON STUDENT (SALARY);