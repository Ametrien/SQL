CREATE PROCEDURE procedure_nr_2 @FirstResult int OUTPUT
AS
SELECT @FirstResult = COUNT(DISTINCT Id_Student)
FROM studenti_reusita
WHERE Nota < 5.0 or Nota is null