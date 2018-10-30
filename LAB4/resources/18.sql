SELECT DISTINCT dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusita INNER JOIN
                      dbo.profesori ON dbo.studenti_reusita.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.discipline ON dbo.studenti_reusita.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < 60)