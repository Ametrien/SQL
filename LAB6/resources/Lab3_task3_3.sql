DECLARE @id_grupa_current INT = 0;
DECLARE @group_count INT = (SELECT COUNT(Id_Grupa) FROM grupe);


WHILE @id_grupa_current < @group_count 
BEGIN

    SET @id_grupa_current = @id_grupa_current + 1
    UPDATE grupe
    SET Sef_grupa =  (
        SELECT DISTINCT Id_Student
        FROM studenti_reusita
        WHERE Id_Student in (SELECT Id_Student 
            FROM studenti_reusita
            GROUP BY Id_Student, Id_Grupa

            HAVING AVG(CAST(Nota AS FLOAT)) = any(
                SELECT MAX(media)
                FROM (
                SELECT  Id_Grupa, Id_Student, AVG(CAST(studenti_reusita.Nota AS FLOAT)) AS media
                FROM studenti_reusita
                GROUP BY Id_Student, Id_Grupa) AS T
                GROUP BY Id_Grupa
            ) and Id_Grupa = @id_grupa_current
        ) 
    )
    WHERE Id_Grupa = @id_grupa_current
END