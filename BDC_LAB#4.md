
```
CREATE DATABASE universitatea
GO

USE universitatea
GO

CREATE TABLE discipline 
		        (Id_Disciplina int primary key,
                     Proizv varchar(65),
                     Nr_ore_plan_disciplina int )
GO

CREATE TABLE grupe 
			  (Id_Grupa int primary key,
                     Cod_grupa varchar(10),
                     Specialitate varchar(30),
                     Nume_Facultate varchar(30) )
GO

INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(100,'Sisteme de operare', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(101,'Programarea calculatoarelor', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(102,'Informatica aplicata', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(103,'Sisteme de calcul', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(104,'Asamblarea si depanare PC', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(105,'Cercetari operationale', 76);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(106,'Programarea WEB', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(107,'Baze de date', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(108,'Structuri de date si algoritmi', 76);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(109,'Retele informatice', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(110,'Matematica discreta', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(111,'Modelarea sistemelor', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(112,'Limbaje evaluate de programare (Java, .NET)', 76);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(113,'Programarea aplicatiilor Wndows', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(114,'Tehnologii de procesare a informatiei', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(115,'Programarea declarativa', 46);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(116,'Proiectarea sistemelor informatice', 60);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(117,'Practica de licenta', 80);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(118,'Practica de productie', 80);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(119,'Integrare informationala europeana', 20);
INSERT discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
VALUES(120,'Programe aplcatve', 46);
GO
INSERT grupe(Id_Grupa,Cod_grupa, Specialitate, Nume_Facultate)
VALUES(1,'CIB171', 'Cibernetica', 'Informatica si Cibernetica');
INSERT grupe(Id_Grupa,Cod_grupa, Specialitate, Nume_Facultate)
VALUES(2,'INF171', 'Informatica', 'Informatica si Cibernetica')
INSERT grupe(Id_Grupa,Cod_grupa, Specialitate, Nume_Facultate)
VALUES(3,'TI171', 'Teehnologii Informationale', 'Informatica si Cibernetica')
Go

USE universitatea
GO

CREATE TABLE studenti 
		     (Id_Student int primary key,
                 Nume_Student varchar(35),
                 Prenume_Student varchar(35),
                 Data_Nastere_Student date,
                 Adresa_Postala_Student varchar(50) )
GO

CREATE TABLE profesori 
		        (Id_Profesor int primary key,
                 Nume_Profesor varchar(35),
                 Prenume_Profesor varchar(35),
                 Adresa_Postala_Profesor varchar(50) )
GO
USE universitatea
GO

CREATE TABLE studenti_reusinta 
		        (Id_Student int foreign key references studenti(Id_Student),
                 Id_Disciplina int foreign key references discipline(Id_Disciplina),
                 Id_Profesor int foreign key references profesori(Id_Profesor),
                 Id_Grupa int foreign key references grupe(Id_Grupa),
                 Tip_evaluare int primary key,
                 Nota decimal(2,2),
                 Data_Evaluare date)
GO

```

![Image 1](https://github.com/AnastasiaFAF172/SQL/raw/images/0001.png)

1)
```
 SELECT     dbo.grupe.*
FROM         dbo.grupe
```

2)
```
SELECT     TOP (100) PERCENT Disciplina
FROM         dbo.discipline
ORDER BY Nr_ore_plan_disciplina DESC
```
3)
```
SELECT     TOP (100) PERCENT dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.discipline.Disciplina
FROM         dbo.discipline INNER JOIN
                      dbo.studenti_reusinta ON dbo.discipline.Id_Disciplina = dbo.studenti_reusinta.Id_Disciplina INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
ORDER BY dbo.profesori.Nume_Profesor DESC, dbo.profesori.Prenume_Profesor DESC
```
4)
```
SELECT     Disciplina
FROM         dbo.discipline
WHERE     ({ fn LENGTH(Disciplina) } > 20)
```
5)
```
SELECT     Nume_Student
FROM         dbo.studenti
WHERE    Nume_Student LIKE '%u'
```
6)
```
SELECT     TOP (5) dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti_reusinta.Nota, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Disciplina = 'Baze de date')
ORDER BY dbo.studenti_reusinta.Nota DESC
```
7)
```
SELECT     dbo.grupe.Cod_grupa
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.grupe ON dbo.studenti_reusinta.Id_Grupa = dbo.grupe.Id_Grupa
WHERE     (dbo.studenti.Adresa_Postala_Student = '31 August')
```
8)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Id_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018)
```
9)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Adresa_Postala_Student, dbo.studenti_reusinta.Id_Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (dbo.studenti_reusinta.Nota > 8)
```
10)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (dbo.studenti_reusinta.Nota < 8) AND (dbo.studenti_reusinta.Nota > 4) AND 
                      (dbo.discipline.Disciplina = 'Baze de date')
```
11)
```
SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (dbo.studenti_reusinta.Nota < 5) AND (dbo.discipline.Disciplina = 'Baze de date')
```
12)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina, dbo.studenti_reusinta.Nota, YEAR(dbo.studenti_reusinta.Data_Evaluare) 
                      AS [Anul sustinerii]
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti.Prenume_Student = 'Alex')
```
13)
```
SELECT     dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti.Prenume_Student = 'Ioan') AND (dbo.studenti.Nume_Student = 'Florea')
```
14)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti_reusinta.Nota > 8)
```
15)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.profesori.Prenume_Profesor = 'Ion' OR
                      dbo.profesori.Prenume_Profesor = 'Gheorghe') AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2017)
```

16)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti_reusinta.Id_Profesor
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < 60)
```

17)
```

SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.studenti_reusinta.Id_Student = 100)
```
18)
```
SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disaplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < 60)
```

19)
```

SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.studenti.Nume_Student = 'Cosovanu') AND (dbo.studenti_reusinta.Nota < 5)
```

20)
```

SELECT     COUNT(dbo.studenti_reusinta.Id_Student) AS [Num of students]
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.studenti_reusinta.Tip_evaluare, dbo.discipline.Disciplina, dbo.studenti_reusinta.Data_Evaluare
HAVING      (dbo.studenti_reusinta.Tip_evaluare = 2) AND (dbo.discipline.Disciplina = 'Baza de date') AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018)
```

21)
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, COUNT(dbo.studenti_reusinta.Nota) AS [num of notes]
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
GROUP BY dbo.studenti.Prenume_Student
```

22)
```

SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, COUNT(dbo.studenti_reusinta.Id_Disciplina) AS [num of discipline]
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
GROUP BY dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
```

23)
```

SELECT     TOP (100) PERCENT dbo.discipline.Disciplina
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (AVG(dbo.studenti_reusinta.Nota) > 7)
ORDER BY dbo.discipline.Disciplina DESC
```

24)
```

SELECT     dbo.discipline.Disciplina
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (COUNT(dbo.studenti_reusinta.Id_Profesor) > 2)
```

25)
```

SELECT     dbo.grupe.Cod_grupa
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.grupe ON dbo.studenti_reusinta.Id_Grupa = dbo.grupe.Id_Grupa
GROUP BY dbo.grupe.Cod_grupa
HAVING      (COUNT(dbo.studenti_reusinta.Id_Student) > 24)
```

26)
```

SELECT     dbo.studenti.Adresa_Postala_Student, dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.studenti.Adresa_Postala_Student LIKE '%31 August%')
UNION ALL
SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.profesori.Adresa_Postala_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.profesori.Adresa_Postala_Profesor LIKE '%31 August%')
```

27)
```

SELECT     dbo.studenti_reusinta.Id_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.profesori.Prenume_Profesor = 'Ion')
```

28)

```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti.Adresa_Postala_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.profesori.Adresa_Postala_Profesor LIKE '%31 August%')
```

29)
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.studenti_reusinta.Nota =
                          (SELECT     Nota
                            FROM          dbo.studenti_reusinta AS studenti_reusinta_1
                            WHERE      (Id_Student = 100)))
```

30)
```

SELECT     COUNT(*) AS Count
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Disciplina = 'Baze de date') AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2019)

SELECT     AVG(dbo.studenti_reusinta.Nota) AS Avg
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Disciplina = 'Baze de date') AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2019)
```

31)
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti_reusinta.Nota < 5)
GROUP BY dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
HAVING      (COUNT(dbo.studenti_reusinta.Id_Student) > 2)
```

32)
```

SELECT     dbo.grupe.Cod_grupa, AVG(dbo.studenti_reusinta.Nota) AS Avg
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.grupe ON dbo.studenti_reusinta.Id_Grupa = dbo.grupe.Id_Grupa
GROUP BY dbo.grupe.Cod_grupa

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.grupe.Cod_grupa
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.grupe ON dbo.studenti_reusinta.Id_Grupa = dbo.grupe.Id_Grupa INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
```

33)
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
GROUP BY dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
HAVING      (AVG(dbo.studenti_reusinta.Nota) < 5)
```

34)
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
GROUP BY dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
HAVING      (AVG(dbo.studenti_reusinta.Nota) < 5)
```
35)
```
SELECT     dbo.discipline.Disciplina, AVG(dbo.studenti_reusinta.Nota) AS Avg
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (AVG(dbo.studenti_reusinta.Nota) > 7)
```

36)
```
SELECT     TOP (100) PERCENT dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.studenti.Adresa_Postala_Student, dbo.studenti.Nume_Student, 
                      dbo.studenti.Prenume_Student, COUNT(*) AS Count
FROM         dbo.profesori INNER JOIN
                      dbo.studenti ON dbo.profesori.Adresa_Postala_Profesor = dbo.studenti.Adresa_Postala_Student
GROUP BY dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.studenti.Adresa_Postala_Student, dbo.studenti.Nume_Student, 
                      dbo.studenti.Prenume_Student
ORDER BY Count
```
37)
```
SELECT     TOP (1) dbo.discipline.Disciplina, dbo.studenti_reusinta.Nota
FROM         dbo.discipline INNER JOIN
                      dbo.studenti_reusinta ON dbo.discipline.Id_Disciplina = dbo.studenti_reusinta.Id_Disciplina
ORDER BY dbo.studenti_reusinta.Nota DESC
```
38)
```
SELECT     dbo.discipline.Disciplina, AVG(dbo.studenti_reusinta.Nota) AS Avg
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (AVG(dbo.studenti_reusinta.Nota) <
                          (SELECT     AVG(dbo.studenti_reusinta.Nota) AS Avg
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (dbo.discipline.Disciplina = 'Baze de date')))
```




