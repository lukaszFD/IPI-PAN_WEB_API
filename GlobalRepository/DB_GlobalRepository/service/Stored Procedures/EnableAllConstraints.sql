
CREATE PROCEDURE service.EnableAllConstraints
AS
BEGIN TRY
	EXEC sp_MSforeachtable @command1="print '?'", @command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
END TRY
BEGIN CATCH
	EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'service',
			@tableName = null, 
			@columnName = null,
			@columnId = null 
END CATCH