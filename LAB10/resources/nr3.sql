create or alter trigger ex3 on studenti_reusita
after update 
as
begin

    declare @StId int, @GrId int;

    DECLARE db_cursor CURSOR FOR 
    SELECT Id_Student, Id_Grupa
    FROM inserted 

    OPEN db_cursor
    FETCH NEXT FROM db_cursor INTO @StId, @GrId

    WHILE @@FETCH_STATUS = 0
    BEGIN
        if @GrId in (select Id_Grupa from grupe where Cod_Grupa = 'CIB171')
        begin
            -- start task 1
            declare @OldNote int;
            declare @NewNote int;
            select  @OldNote = Nota from deleted where Id_Student=@StId
            select  @NewNote = Nota from inserted where Id_Student=@StId
            if (@OldNote > @NewNote and @OldNote is not null)
            begin
                UPDATE studenti_reusita
                SET Nota = @OldNote
                WHERE Nota = @NewNote and Id_Student=@StId
            end
            -- start task2
            declare @OldDate date;
            declare @NewDate date;
            select top 1 @OldDate = Data_Evaluare from deleted where Id_Student=@StId
            select top 1 @NewDate = Data_Evaluare from inserted where Id_Student=@StId
            if (@OldDate is not null)  --  or @NewDate is not null
            begin
                UPDATE studenti_reusita
                SET Data_Evaluare = @OldDate
                WHERE Data_Evaluare = @NewDate and Id_Student=@StId
            end
            FETCH NEXT FROM db_cursor INTO @StId,@GrId

            Print 'TRIGGER HAS BEEN TRIGGERED'
        end -- end if cib 


    end -- end while
    CLOSE db_cursor
    DEALLOCATE db_cursor
end -- end trigger

go
update studenti_reusita
set  Nota = 10
where Id_Student = 100 and Tip_Evaluare='Examen' and Id_Disciplina=105
