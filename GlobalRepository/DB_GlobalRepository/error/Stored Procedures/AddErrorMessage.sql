


create PROCEDURE [error].[AddErrorMessage] 

	@tableName [nvarchar](100),
	@columnName [nvarchar](100)
AS

INSERT INTO error.ErrorMessages
(
	[UserName],
	[TableName],
	[ColumnName],
	[ErrorNumber],
	[ErrorState],
	[ErrorSeverity],
	[ErrorLine],
	[ErrorMessage]
)
VALUES
(
	stuff(suser_sname(), 1, charindex('\', suser_sname()), ''),
	@tableName,
	@columnName,
	ERROR_NUMBER(),
	ERROR_STATE(),
	ERROR_SEVERITY(),
	ERROR_LINE(),
	ERROR_MESSAGE()
	);