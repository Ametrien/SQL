SELECT studenti.Nume_Student,studenti.Prenume_Student, grupe.Cod_Grupa ,AVG(CAST(Nota AS FLOAT))
FROM studenti_reusita

join studenti ON studenti.Id_Student = studenti_reusita.Id_Student
join grupe ON grupe.Id_Grupa = studenti_reusita.Id_Grupa

GROUP BY studenti.Nume_Student,studenti.Prenume_Student, grupe.Cod_Grupa

HAVING AVG(CAST(Nota AS FLOAT)) = any(
	SELECT MAX(media)
	FROM (
	SELECT  Id_Grupa, Id_Student, AVG(CAST(studenti_reusita.Nota AS FLOAT)) AS media
	FROM studenti_reusita
	GROUP BY Id_Student, Id_Grupa) AS T
	GROUP BY Id_Grupa
)