


CREATE PROCEDURE [recon].[MergeReconSystems]
AS

BEGIN TRY
    BEGIN TRAN merge_recon
		MERGE repository.Systems AS target 
		USING 
		(
		SELECT 
			 s.[SystemExId]
			,s.[CompanyName]
			,s.[Name]
			,s.[Version]
			,s.[TechSupportExpDate]
		FROM 
			[GlobalRepository].[recon].[Systems] AS s 
		WHERE 
			s.STATUS = 'I'
		) AS source ON source.[SystemExId] = target.[ExternalId]
		WHEN MATCHED THEN 
		UPDATE
			SET 
				target.[CompanyName] = source.[CompanyName],
				target.[Name] = source.[Name],
				target.[Version] = source.[Version],
				target.[TechSupportExpDate] = source.[TechSupportExpDate];
	COMMIT TRAN merge_recon;

	BEGIN TRAN upd_recon
			UPDATE a2
			SET a2.STATUS = 'P'
			FROM 
				[repository].[Systems] AS a
				INNER JOIN [recon].[Systems] a2 ON a2.[SystemExId] = a.[ExternalId] 
			WHERE 
				a2.STATUS = 'I'
	COMMIT TRAN upd_recon;
END TRY
BEGIN CATCH

	ROLLBACK TRAN merge_recon;

	ROLLBACK TRAN upd_recon;

	EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Systems', 
			@columnName = null,
			@columnId = null 
END CATCH