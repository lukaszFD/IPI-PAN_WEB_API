
CREATE PROCEDURE [recon].[MergeReconAccounts]
AS

BEGIN TRY
    BEGIN TRAN merge_recon
		MERGE repository.Accounts AS target 
		USING 
		(
		SELECT 
			 a.[AccountExId]
			,cr.CountryId
			,u.UserId
			,s.SystemId
			,s2.ServerId
			,a.[Name]
			,a.[Description]
			,a.[Type]
			,a.[PasswordExpires]
			,a.RecAccountId
		FROM 
			[recon].[Accounts] AS a 
			LEFT JOIN repository.CountryRegion cr ON a.CountryRegionCode = cr.CountryRegionCode
			LEFT JOIN gr_user.Users u ON u.ExternalId = a.UserExId
			LEFT JOIN repository.Systems s ON s.ExternalId = a.SystemExId
			LEFT JOIN repository.Servers s2 ON s2.ExternalId = a.ServerExId
		WHERE 
			a.STATUS = 'I'
		) AS source ON source.AccountExId = target.ExternalId
		WHEN MATCHED THEN 
		UPDATE
			SET 
				target.CountryId = source.CountryId,
				target.UserId = source.userid,
				target.SystemId = source.SystemId,
				target.ServerId = source.ServerId,
				target.Name = source.Name,
				target.Description = source.Description,
				target.Type = source.Type,
				target.PasswordExpires = source.PasswordExpires,
				target.RecAccountId = source.RecAccountId;
	COMMIT TRAN merge_recon;

	BEGIN TRAN upd_recon
			UPDATE a2
			SET a2.STATUS = 'P'
			FROM 
				[repository].[Accounts] AS a
				INNER JOIN recon.Accounts a2 ON a2.RecAccountId = a.RecAccountId 
			WHERE 
				a2.STATUS = 'I'
	COMMIT TRAN upd_recon;
END TRY
BEGIN CATCH

	ROLLBACK TRAN merge_recon;

	ROLLBACK TRAN upd_recon;

	EXECUTE [error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Accounts', 
			@columnName = null,
			@columnId = null 
END CATCH