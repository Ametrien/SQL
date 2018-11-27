CREATE FUNCTION task_6_2 (@Hours float)
RETURNS TABLE
AS RETURN

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti_reusita.Id_Profesor
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusita ON dbo.studenti.Id_Student = dbo.studenti_reusita.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusita.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < @Hours)

GO

SELECT * FROM task_6_2(60)