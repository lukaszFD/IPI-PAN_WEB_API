
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