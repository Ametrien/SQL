ALTER TABLE grupe ADD Sef_grupa INT 
ALTER TABLE grupe ADD CONSTRAINT ExistSef UNIQUE (Sef_grupa)
ALTER TABLE grupe ADD Prof_Inrudator INT
ALTER TABLE grupe ADD CONSTRAINT ExistProfIntrudactor UNIQUE (Sef_grupa)
