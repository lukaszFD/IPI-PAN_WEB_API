
CREATE VIEW [web].[Accounts]
AS

SELECT 
       a.[ExternalId] AS [AccountExId]
      ,c.[CountryRegionCode]
      ,a.[UserId]
      ,sy.[ExternalId] AS [SystemExId]
      ,s.[ExternalId] AS [ServerExId]
      ,a.[Name]
      ,a.[Description]
      ,a.[Type]
      ,a.[PasswordExpires]
      ,a.[Tofix]
FROM 
	[repository].[Accounts] a
	LEFT JOIN [repository].[CountryRegion] c ON c.CountryId = a.CountryId
	LEFT JOIN [repository].[Servers] s ON a.ServerId = s.ServerId
	LEFT JOIN [repository].[Systems] sy ON a.SystemId = sy.SystemId
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account name. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'AccountExId';

