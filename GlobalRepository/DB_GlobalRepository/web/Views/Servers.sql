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
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warranty expiration date. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Security of the server in elenctic energy. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Technical support for the server. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number of the server', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server model.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server host name.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processor type ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server location - country code.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Anti-virus software. default value is false. ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'AntivirusSoftware';

