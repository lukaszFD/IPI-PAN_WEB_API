

create PROCEDURE [error].[AddErrorMessage] 
    @schemaName [nvarchar](100) = null,
	@tableName [nvarchar](100) = null,
	@columnName [nvarchar](100) = null,
	@columnId int = null,
	@errorMessage [nvarchar](100) = null
AS

INSERT INTO error.ErrorMessages
(
	[UserName],
	[SchemaName],
	[TableName],
	[ColumnName],
	[ColumnId],
	[ErrorNumber],
	[ErrorState],
	[ErrorSeverity],
	[ErrorLine],
	[ErrorMessage]
)
VALUES
(
	stuff(suser_sname(), 1, charindex('\', suser_sname()), ''),
	@schemaName,
	@tableName,
	@columnName,
	@columnId,
	ERROR_NUMBER(),
	ERROR_STATE(),
	ERROR_SEVERITY(),
	ERROR_LINE(),
	isnull(ERROR_MESSAGE(),@errorMessage)
	);