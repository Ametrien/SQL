RESTORE DATABASE [universitatea] 
  FROM  DISK = N'K:\Documents\Desktop\exercitiul1.bkp' 
  WITH  FILE = 1,  MOVE N'universitatea' TO N'J:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\calculatoare_lab10.mdf',  
  MOVE N'universitatea_log' TO N'J:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\calculatoare_lab10_log.ldf',  
  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 10
GO
RESTORE DATABASE [universitatea] 
  FROM  DISK = N'K:\Documents\Desktop\exercitiul2.bkp' 
  WITH  FILE = 1,  MOVE N'universitatea' TO N'J:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\calculatoare_lab10.mdf',  
  MOVE N'universitatea_log' TO N'J:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\calculatoare_lab10_log.ldf',  
  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 10
GO
 RESTORE LOG [universitatea]  
 FROM  DISK = N'K:\Documents\Desktop\exercitiul3.bkp' 
 WITH  FILE = 1,  NOUNLOAD,  STATS = 10
GO
