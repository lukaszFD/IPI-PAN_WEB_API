﻿
CREATE FUNCTION repository.CheckDate 
(
	@Param1 datetime
)
RETURNS int
AS

BEGIN
DECLARE @return_val int = null
	IF @Param1 < getdate()
		begin 
		SELECT @return_val = 1
		END 
	ELSE 
	    begin 
		SELECT @return_val = 0
		END 
	RETURN @return_val;
END