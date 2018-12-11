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
