SELECT     dbo.grupe.Cod_grupa
FROM         dbo.studenti_reusita INNER JOIN
                      dbo.grupe ON dbo.studenti_reusita.Id_Grupa = dbo.grupe.Id_Grupa
GROUP BY dbo.grupe.Cod_grupa
HAVING      (COUNT(dbo.studenti_reusita.Id_Student) > 24)