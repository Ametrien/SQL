
EX. 8 - Get identificators and names of students who passed exams in 2018.
![Image 1](https://github.com/AnastasiaFAF172/SQL/raw/images/8.JPG)
EX. 14 - Find out first namr and last name of students, also their subjects, but only those students who have got at least 8 at exams.
![Image 2](https://github.com/AnastasiaFAF172/SQL/raw/images/14.JPG)
EX. 17 - Show full names of professors who taught at least a subject to the student whose ID is 100.
![Image 3](https://github.com/AnastasiaFAF172/SQL/raw/images/17.JPG)
EX. 18 - Find full names of professors who taught only subjects with less than 60 hours each.
![Image 4](https://github.com/AnastasiaFAF172/SQL/raw/images/18.JPG)
EX. 25 - In which groups are there more than 24 students?
![Image 5](https://github.com/AnastasiaFAF172/SQL/raw/images/25.JPG)
EX. 35 -  Find names of subjects and average mark of subjects. Show only subjects with average > 7.
![Image 6](https://github.com/AnastasiaFAF172/SQL/raw/images/35_1.JPG)
![Image 7](https://github.com/AnastasiaFAF172/SQL/raw/images/35_2.JPG)

1) Select all the information abouts groups of studies at the faculty.
```
 SELECT     dbo.grupe.*
FROM         dbo.grupe
```

2) Create a list of all subjects in descending order of hours.
```
SELECT     TOP (100) PERCENT Disciplina
FROM         dbo.discipline
ORDER BY Nr_ore_plan_disciplina DESC
```

3) Select all the courses (Disciplina) that are taught by every professor (Nume_Profesor, Prenume_Profesor) in descending order (first name, last name).
```
SELECT     TOP (100) PERCENT dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.discipline.Disciplina
FROM         dbo.discipline INNER JOIN
                      dbo.studenti_reusinta ON dbo.discipline.Id_Disciplina = dbo.studenti_reusinta.Id_Disciplina INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
ORDER BY dbo.profesori.Nume_Profesor DESC, dbo.profesori.Prenume_Profesor DESC
```
4) Show subjects which lenght in symbols is more than 20.
```
SELECT     Disciplina
FROM         dbo.discipline
WHERE     ({ fn LENGTH(Disciplina) } > 20)
```
5) Show the list of students whose nnames end with "u".
```
SELECT     Nume_Student
FROM         dbo.studenti
WHERE    Nume_Student LIKE '%u'
```
6) Show the first and the last name of the first 5 students, who have got marks in descending order for the second test on "Baza de date". 
```
SELECT     TOP (5) dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti_reusinta.Nota, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Disciplina = 'Baze de date')
ORDER BY dbo.studenti_reusinta.Nota DESC
```
7) In which group (Cod_Grupa) are students who live on 31st August street?
```
SELECT     dbo.grupe.Cod_grupa
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_student = dbo.studenti_reusinta.Id_student INNER JOIN
                      dbo.grupe ON dbo.studenti_reusinta.Id_Grupa = dbo.grupe.Id_Grupa
WHERE     (dbo.studenti.Adresa_Postala_Student = '31 August')
```
8) Get identificators and names of students who passed exams in 2018.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Id_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018)
```
9) Find name, address and ID of those students who had at least 8 as an average note in 2018.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Adresa_Postala_Student, dbo.studenti_reusinta.Id_Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (dbo.studenti_reusinta.Nota > 8)
```
10) Provide the full names of the students who got a mark on "Baze de date" which is > 4 and < 8.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (dbo.studenti_reusinta.Nota < 8) AND (dbo.studenti_reusinta.Nota > 4) AND 
                      (dbo.discipline.Disciplina = 'Baze de date')
```
11) Provide full names of professors who taught "Baze de date" in 2018 and gave at least one negative mark to at least one student.
```
SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018) AND (dbo.studenti_reusinta.Nota < 5) AND (dbo.discipline.Disciplina = 'Baze de date')
```
12) Find all students whose first name is Alex and list their full names, subjects, notes and the year when they finished university.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina, dbo.studenti_reusinta.Nota, YEAR(dbo.studenti_reusinta.Data_Evaluare) 
                      AS [Anul sustinerii]
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti.Prenume_Student = 'Alex')
```
13) Find out which subjects study Florea Ioan.
```
SELECT     dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti.Prenume_Student = 'Ioan') AND (dbo.studenti.Nume_Student = 'Florea')
```
14) Find out first namr and last name of students, also their subjects, but only those students who have got at least 8 at exams.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti_reusinta.Nota > 8)
```
15) Find out first and last name of students who passed exam to professor Ion and to professor Gheorghe in 2017.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.profesori.Prenume_Profesor = 'Ion' OR
                      dbo.profesori.Prenume_Profesor = 'Gheorghe') AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2017)
```

16) Show full names of students who studies less than 60 hours and also find their professors.
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti_reusinta.Id_Profesor
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < 60)
```

17) Show full names of professors who taught at least a subject to the student whose ID is 100.
```

SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.studenti_reusinta.Id_Student = 100)
```
18) Find full names of professors who taught only subjects with less than 60 hours each.
```
SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disaplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.discipline.Nr_ore_plan_disciplina < 60)
```

19) Show full names of professors who taught only those subjects where student Cosovanu had a mark less than 5 at least once.
```

SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.studenti.Nume_Student = 'Cosovanu') AND (dbo.studenti_reusinta.Nota < 5)
```

20) Show the number of students who passed the second test on Baze de date in 2018.
```

SELECT     COUNT(dbo.studenti_reusinta.Id_Student) AS [Num of students]
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.studenti_reusinta.Tip_evaluare, dbo.discipline.Disciplina, dbo.studenti_reusinta.Data_Evaluare
HAVING      (dbo.studenti_reusinta.Tip_evaluare = 2) AND (dbo.discipline.Disciplina = 'Baza de date') AND (YEAR(dbo.studenti_reusinta.Data_Evaluare) = 2018)
```

21) How many marks does each student have? Show their full names.
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, COUNT(dbo.studenti_reusinta.Nota) AS [num of notes]
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
GROUP BY dbo.studenti.Prenume_Student
```

22) Get the number of subjects taught by each professor (full name).
```

SELECT     dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, COUNT(dbo.studenti_reusinta.Id_Disciplina) AS [num of discipline]
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
GROUP BY dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor
```

23) Get a list of subjects passed by students with the mark > 7 in descending order of the name of the subject.
```

SELECT     TOP (100) PERCENT dbo.discipline.Disciplina
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (AVG(dbo.studenti_reusinta.Nota) > 7)
ORDER BY dbo.discipline.Disciplina DESC
```

24) Show the list of subjects that are taught by at least 2 professors.
```

SELECT     dbo.discipline.Disciplina
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (COUNT(dbo.studenti_reusinta.Id_Profesor) > 2)
```

25) In which groups are there more than 24 students?
```

SELECT     dbo.grupe.Cod_grupa
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.grupe ON dbo.studenti_reusinta.Id_Grupa = dbo.grupe.Id_Grupa
GROUP BY dbo.grupe.Cod_grupa
HAVING      (COUNT(dbo.studenti_reusinta.Id_Student) > 24)
```

26) Find full names and addresses of students and of professors who live on 31st August street.
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

27) Show ID of students who passed all exams of professor Ion.
```

SELECT     dbo.studenti_reusinta.Id_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor
WHERE     (dbo.profesori.Prenume_Profesor = 'Ion')
```

28) Find full names and average mark of the group of students who passed all subjects of the teachers who live on 31st August street.

```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.studenti.Adresa_Postala_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.profesori ON dbo.studenti_reusinta.Id_Profesor = dbo.profesori.Id_Profesor INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.profesori.Adresa_Postala_Profesor LIKE '%31 August%')
```

29) Show full names of students who passed exams with a mark that is less than any mark of students with ID = 100.
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
WHERE     (dbo.studenti_reusinta.Nota =
                          (SELECT     Nota
                            FROM          dbo.studenti_reusinta AS studenti_reusinta_1
                            WHERE      (Id_Student = 100)))
```

30) How many students have already studied Baze de date in 2018 and in 2019 and what is their average mark?
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

31) Show full names of those students who tried to pass an exam more than twice.
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
FROM         dbo.studenti INNER JOIN
                      dbo.studenti_reusinta ON dbo.studenti.Id_Student = dbo.studenti_reusinta.Id_Student INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
WHERE     (dbo.studenti_reusinta.Nota < 5)
GROUP BY dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student, dbo.discipline.Disciplina
HAVING      (COUNT(dbo.studenti_reusinta.Id_Student) > 2)
```

32) Find full names and average notes of groups of students.
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

33) Find full names of students who have only marks < 5 for every subject.
```

SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
GROUP BY dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
HAVING      (AVG(dbo.studenti_reusinta.Nota) < 5)
```

34) Find full names of students who didn't pass any subject (including intermediate notes).
```
SELECT     dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.studenti ON dbo.studenti_reusinta.Id_Student = dbo.studenti.Id_Student
GROUP BY dbo.studenti.Nume_Student, dbo.studenti.Prenume_Student
HAVING      (AVG(dbo.studenti_reusinta.Nota) < 5)
```
35) Find names of subjects and average mark of subjects. Show only subjects with average > 7.
```
SELECT     dbo.discipline.Disciplina, AVG(dbo.studenti_reusinta.Nota) AS Avg
FROM         dbo.studenti_reusinta INNER JOIN
                      dbo.discipline ON dbo.studenti_reusinta.Id_Disciplina = dbo.discipline.Id_Disciplina
GROUP BY dbo.discipline.Disciplina
HAVING      (AVG(dbo.studenti_reusinta.Nota) > 7)
```

36) Find full names and addresses of all students and professors who live in the same place. Which place? How many people are in those two categories? In ascending order of members in this category.
```
SELECT     TOP (100) PERCENT dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.studenti.Adresa_Postala_Student, dbo.studenti.Nume_Student, 
                      dbo.studenti.Prenume_Student, COUNT(*) AS Count
FROM         dbo.profesori INNER JOIN
                      dbo.studenti ON dbo.profesori.Adresa_Postala_Profesor = dbo.studenti.Adresa_Postala_Student
GROUP BY dbo.profesori.Nume_Profesor, dbo.profesori.Prenume_Profesor, dbo.studenti.Adresa_Postala_Student, dbo.studenti.Nume_Student, 
                      dbo.studenti.Prenume_Student
ORDER BY Count
```
37) Find the subject that was passed by students with the highest exam average mark.
```
SELECT     TOP (1) dbo.discipline.Disciplina, dbo.studenti_reusinta.Nota
FROM         dbo.discipline INNER JOIN
                      dbo.studenti_reusinta ON dbo.discipline.Id_Disciplina = dbo.studenti_reusinta.Id_Disciplina
ORDER BY dbo.studenti_reusinta.Nota DESC
```
38) Find the names of subjects with an average mark less than the average mark of Baze de date.
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
