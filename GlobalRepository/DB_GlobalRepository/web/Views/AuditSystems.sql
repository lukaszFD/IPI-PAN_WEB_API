


CREATE VIEW [web].[AuditSystems]
as
SELECT [ExternalId] AS [SystemExId]
	  ,[UserName]
      ,[DateFrom]
      ,[DateTo]
      ,[NEW_CompanyName]
      ,[OLD_CompanyName]
      ,[NEW_Name]
      ,[OLD_Name]
      ,[NEW_Version]
      ,[OLD_Version]
      ,[NEW_TechSupport]
      ,[OLD_TechSupport]
      ,[NEW_TechSupportExpDate]
      ,[OLD_TechSupportExpDate]

  FROM [audit].[Systems]
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System ExID on a database.', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - System version', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'OLD_Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'OLD_TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Flag informing that there is support for the system. Default value is false.  ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'OLD_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - System name', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Name of the system provider', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'OLD_CompanyName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - System version', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'NEW_Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'NEW_TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Flag informing that there is support for the system. Default value is false.  ', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'NEW_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - System name', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'NEW_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Name of the system provider', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'NEW_CompanyName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'web', @level1type = N'VIEW', @level1name = N'AuditSystems', @level2type = N'COLUMN', @level2name = N'DateFrom';

