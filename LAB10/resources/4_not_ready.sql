CREATE OR ALTER TRIGGER ex4
ON discipline JOIN studenti_reusita, orarul
-- но надо на все таблицы
-- Select * From INFORMATION_SCHEMA.COLUMNS Where column_name = 'Id_Disciplina'
AFTER UPDATE
AS
BEGIN
IF UPDATE(Id_Disciplina)
    BEGIN
        RAISERROR ('You can not update when Flag value is 1', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;