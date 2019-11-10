

CREATE VIEW [web].[Systems]
as
SELECT [ExternalId] AS [SystemExId]
      ,[CompanyName]
      ,[Name]
      ,[Version]
      ,[TechSupport]
      ,[TechSupportExpDate]
  FROM [repository].[Systems]