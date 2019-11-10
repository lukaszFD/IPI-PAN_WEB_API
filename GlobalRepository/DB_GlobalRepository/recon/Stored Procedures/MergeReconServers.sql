


CREATE PROCEDURE [recon].[MergeReconServers]
AS

BEGIN TRY
    BEGIN TRAN merge_recon
		MERGE repository.Servers AS target 
		USING 
		(
		SELECT 
			 s.[ServerExId]
			,s.[Name]
			,s.[Host]
			,cr.[CountryId]
			,s.[Model]
			,s.[SerialNumber]
			,s.[WarrantyExpirationDate]
			,s.[CPUType]
			,s.[RAM]
			,s.[HardDisk]
			,s.[UPS]
			,s.[AntivirusSoftware]
			,s.[RecServerId]
		FROM 
			[recon].[Servers] AS s 
			LEFT JOIN repository.CountryRegion cr ON s.CountryRegionCode = cr.CountryRegionCode
		WHERE 
			s.STATUS = 'I'
		) AS source ON source.[ServerExId] = target.[ExternalId]
		WHEN MATCHED THEN 
		UPDATE
			SET 
				target.[Name] = source.[Name],
				target.[Host] = source.[Host],
				target.[CountryId] = source.[CountryId],
				target.[Model] = source.[Model],
				target.[SerialNumber] = source.[SerialNumber],
				target.[WarrantyExpirationDate] = source.[WarrantyExpirationDate],
				target.[CPUType] = source.[CPUType],
				target.[RAM] = source.[RAM],
				target.[HardDisk] = source.[HardDisk],
				target.[UPS] = source.[UPS],
				target.[AntivirusSoftware] = source.[AntivirusSoftware],
				target.[RecServerId] = source.[RecServerId];
	COMMIT TRAN merge_recon;

	BEGIN TRAN upd_recon
			UPDATE a2
			SET a2.STATUS = 'P'
			FROM 
				[repository].[Servers] AS a
				INNER JOIN [recon].[Servers] a2 ON a2.[ServerExId] = a.[ExternalId] 
			WHERE 
				a2.STATUS = 'I'
	COMMIT TRAN upd_recon;
END TRY
BEGIN CATCH

	ROLLBACK TRAN merge_recon;

	ROLLBACK TRAN upd_recon;

	EXECUTE [error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Servers', 
			@columnName = null,
			@columnId = null 
END CATCH