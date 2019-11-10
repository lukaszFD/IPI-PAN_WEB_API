



CREATE VIEW [web].[AuditServers]
as


SELECT 
	   [ExternalId] AS [ServerExId]
	  ,[UserName]
      ,[DateFrom]
      ,[DateTo]
      ,[NEW_Name]
      ,[OLD_Name]
      ,[NEW_Host]
      ,[OLD_Host]
      ,c1.[CountryRegionCode] AS [NEW_CountryRegionCode]
      ,c2.[CountryRegionCode] AS [OLD_CountryRegionCode]
      ,[NEW_Model]
      ,[OLD_Model]
      ,[NEW_SerialNumber]
      ,[OLD_SerialNumber]
      ,[NEW_TechSupport]
      ,[OLD_TechSupport]
      ,[NEW_WarrantyExpirationDate]
      ,[OLD_WarrantyExpirationDate]
      ,[NEW_CPUType]
      ,[OLD_CPUType]
      ,[NEW_RAM]
      ,[OLD_RAM]
      ,[NEW_HardDisk]
      ,[OLD_HardDisk]
      ,[NEW_UPS]
      ,[OLD_UPS]
      ,[NEW_AntivirusSoftware]
      ,[OLD_AntivirusSoftware]
FROM 
	[audit].[Servers] s 
	LEFT JOIN [repository].[CountryRegion] c1 ON c1.CountryId = s.[NEW_CountryId]
	LEFT JOIN [repository].[CountryRegion] c2 ON c2.CountryId = s.[OLD_CountryId]