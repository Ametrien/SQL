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