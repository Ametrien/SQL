SELECT     dbo.discipline.Disciplina, AVG(dbo.studenti_reusita.Nota) AS Avg
FROM         dbo.studenti_reusita INNER JOIN
                      dbo.discipline ON dbo.studenti_reusita.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (AVG(dbo.studenti_reusita.Nota) > 7)