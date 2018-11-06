SELECT Id_Profesor, 
		Nume_Profesor, 
		Prenume_Profesor, 
		Adresa_Postala_Profesor AS Localitate, 
		SUBSTRING(Adresa_Postala_Profesor, CHARINDEX('str.', Adresa_Postala_Profesor), 15) as Adresa_1, 
		SUBSTRING(Adresa_Postala_Profesor, CHARINDEX(', ', Adresa_Postala_Profesor), 5) as Adresa_2

INTO profesori_new
FROM profesori

ALTER TABLE profesori_new
ADD DEFAULT 'Mun. Chisinau' FOR Localitate;
ALTER TABLE profesori_new   
ADD CONSTRAINT Id_Profesor PRIMARY KEY CLUSTERED (Id_Profesor);