EXEC sp_addumpdevice 'DISK','backup11','K:\Documents\Desktop\exercitiul1.bkp';
GO
BACKUP DATABASE universitatea
 TO DISK = 'K:\Documents\Desktop\exercitiul1.bkp'
 WITH FORMAT,
 NAME = 'Full DB universitatea backup';
 GO
