





CREATE VIEW	[error].[ReconSystems]
as

WITH 
cte_err AS
(
SELECT DISTINCT 
	e.ColumnId
FROM 
	[error].[ErrorMessages] e
WHERE 
	e.TableName = 'Systems'
	AND 
	e.SchemaName = 'recon'
)
,cte_name AS
(
SELECT 
	a.RecSystemId,
	case when a.Name IS NULL THEN 'Name' END AS 'ColumnName'
FROM 
	[recon].[Systems] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecSystemId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_company AS
(
SELECT 
	a.RecSystemId,
	case when a.CompanyName IS NULL THEN 'CompanyName' END AS 'ColumnName'
FROM 
	[recon].[Systems] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecSystemId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_version AS
(
SELECT 
	a.RecSystemId,
	case when a.Version IS NULL THEN 'Version' END AS 'ColumnName'
FROM 
	[recon].[Systems] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecSystemId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_techSup AS
(
SELECT 
	a.RecSystemId,
	case when a.TechSupport IS NULL THEN 'TechSupport' END AS 'ColumnName'
FROM 
	[recon].[Systems] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecSystemId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_techSupEx AS
(
SELECT 
	a.RecSystemId,
	case when a.TechSupportExpDate IS NULL THEN 'TechSupportExpDate' END AS 'ColumnName'
FROM 
	[recon].[Systems] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecSystemId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)

SELECT * FROM cte_company cc WHERE cc.ColumnName IS NOT NULL 
UNION ALL
SELECT * FROM cte_name cn WHERE cn.ColumnName IS NOT NULL 
UNION ALL
SELECT * FROM cte_techSup cts WHERE cts.ColumnName IS NOT NULL 
UNION all
SELECT * FROM cte_techSupEx ctse WHERE ctse.ColumnName IS NOT NULL 
UNION all
SELECT * FROM cte_version cv WHERE cv.ColumnName IS NOT NULL