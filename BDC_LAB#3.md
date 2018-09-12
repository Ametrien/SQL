
### Laboratory work №3 – Database Creation and Manipulation. DML

#### Theory

#### №1 
This numbers can be introduced in a field of DECIMAL(4,1) type:
**a)** 16,2;
**b)** 116,2;
**d)** 1116,2.
#### №2 
| Col1       | Col2          | Col3  |
| ------------- |:-------------:| -----:|
| 1     | 1.0 | *1.0* |
| 2      | 1.0      | *2.0*   |

The file [Col1] of this table is of the *INT* type, and [Col2] is of the *DECIMAL* type.
Then, [Col3] has to be of **DECIMAL(2,1)** type in order to contain the result of the following expression: Col1 * Col2.
#### №3 
![Image 1](https://github.com/AnastasiaFAF172/SQL/raw/images/3_1.png)
![Image 2](https://github.com/AnastasiaFAF172/SQL/raw/images/3_2.png)

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
```
#### №4 
![Image 1](https://github.com/AnastasiaFAF172/SQL/raw/images/3_3.png)


```
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
```

![Image 2](https://github.com/AnastasiaFAF172/SQL/raw/images/3_4.png)

```
INSERT grupe(Id_Grupa,Cod_grupa, Specialitate, Nume_Facultate)
VALUES(1,'CIB171', 'Cibernetica', 'Informatica si Cibernetica');
INSERT grupe(Id_Grupa,Cod_grupa, Specialitate, Nume_Facultate)
VALUES(2,'INF171', 'Informatica', 'Informatica si Cibernetica')
INSERT grupe(Id_Grupa,Cod_grupa, Specialitate, Nume_Facultate)
VALUES(3,'TI171', 'Teehnologii Informationale', 'Informatica si Cibernetica')
go
```

