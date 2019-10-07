

CREATE VIEW	[error].[ReconAccounts]
as

WITH 
cte_err AS
(
SELECT DISTINCT 
	e.ColumnId
FROM 
	[error].[ErrorMessages] e
WHERE 
	e.TableName = 'Accounts'
	AND 
	e.SchemaName = 'recon'
)
,cte_country AS
(
SELECT 
	a.RecAccountId,
	case when a.CountryRegionCode IS NULL THEN 'CountryRegionCode' END AS 'ColumnName'
FROM 
	[recon].[Accounts] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecAccountId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_name AS
(
SELECT 
	a.RecAccountId,
	case when a.Name IS NULL THEN 'Name' END AS 'ColumnName'
FROM 
	[recon].[Accounts] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecAccountId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_type AS
(
SELECT 
	a.RecAccountId,
	case when a.Type IS NULL THEN 'Type' END AS 'ColumnName'
FROM 
	[recon].[Accounts] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecAccountId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
,cte_account AS
(
SELECT 
	a.RecAccountId,
	case when a.AccountExId IS NULL THEN 'AccountExId' END AS 'ColumnName'
FROM 
	[recon].[Accounts] a
	LEFT JOIN cte_err e ON (e.ColumnId = a.RecAccountId) 
WHERE 
	a.STATUS = 'E'
	AND 
	e.ColumnId IS NULL 
)
SELECT	* FROM cte_country cc WHERE cc.ColumnName is NOT null 
union all 
SELECT	* FROM cte_name cn WHERE cn.ColumnName is NOT null 
union all 
SELECT	* FROM cte_type c WHERE c.ColumnName is NOT null 
union all 
SELECT	* FROM cte_account a WHERE a.ColumnName is NOT null