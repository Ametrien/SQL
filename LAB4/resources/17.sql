SELECT DISTINCT dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusita INNER JOIN
                      dbo.profesori ON dbo.studenti_reusita.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.studenti_reusita.Id_Student = 100)