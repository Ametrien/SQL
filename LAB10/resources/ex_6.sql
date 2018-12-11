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
