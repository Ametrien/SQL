	BEGIN TRY
    BEGIN TRANSACTION;

	DECLARE @N1 INT, @N2 INT, @N3 INT
	DECLARE @THE_GREATEST INT;

	SET @N1 = 60 * RAND();
	SET @N2 = 60 * RAND();
	SET @N3 = 60 * RAND();

	SET @THE_GREATEST = CASE 
	WHEN (@N1 > @N2 AND @N1 > @N3) THEN @N1
	WHEN (@N2 > @N1 AND @N2 > @N3) THEN @N2
	ELSE @N3
	
	END
	PRINT @N1;
	PRINT @N2;
	PRINT @N3;

	PRINT 'The greatest = ' + CAST(@THE_GREATEST AS VARCHAR(2));

    COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION

	DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();

    PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
    PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH