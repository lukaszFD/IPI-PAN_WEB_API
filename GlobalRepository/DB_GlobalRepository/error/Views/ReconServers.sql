
CREATE VIEW	[error].[ReconServers]
as

WITH 
cte_err AS
(
SELECT DISTINCT 
	e.ColumnId
FROM 
	[error].[ErrorMessages] e
WHERE 
	e.TableName = 'Servers'
	AND 
	e.SchemaName = 'recon'
)
,cte_country AS
(
SELECT 
	a.RecServerId,
	case when a.CountryRegionCode IS NULL THEN 'CountryRegionCode' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_name AS
(
SELECT 
	a.RecServerId,
	case when a.Name IS NULL THEN 'Name' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_host AS
(
SELECT 
	a.RecServerId,
	case when a.Host IS NULL THEN 'Host' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_model AS
(
SELECT 
	a.RecServerId,
	case when a.Model IS NULL THEN 'Model' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_serial AS
(
SELECT 
	a.RecServerId,
	case when a.SerialNumber IS NULL THEN 'SerialNumber' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_warEx AS
(
SELECT 
	a.RecServerId,
	case when a.WarrantyExpirationDate IS NULL THEN 'WarrantyExpirationDate' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_hdd AS
(
SELECT 
	a.RecServerId,
	case when a.HardDisk IS NULL THEN 'HardDisk' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_ups AS
(
SELECT 
	a.RecServerId,
	case when a.UPS IS NULL THEN 'UPS' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_virus AS
(
SELECT 
	a.RecServerId,
	case when a.AntivirusSoftware IS NULL THEN 'AntivirusSoftware' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_serv AS
(
SELECT 
	a.RecServerId,
	case when a.ServerExId IS NULL THEN 'ServerExId' END AS 'ColumnName'
FROM 
	[recon].[Servers] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecServerId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)

SELECT	* FROM cte_country cc WHERE cc.ColumnName is NOT null 
union all 
SELECT * FROM cte_hdd ch WHERE ch.ColumnName IS NOT NULL
UNION ALL 
SELECT * FROM cte_host ch WHERE ch.ColumnName	IS NOT NULL 
UNION ALL 
SELECT * FROM cte_model cm WHERE cm.ColumnName IS NOT NULL 
UNION ALL 
SELECT * FROM cte_name cn WHERE cn.ColumnName IS NOT NULL 
UNION ALL 
SELECT * FROM cte_serial cs WHERE cs.ColumnName IS NOT NULL 
UNION ALL 
SELECT * FROM cte_ups cu WHERE cu.ColumnName IS NOT NULL 
UNION ALL 
SELECT * FROM cte_virus cv WHERE cv.ColumnName IS NOT NULL 
UNION ALL 
SELECT* FROM cte_warEx cwe WHERE cwe.ColumnName IS NOT NULL 
UNION ALL 
SELECT* FROM cte_serv s WHERE s.ColumnName IS NOT NULL