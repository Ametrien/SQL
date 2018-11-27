create procedure change_profesor_ex4 @Name_old char(20),@Last_name_old char(20), @Name_new char(20), @Last_name_new char(20), @Discipline char(20) 
as
declare @id_profesor int = (select profesori.Id_Profesor from profesori where Prenume_Profesor = @Name_old and Nume_Profesor = @Last_name_old)

if @id_profesor is null
begin
    raiserror('There is no such profesor',16,1)
end

declare @id_discipline int = (select discipline.Id_Disciplina from discipline where discipline.Disciplina = @Discipline)

if @id_discipline is null
begin
    raiserror('There is no such discipline',16,1)
end

declare @validation int = (select studenti_reusita.Id_Profesor from studenti_reusita where Id_Profesor = @id_profesor and Id_Disciplina = @id_discipline)

if @validation is null
begin
raiserror('This profesor does not teachs this discipline',16,1);
end

update profesori 
set Prenume_Profesor = @Name_new, Nume_Profesor = @Last_name_new
where Prenume_Profesor = @Name_old and Nume_Profesor = @Last_name_old