CREATE VIEW web.ReconAccounts
AS

SELECT
	 [AccountExId]
    ,[CountryRegionCode]
    ,[UserExId]
    ,[SystemExId]
    ,[ServerExId]
    ,[Name]
    ,[Description]
    ,[Type]
    ,[PasswordExpires]
FROM 
	[recon].[Accounts]