SELECT DISTINCT Id_Disciplina, Id_Profesor, Id_Grupa
INTO orarul
FROM studenti_reusita
WHERE Id_Grupa = 1 or Id_Grupa = 2 
ALTER TABLE orarul ADD ora VARCHAR(5) NULL, Auditoriu INT NULL;
go

CREATE NONCLUSTERED INDEX NIX_task6  
    ON orarul (Id_Disciplina, Id_Profesor, Id_Grupa)  
GO

ALTER DATABASE universitatea
ADD FILE (NAME = FGTask6, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FGTask6.ndf')
TO FILEGROUP userdatafgroup1;

UPDATE orarul SET ora = '08:00', Auditoriu = 202 WHERE Id_Disciplina = 107 and Id_Grupa = 1;
UPDATE orarul SET ora = '11:30', Auditoriu = 501 WHERE Id_Disciplina = 108 and Id_Grupa = 1;
UPDATE orarul SET ora = '13:00', Auditoriu = 501 WHERE Id_Disciplina = 119 and Id_Grupa = 1;
go

UPDATE orarul SET ora = '08:00', Auditoriu = 123 WHERE Id_Disciplina = 108 and Id_Grupa = 2;
UPDATE orarul SET ora = '11:30', Auditoriu = 321 WHERE Id_Disciplina = 120 and Id_Grupa = 2;
UPDATE orarul SET ora = '13:00', Auditoriu = 602 WHERE Id_Disciplina = 107 and Id_Grupa = 2;
go

CREATE NONCLUSTERED INDEX NIX_task6  
    ON orarul (Id_Disciplina, Id_Profesor, Id_Grupa)  
    WITH (DROP_EXISTING = ON)  
    ON userdatafgroup1; 























