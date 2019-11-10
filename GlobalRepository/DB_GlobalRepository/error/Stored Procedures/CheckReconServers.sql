

CREATE PROCEDURE [error].[CheckReconServers]
AS

BEGIN TRY
  	BEGIN TRAN upd_error
		UPDATE a
		SET a.[Status] = 'E'
		FROM 
			[recon].[Servers] a 
		WHERE 
			(
			a.CountryRegionCode IS NULL 
			OR 
			a.Name IS NULL 
			OR
			a.Host IS NULL 
			OR
			a.Model IS NULL 
			OR 
			a.SerialNumber IS NULL 
			OR 
			a.WarrantyExpirationDate IS NULL 
			OR 
			a.HardDisk IS NULL 
			OR 
			a.UPS IS NULL 
			OR 
			a.AntivirusSoftware IS NULL 
			)
			AND 
			a.[Status] = 'I'
    COMMIT TRAN upd_error;

	BEGIN TRAN insert_error
		DECLARE @recServerId int
		DECLARE @columnName nvarchar(100)
		DECLARE cur CURSOR 
		FOR
		SELECT 
			s.[RecServerId],
			s.[ColumnName]
		FROM 
			[error].[ReconServers] s;

			OPEN cur 
			FETCH NEXT FROM cur INTO 
			@recServerId, 
			@columnName;

			WHILE @@FETCH_STATUS = 0

				BEGIN 
					EXECUTE [error].[AddErrorMessage] 
						@schemaName = 'recon',
						@tableName = 'Servers', 
						@columnName = @columnName,
						@columnId = @recServerId,
						@errorMessage = 'Missing attributes'
					FETCH NEXT FROM cur INTO 
						@recServerId, 
						@columnName;
				END;

			CLOSE cur;
			DEALLOCATE cur;
	COMMIT TRAN insert_error;
END TRY
BEGIN CATCH
	ROLLBACK TRAN upd_error;
	ROLLBACK TRAN insert_error;

	EXECUTE [error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Servers', 
			@columnName = null,
			@columnId = null 
END CATCH