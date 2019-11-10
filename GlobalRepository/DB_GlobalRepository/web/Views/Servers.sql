CREATE VIEW web.Servers
AS

SELECT s.[ExternalId] AS [ServerExId]
      ,s.[Name]
      ,s.[Host]
      ,c.[CountryRegionCode]
      ,s.[Model]
      ,s.[SerialNumber]
      ,s.[TechSupport]
      ,s.[WarrantyExpirationDate]
      ,s.[CPUType]
      ,s.[RAM]
      ,s.[HardDisk]
      ,s.[UPS]
      ,s.[AntivirusSoftware]
FROM 
	[repository].[Servers] s
	LEFT JOIN [repository].[CountryRegion] c ON s.CountryId = c.CountryId