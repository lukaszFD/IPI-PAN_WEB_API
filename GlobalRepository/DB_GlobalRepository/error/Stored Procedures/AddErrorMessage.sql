create PROCEDURE error.AddErrorMessage 
AS

INSERT INTO error.ErrorMessages
(
	[UserName],
	[ErrorNumber],
	[ErrorState],
	[ErrorSeverity],
	[ErrorLine],
	[ErrorProcedure],
	[ErrorMessage]
)
VALUES
(
	SUSER_SNAME(),
	ERROR_NUMBER(),
	ERROR_STATE(),
	ERROR_SEVERITY(),
	ERROR_LINE(),
	ERROR_PROCEDURE(),
	ERROR_MESSAGE()
	)