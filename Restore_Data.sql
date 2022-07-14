USE [master]
BACKUP LOG [Set_Operators] 
TO  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Set_Operators_LogBackup_2022-07-11_08-08-48.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'Set_Operators_LogBackup_2022-07-11_08-08-48', 
NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Set_Operators] 
FROM  
DISK = N'D:\MS_SQL Server\BackUp_Data\operators.bak' 
WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO


