



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
      ,sy2.[ExternalId] AS [OLDSystemExId]
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