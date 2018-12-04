![Image 1](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/tasks%207.png)

### Ex. 1

![Image 2](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/3.png)

### Ex. 2

![Image 3](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/4.png)
![Image 4](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/5.png)
![Image 5](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/6.png)
![Image 6](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/7.png)

### Ex. 3

![Image 7](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/8.png)
![Image 8](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/9.png)
![Image 9](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/10.png)

### Ex. 4

![Image 10](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/11.png)
![Image 11](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/12.png)

### Ex. 5

![Image 12](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/13.png)
![Image 13](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/14.png)
![Image 14](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/15.png)
![Image 15](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/16.png)

### Ex. 6

![Image 16](https://github.com/AshleyBlair/SQL/blob/master/LAB7/screenshots/17.png)

### Ex. 7

```SQL
USE universitatea

--18
SELECT distinct cadre_didactice.profesori.Nume_Profesor, cadre_didactice.profesori.Prenume_Profesor
FROM studenti.studenti_reusita
	INNER JOIN cadre_didactice.profesori

ON studenti.studenti_reusita.Id_Profesor=cadre_didactice.profesori.Id_Profesor
WHERE Id_Disciplina not in( 
SELECT discipline.Id_Disciplina
FROM plan_studii.discipline
WHERE discipline.Nr_ore_plan_disciplina>60)

--35
SELECT DISTINCT Disciplina, AVG(cast(Nota as float)) Media FROM studenti.studenti_reusita sr
	INNER JOIN plan_studii.discipline d on d.Id_Disciplina = sr.Id_Disciplina
GROUP BY Disciplina
HAVING AVG(cast(Nota as float)) > 7
ORDER BY Disciplina DESC
``` 

### Ex. 8
```SQL
CREATE SYNONYM st FOR studenti.studenti
CREATE SYNONYM st_re FOR studenti.studenti_reusita
CREATE SYNONYM pl_st_d FOR plan_studii.discipline
CREATE SYNONYM cad_did_pr FOR cadre_didactice.profesori

--18
SELECT distinct Nume_profesor, Prenume_profesor
FROM st_re INNER JOIN cad_did_pr
ON st_re.Id_Profesor=cad_did_pr.Id_Profesor
WHERE Id_Disciplina not in( 
SELECT Id_Disciplina
FROM pl_st_d
WHERE Nr_ore_plan_disciplina>60)
```
