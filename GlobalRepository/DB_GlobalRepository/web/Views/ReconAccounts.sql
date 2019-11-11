
CREATE VIEW [web].[ReconAccounts]
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
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'UserExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account type. U - user account, D - database account.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the account.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconAccounts', @level2type = N'COLUMN', @level2name = N'AccountExId';

