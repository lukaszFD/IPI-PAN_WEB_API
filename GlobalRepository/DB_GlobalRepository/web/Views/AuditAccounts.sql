




CREATE VIEW [web].[AuditAccounts]
AS
SELECT 
	   a.[ExternalId] AS [AccountExId]
      ,a.[UserName]
      ,a.[DateFrom]
      ,a.[DateTo]
      ,c1.[CountryRegionCode] AS [NEW_CountryRegionCode]
      ,c2.[CountryRegionCode] AS [OLD_CountryRegionCode]
      ,a.[NEW_UserId]
      ,a.[OLD_UserId]
      ,sy1.[ExternalId] AS [NEW_SystemExId]
      ,sy2.[ExternalId] AS [OLD_SystemExId]
      ,s1.[ExternalId] AS [NEW_ServerExId]
      ,s2.[ExternalId] AS [OLD_ServerExId]
      ,a.[NEW_Name]
      ,a.[OLD_Name]
      ,a.[NEW_Description]
      ,a.[OLD_Description]
      ,a.[NEW_Type]
      ,a.[OLD_Type]
      ,a.[NEW_PasswordExpires]
      ,a.[OLD_PasswordExpires]
      ,a.[NEW_Tofix]
      ,a.[OLD_Tofix]
FROM 
	[audit].[Accounts] a
	LEFT JOIN [repository].[CountryRegion] c1 ON c1.CountryId = a.[NEW_CountryId]
	LEFT JOIN [repository].[CountryRegion] c2 ON c2.CountryId = a.[OLD_CountryId]
	LEFT JOIN [repository].[Servers] s1 ON a.[NEW_ServerId] = s1.ServerId
	LEFT JOIN [repository].[Servers] s2 ON a.[OLD_ServerId] = s2.ServerId
	LEFT JOIN [repository].[Systems] sy1 ON a.[NEW_SystemId] = sy1.SystemId
	LEFT JOIN [repository].[Systems] sy2 ON a.[OLD_SystemId] = sy2.SystemId
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - User ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Flag indicating Accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Account name. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Account location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - User ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Flag indicating Accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - System ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Account name. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Account location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'NEW_CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'DateFrom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication .', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'AccountExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - System ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditAccounts', @level2type = N'COLUMN', @level2name = N'OLD_SystemExId';

