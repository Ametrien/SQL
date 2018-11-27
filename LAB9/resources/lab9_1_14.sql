CREATE PROCEDURE procedure_nr_14 @Grade float
AS

SELECT DISTINCT dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusita ON dbo.studenti.Id_Student = dbo.studenti_reusita.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusita.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti_reusita.Nota > @Grade)

GO

EXEC procedure_nr_14 @Grade = 8.0;

