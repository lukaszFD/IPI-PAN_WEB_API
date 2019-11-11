



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
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Warranty expiration date. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Security of the server in elenctic energy. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Technical support for the server. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Serial number of the server', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server model.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server host name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Processor type ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Anti-virus software. default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'OLD_AntivirusSoftware';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Warranty expiration date. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Security of the server in elenctic energy. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Technical support for the server. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Serial number of the server', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server model.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server host name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Processor type ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Anti-virus software. default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'NEW_AntivirusSoftware';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditServers', @level2type = N'COLUMN', @level2name = N'DateFrom';

