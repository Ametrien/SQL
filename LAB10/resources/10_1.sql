CREATE OR ALTER TRIGGER inregistrarea_noua ON Orarul 
AFTER  UPDATE
AS
BEGIN
DECLARE @old INT;
DECLARE @new INT;
SELECT TOP 1 @old = Auditoriu FROM deleted
SELECT TOP 1 @new = Auditoriu FROM inserted
SELECT TOP 1 *, @old AS Old_Aud FROM orarul
END
GO
SELECT * FROM orarul
UPDATE orarul 
SET orarul.Auditoriu = 205
WHERE Auditoriu = 501;