
![Image 0](https://github.com/AppleAirPods/SQL/blob/master/LAB11/screenshots/11.png)
### Ex. 1
```SQL
EXEC sp_addumpdevice 'DISK','backup11','K:\Documents\Desktop\exercitiul1.bkp';
GO
BACKUP DATABASE universitatea
 TO DISK = 'K:\Documents\Desktop\exercitiul1.bkp'
 WITH FORMAT,
 NAME = 'Full DB universitatea backup';
 GO
```
![Image 1](https://github.com/AppleAirPods/SQL/blob/master/LAB11/screenshots/001.JPG)
### Ex. 2
```SQL
USE universitatea;
GO
BACKUP DATABASE universitatea
TO DISK = 'K:\Documents\Desktop\exercitiul2.bkp'
WITH DIFFERENTIAL,
NAME = 'Differential DB universitatea backup';
GO
```
![Image 2](https://github.com/AppleAirPods/SQL/blob/master/LAB11/screenshots/002.JPG)
### Ex. 3
```SQL
USE master;
GO
EXEC sp_addumpdevice 'DISK','backup_log_1',
'K:\Documents\Desktop\exercitiul03.bkp';
GO
BACKUP LOG universitatea
TO DISK = 'K:\Documents\Desktop\exercitiul03.bkp';
GO
```
![Image 3](https://github.com/AppleAirPods/SQL/blob/master/LAB11/screenshots/003.JPG)
### Ex. 4
```SQL
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
```
![Image 4](https://github.com/AppleAirPods/SQL/blob/master/LAB11/screenshots/004.JPG)
