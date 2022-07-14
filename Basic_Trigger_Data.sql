create database Basic_Trigger;
use Basic_Trigger;

--- trigger which will restrict creating a new table on specific database
/*Types of SQL Server Triggers
Data Definition Language (DDL) Triggers
Data Manipulation Language (DML) Triggers 
 
*/

CREATE TRIGGER TrgPreventCreateTable
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
PRINT 'YOU CANNOT CREATE A TABLE IN THIS DATABASE'
ROLLBACK TRANSACTION
END

create table test2 
(id int)

---
CREATE TRIGGER TrgEventGroup
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
PRINT 'YPU CANNOT CREATE,ALTER OR DROP A TABLE'
ROLLBACK TRANSACTION
END

drop table test2;

---
CREATE TRIGGER TrgServerAll
ON DATABASE
FOR DDL_TABLE_EVENTS
AS
BEGIN
PRINT 'YPU CANNOT CREATE,ALTER OR DROP A TABLE IN ANY DATABASES'
ROLLBACK TRANSACTION
END
--
