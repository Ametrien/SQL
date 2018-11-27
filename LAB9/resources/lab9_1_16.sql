CREATE PROCEDURE procedure_nr_16 @Hours float
AS

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti_reusita.Id_Profesor
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusita ON dbo.studenti.Id_Student = dbo.studenti_reusita.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusita.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < @Hours)

GO

EXEC procedure_nr_16 @Hours = 60;