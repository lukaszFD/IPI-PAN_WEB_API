


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