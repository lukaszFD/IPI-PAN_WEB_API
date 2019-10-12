

CREATE PROCEDURE [error].[CheckReconSystems]
AS

BEGIN TRY
  	BEGIN TRAN upd_error
		UPDATE a
		SET a.[Status] = 'E'
		FROM 
			[GlobalRepository].[recon].[Systems] a 
		WHERE 
			(
			a.CompanyName IS NULL 
			OR 
			a.Name IS NULL 
			OR
			a.Version IS NULL 
			OR 
			a.TechSupportExpDate IS NULL 
			)
			AND 
			a.[Status] = 'I'
    COMMIT TRAN upd_error;

	BEGIN TRAN insert_error
		DECLARE @recSystemId int
		DECLARE @columnName nvarchar(100)
		DECLARE cur CURSOR 
		FOR
		SELECT 
			s.[RecSystemId],
			s.[ColumnName]
		FROM 
			[GlobalRepository].[error].[ReconSystems] s;

			OPEN cur 
			FETCH NEXT FROM cur INTO 
			@recSystemId, 
			@columnName;

			WHILE @@FETCH_STATUS = 0

				BEGIN 
					EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
						@schemaName = 'recon',
						@tableName = 'Systems', 
						@columnName = @columnName,
						@columnId = @recSystemId,
						@errorMessage = 'Missing attributes'
					FETCH NEXT FROM cur INTO 
						@recSystemId, 
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
			@tableName = 'Systems', 
			@columnName = null,
			@columnId = null 
END CATCH