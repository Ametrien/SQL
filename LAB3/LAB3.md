
```SQL
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

![Image 1](https://github.com/AshleyBlair/SQL/blob/master/LAB3/screenshots/screenshot.png)
