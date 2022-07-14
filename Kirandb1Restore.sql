BACKUP DATABASE [kirandb1] TO  
DISK = N'D:\MS_SQL Server\BackUp&Restore\kirandb1_09072022.BAK' 
WITH NOFORMAT, INIT,  NAME = N'kirandb1-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO
