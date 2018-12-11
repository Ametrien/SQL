USE universitatea;
GO
BACKUP DATABASE universitatea
TO DISK = 'K:\Documents\Desktop\exercitiul2.bkp'
WITH DIFFERENTIAL,
NAME = 'Differential DB universitatea backup';
GO

