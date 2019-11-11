
CREATE VIEW [web].[ReconSystems]
AS

SELECT[SystemExId]
      ,[CompanyName]
      ,[Name]
      ,[Version]
      ,[TechSupportExpDate]
  FROM [recon].[Systems]
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System version', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconSystems', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconSystems', @level2type = N'COLUMN', @level2name = N'TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconSystems', @level2type = N'COLUMN', @level2name = N'SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System name', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconSystems', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the system provider', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'ReconSystems', @level2type = N'COLUMN', @level2name = N'CompanyName';

