





CREATE PROCEDURE [error].[CheckReconAccounts]
AS

BEGIN TRY
  	BEGIN TRAN upd_error
		UPDATE a
		SET a.[Status] = 'E'
		FROM 
			[GlobalRepository].[recon].[Accounts] a 
		WHERE 
			(
			a.AccountExId IS NULL
			OR 
			a.CountryRegionCode IS NULL 
			OR 
			a.Name IS NULL 
			OR
			a.Type IS NULL 
			)
			AND 
			a.[Status] = 'I'
    COMMIT TRAN upd_error;

	BEGIN TRAN insert_error
	DECLARE @recAccountId int
	DECLARE @columnName nvarchar(100)
	DECLARE cur CURSOR 
	FOR
	SELECT [RecAccountId]
		  ,[ColumnName]
	FROM [GlobalRepository].[error].[ReconAccounts];

		OPEN cur 
		FETCH NEXT FROM cur INTO 
		@recAccountId, 
		@columnName;

		WHILE @@FETCH_STATUS = 0

			BEGIN 
				EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
					@schemaName = 'recon',
					@tableName = 'Accounts', 
					@columnName = @columnName,
					@columnId = @recAccountId,
					@errorMessage = 'Missing attributes'
				FETCH NEXT FROM cur INTO 
					@recAccountId, 
					@columnName;
			END;

		CLOSE cur;
		DEALLOCATE cur;
	COMMIT TRAN insert_error;
END TRY
BEGIN CATCH
	ROLLBACK TRAN upd_error;
	ROLLBACK TRAN insert_error;

	EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Accounts', 
			@columnName = null,
			@columnId = null 
END CATCH