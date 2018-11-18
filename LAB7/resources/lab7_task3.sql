
CREATE TABLE orarul
(
  [Id_Disciplina] INT NOT NULL,
  [Id_Profesor] INT NOT NULL,
  [Id_Grupa] INT NOT NULL,
  [Bloc] VARCHAR(50) NOT NULL,
  [Zi] VARCHAR(50) NOT NULL,
  [Ora] VARCHAR(50) NOT NULL,
  [Auditoriu] INT NOT NULL
  
  CONSTRAINT PK_orarul PRIMARY KEY NONCLUSTERED ([Id_Grupa], [Zi], [Ora], [Auditoriu])
)