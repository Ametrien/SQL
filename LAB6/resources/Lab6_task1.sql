/*
SELECT   Nume_Profesor, Adresa_Postala_Profesor =
      CASE   
			WHEN (Adresa_Postala_Profesor IS NULL OR Adresa_Postala_Profesor = '') THEN
			INSERT INTO Profesori (Adresa_Postala_Profesor) VALUES ('mun. Chisinau')   
         ELSE BREAK;  
      END  
FROM Profesori
*/

/*
INSERT INTO Profesori (Adresa_Postala_Profesor) VALUES ('mun. Chisinau')
WHERE Adresa_Postala_Profesor IS NULL OR Adresa_Postala_Profesor = ''

*/

UPDATE Profesori
SET    Adresa_Postala_Profesor = 'mun. Chisinau'
WHERE  Adresa_Postala_Profesor IS NULL OR Adresa_Postala_Profesor = ''

