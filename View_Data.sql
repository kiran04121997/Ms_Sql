create database View_Data;
use View_Data;

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

CREATE TABLE Student (
    RollNo int NOT NULL PRIMARY KEY,
	Student_Name VARCHAR(255)
);

INSERT INTO Student (RollNo, Student_Name) VALUES
(1,'KIRAN'),
(2,'ROHIT'),
(3,'RONIT');


--- Simple View ---
create view student_marks5
as
select 
  Student_Name
  from student;

select * from student_marks5;

--- Simple View ---
create view student_marks2
as
select * from student;

select * from student_marks2;

select * from student_Marks;

--- Complex View ---
alter view student_marks3
as
select Student.RollNo,Student.Student_Name,student_Marks.Eng,student_Marks.Math,student_Marks.Science from student
 inner join student_marks
on Student.RollNo=Student_Marks.RollNo;

select * from student_marks3;



