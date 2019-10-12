
CREATE PROCEDURE service.DisableAllConstraints
AS
BEGIN TRY
	EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
END TRY
BEGIN CATCH
	EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'service',
			@tableName = null, 
			@columnName = null,
			@columnId = null 
END CATCH