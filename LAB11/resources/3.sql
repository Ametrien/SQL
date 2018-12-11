USE master;
GO
EXEC sp_addumpdevice 'DISK','backup_log_1',
'K:\Documents\Desktop\exercitiul03.bkp';
GO
BACKUP LOG universitatea
TO DISK = 'K:\Documents\Desktop\exercitiul03.bkp';
GO


