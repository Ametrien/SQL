SELECT DISTINCT dbo.studenti.Nume_Student, dbo.studenti.Id_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusita ON dbo.studenti.Id_Student = dbo.studenti_reusita.Id_Student
WHERE     (YEAR(dbo.studenti_reusita.Data_Evaluare) = 2018)