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
