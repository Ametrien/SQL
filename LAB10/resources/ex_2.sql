USE universitatea;
GO
IF OBJECT_ID ('ex_nr_02') IS NOT NULL
	DROP TRIGGER ex_nr_0;
GO
CREATE TRIGGER ex_nr_0 ON studenti INSTEAD OF INSERT
	AS
		DECLARE @Id_Student int
		SELECT @Id_Student = Id_Student FROM inserted
		INSERT INTO studenti_reusita(Id_Disciplina, Id_Grupa,Id_Student,Id_Profesor,Data_Evaluare,Tip_Evaluare,Nota) 
		VALUES (101,2,@Id_Student,105,'2018-12-01','Testul 3',8.00);
		INSERT INTO studenti
SELECT * FROM inserted
GO

SELECT * FROM studenti
INSERT INTO studenti VALUES(199,'Spataru','Vasilica','1999-01-01','or. Chisinau')