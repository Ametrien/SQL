![Image 0](https://github.com/AshleyBlair/SQL/blob/master/LAB10/screenshots/10.png)
### Ex. 1
```SQL
CREATE OR ALTER TRIGGER inregistrarea_noua ON Orarul 
AFTER  UPDATE
AS
BEGIN
DECLARE @old INT;
DECLARE @new INT;
SELECT TOP 1 @old = Auditoriu FROM deleted
SELECT TOP 1 @new = Auditoriu FROM inserted
SELECT TOP 1 *, @old AS Old_Aud FROM orarul
END
GO

UPDATE orarul 
SET orarul.Auditoriu = 205
WHERE Auditoriu = 501;
```
![Image 3](https://github.com/ChiwetelFiennes/SQL/blob/master/LAB10/screenshots/1.png)
### Ex. 2
```SQL
USE universitatea;
GO
IF OBJECT_ID ('ex_nr_02') IS NOT NULL
	DROP TRIGGER ex_nr_0;
GO
CREATE TRIGGER ex_nr_0 ON studenti INSTEAD OF INSERT
	AS
		DECLARE @Id_Student int
		SELECT @Id_Student = Id_Student FROM inserted
		INSERT INTO studenti_reusita(Id_Disciplina, Id_Grupa,Id_Student,Id_Profesor,Data_Evaluare,Tip_Evaluare,Nota) 
		VALUES (101,2,@Id_Student,105,'2018-12-01','Testul 3',8.00);
		INSERT INTO studenti
SELECT * FROM inserted
GO

SELECT * FROM studenti
INSERT INTO studenti VALUES(199,'Spataru','Vasilica','1999-01-01','or. Chisinau')
```
![Image 2](https://github.com/ChiwetelFiennes/SQL/blob/master/LAB10/screenshots/2.png)
### Ex. 3
```SQL
CREATE OR ALTER TRIGGER ex_nr_03 ON studenti_reusita
AFTER UPDATE
AS
BEGIN
    DECLARE @StId INT, @GrId INT;
    DECLARE db_cursor CURSOR FOR 
    SELECT Id_Student, Id_Grupa
    FROM inserted 

    OPEN db_cursor
    FETCH NEXT FROM db_cursor INTO @StId, @GrId

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @GrId in (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'CIB171')
        BEGIN
            -- start task 1
            DECLARE @OldNote INT;
            DECLARE @NewNote INT;
            SELECT  @OldNote = Nota FROM deleted WHERE Id_Student=@StId
            SELECT  @NewNote = Nota FROM inserted WHERE Id_Student=@StId
            IF (@OldNote > @NewNote AND @OldNote IS NOT NULL)
            BEGIN
                UPDATE studenti_reusita
                SET Nota = @OldNote
                WHERE Nota = @NewNote and Id_Student=@StId
            END
            -- start task2
            DECLARE @OldDate DATE;
            DECLARE @NewDate DATE;
            SELECT TOP 1 @OldDate = Data_Evaluare FROM deleted WHERE Id_Student=@StId
            SELECT TOP 1 @NewDate = Data_Evaluare FROM inserted WHERE Id_Student=@StId
            IF (@OldDate IS NOT NULL)
            BEGIN
                UPDATE studenti_reusita
                SET Data_Evaluare = @OldDate
                WHERE Data_Evaluare = @NewDate and Id_Student=@StId
            END
            FETCH NEXT FROM db_cursor INTO @StId,@GrId
            PRINT 'TRIGGER HAS BEEN TRIGGERED'
        END -- end if cib 
    END -- end while
    CLOSE db_cursor
    DEALLOCATE db_cursor
END -- end trigger
GO
UPDATE studenti_reusita
SET  Nota = 10
WHERE Id_Student = 100 and Tip_Evaluare='Examen' and Id_Disciplina=105
```
![Image 3](https://github.com/ChiwetelFiennes/SQL/blob/master/LAB10/screenshots/3.png)
### Ex. 4
```SQL
USE universitatea
GO
IF EXISTS (SELECT 1 FROM sys.triggers 
           WHERE parent_class=0
           AND name='ex_nr_04')
   DROP TRIGGER ex_nr_04 ON DATABASE;
GO

CREATE TRIGGER ex_nr_04
ON DATABASE
FOR ALTER_TABLE
AS
   BEGIN
      DECLARE @ModifiedColumn VARCHAR (MAX);
      SET @ModifiedColumn=(SELECT EVENTDATA().value(
      '(/EVENT_INSTANCE/AlterTableActionList/Alter/Columns/Name)[1]','varchar(max)'));
      IF @ModifiedColumn='Id_Disciplina'
      BEGIN
        PRINT 'This column cannot be modified';
        ROLLBACK;
      END
   END

alter table discipline
ALTER COLUMN Id_Disciplina VARCHAR(7) NOT NULL
```
![Image 4](https://github.com/ChiwetelFiennes/SQL/blob/master/LAB10/screenshots/4.png)
### Ex. 5
```SQL
USE universitatea;
GO
IF EXISTS (SELECT 1 FROM sys.triggers 
           WHERE parent_class=0
           AND name='ex_nr_5')
   DROP TRIGGER ex_nr_5 ON DATABASE;

GO
CREATE TRIGGER ex_nr_5 ON DATABASE
FOR DROP_TABLE, ALTER_TABLE, CREATE_TABLE
AS
DECLARE @Time DATETIME
SELECT @Time = CONVERT(CHAR(8), GETDATE(), 8)
IF @Time NOT BETWEEN '08:00:00' AND '20:00:00'
BEGIN
    PRINT 'Acces denied from 8 pm till 8 am.'
ROLLBACK
END
GO

create table RandomTable (
RandomCode int not null,
Name VARCHAR (20) not null,
PRIMARY KEY (RandomCode)
)
```
![Image 5](https://github.com/ChiwetelFiennes/SQL/blob/master/LAB10/screenshots/5.png)
### Ex. 6
```SQL
USE universitatea;
GO
IF EXISTS (SELECT * FROM sys.triggers WHERE parent_class=0 AND name='ex_nr_06')
	DROP TRIGGER ex_nr_06 ON DATABASE;
GO
CREATE TRIGGER ex_nr_06 ON DATABASE
	AFTER ALTER_TABLE
AS
	DECLARE @cmd varchar(max)
	DECLARE @schema varchar(max)
	DECLARE @cmd1 varchar(max)

	SET @cmd=EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand)[1]','varchar(MAX)')
	SET @schema=EVENTDATA().value('(/EVENT_INSTANCE/Objectname)[1]','varchar(MAX)')
	SET @cmd1=REPLACE(@cmd,@schema,'something') -- string, old string, new string

	IF @cmd LIKE '%Id_Profesor'
	BEGIN
		IF (@schema != 'orarul')
			BEGIN
				SET @cmd1=REPLACE (@cmd,'something','orarul')
				EXECUTE(@cmd1)
			END

			IF (@schema != 'profesori')
			BEGIN
				SET @cmd1=REPLACE (@cmd,'something','profesori')
				EXECUTE(@cmd1)
			END

			IF (@schema != 'studenti_reusita')
			BEGIN
				SET @cmd1=REPLACE (@cmd,'something','studenti_reusita')
				EXECUTE(@cmd1)
			END
	END
GO
```
![Image 6](https://github.com/ChiwetelFiennes/SQL/blob/master/LAB10/screenshots/6.png)
