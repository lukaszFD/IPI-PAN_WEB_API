-- Disable all the constraint in database
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
GO 

-- Reset identity 
PRINT 'Start Reset identity'
GO

DBCC CHECKIDENT ('gr_user.Users', RESEED, 0)
GO

DBCC CHECKIDENT ('repository.CountryRegion', RESEED, 0)
GO

DBCC CHECKIDENT ('error.ErrorMessages', RESEED, 0)
GO

DBCC CHECKIDENT ('repository.Accounts', RESEED, 0)
GO

DBCC CHECKIDENT ('repository.Servers', RESEED, 0)
GO

DBCC CHECKIDENT ('repository.Systems', RESEED, 0)
GO

DBCC CHECKIDENT ('recon.Accounts', RESEED, 0)
GO

DBCC CHECKIDENT ('recon.Servers', RESEED, 0)
GO

DBCC CHECKIDENT ('recon.Systems', RESEED, 0)
GO

DBCC CHECKIDENT ('audit.Accounts', RESEED, 0)
GO

DBCC CHECKIDENT ('audit.Servers', RESEED, 0)
GO

DBCC CHECKIDENT ('audit.Systems', RESEED, 0)
GO

PRINT 'Stop Reset identity'
GO

-- Delete data 
PRINT 'Start Delete data'
GO

DELETE FROM gr_user.Users
GO

DELETE FROM repository.CountryRegion
GO

DELETE FROM error.ErrorMessages
GO

DELETE FROM repository.Accounts
GO

DELETE FROM repository.Servers
GO

DELETE FROM repository.Systems
GO

DELETE FROM recon.Accounts
GO

DELETE FROM recon.Servers
GO

DELETE FROM recon.Systems
GO

DELETE FROM audit.Accounts
GO

DELETE FROM audit.Servers
GO

DELETE FROM audit.Systems
GO

PRINT 'Stop Delete data'
GO
---------------------------------------------------------
----------INSERT INTO gr_user.Users----------------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_gr_user_Users
PRINT 'Start INSERT_INTO_gr_user_Users'

INSERT INTO gr_user.Users
           (ExternalId
           ,Description
           ,Username
           ,Password
           ,Type)
     VALUES
           (NEWID()
           ,'admin'
           ,'admin'
           ,EncryptByPassPhrase('GR','admin')
           ,'A')

INSERT INTO gr_user.Users
           (ExternalId
           ,Description
           ,Username
           ,Password
           ,Type)
     VALUES
           (NEWID()
           ,'lukasz'
           ,'lukasz'
           ,EncryptByPassPhrase('GR','test')
           ,'N')

PRINT 'Stop INSERT_INTO_gr_user_Users'
COMMIT TRAN INSERT_INTO_gr_user_Users
---------------------------------------------------------
----------INSERT INTO repository.CountryRegion-----------
---------------------------------------------------------

BEGIN TRAN INSERT_INTO_CountryRegion
PRINT 'Start INSERT_INTO_repository_CountryRegion'

INSERT INTO [repository].[CountryRegion] ([CountryRegionCode],[Name])

SELECT 
	[CountryRegionCode]
   ,[Name]
FROM 
	[AdventureWorks2017].[Person].[CountryRegion]

PRINT 'Stop INSERT_INTO_repository_CountryRegion'
COMMIT TRAN INSERT_INTO_CountryRegion
GO

---------------------------------------------------------
----------INSERT INTO repository.Servers----------------
---------------------------------------------------------

BEGIN TRAN INSERT_INTO_repository_Servers
PRINT 'Start INSERT_INTO_repository_Servers'
DECLARE 

@number int = 1,
@Name nvarchar(50) = 'Server_{0}',
@Host nvarchar(50) = 'GR.{0}.{1}.net',
@Model nvarchar(50) = '{0}.{1}.{2}.{3}',
@SerialNumber int

WHILE @number <= 237
BEGIN
INSERT INTO repository.Servers
           (
		    Name
           ,Host
           ,CountryId
           ,Model
           ,SerialNumber
           ,WarrantyExpirationDate
           ,CPUType
           ,RAM
           ,HardDisk
           ,UPS
           ,AntivirusSoftware)
     VALUES
           (replace(@Name,'{0}', cast(@number AS nvarchar(50)))
           ,replace (replace(@Host,'{0}',RIGHT( LEFT('6027893415',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{1}', RIGHT( LEFT('6893027415',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1))
           ,FLOOR(RAND()*(200-0+1))+10
           ,replace (replace (replace (replace(@Model,'{0}',RIGHT( LEFT('6893027415',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{1}', RIGHT( LEFT('6893027415',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{2}', RIGHT( LEFT('6893027415',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{3}',RIGHT( LEFT('6893027415',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1))
           ,CAST(RAND() * 1000000 AS INT)
           ,DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 1650), '2018-01-01')
           ,64
           ,256
           ,RIGHT( LEFT('DS',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)
           ,RIGHT( LEFT('01',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)
           ,RIGHT( LEFT('01',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)
		   )
    SET @number = @number + 1;
END
PRINT 'Stop INSERT_INTO_repository_Servers'
COMMIT TRAN INSERT_INTO_repository_Servers
GO

---------------------------------------------------------
----------INSERT INTO repository.Systems----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_repository_Systems
PRINT 'Start INSERT_INTO_repository_Systems'
DECLARE 

@number int = 1,
@Name nvarchar(50) = 'System_{0}',
@Version nvarchar(50) = '{0}.{1}.{2}.{3}'

WHILE @number <= 237
BEGIN
INSERT INTO repository.Systems
           (CompanyName
           ,Name
           ,Version
           ,TechSupportExpDate)
     VALUES
           (CASE WHEN RIGHT( LEFT('123',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1) = '1' then 'Microsoft' WHEN RIGHT( LEFT('123',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1) = '2' then 'Oracle' ELSE 'IBM' end
		   ,replace(@Name,'{0}', cast(@number AS nvarchar(50)))
           ,replace (replace (replace (replace(@Version,'{0}',RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{1}', RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{2}', RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{3}',RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1))
		   ,DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 1650), '2018-01-01')
		   )
    SET @number = @number + 1;
END
PRINT 'Stop INSERT_INTO_repository_Systems'
COMMIT TRAN INSERT_INTO_repository_Systems
GO

---------------------------------------------------------
----------INSERT INTO repository.Accounts----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_repository_Accounts
PRINT 'Start INSERT_INTO_repository_Accounts'
DECLARE 
	@number int = 1,
	@Name nvarchar(50) = 'Konto',
	@PasswordExpires datetime = getdate()

WHILE @number <= 237
BEGIN
INSERT INTO repository.Accounts
           (CountryId 
		   ,UserId
           ,SystemId
           ,ServerId
           ,Name
           ,Type)
     VALUES
           (FLOOR(RAND()*(200-0+1))+10 
		   ,2
           ,@number
           ,@number
           ,@Name +'_'+ cast(@number AS nvarchar(100))
           ,RIGHT( LEFT('DU',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1))

    SET @number = @number + 1;
END
PRINT 'Stop INSERT_INTO_repository_Accounts'
COMMIT TRAN INSERT_INTO_repository_Accounts
GO


---------------------------------------------------------
--------------INSERT INTO recon.Servers------------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_recon_Servers
PRINT 'Start INSERT_INTO_recon_Servers'
DECLARE 

@number int = 1

WHILE @number <= 100
BEGIN
	INSERT INTO  recon.Servers 
	(
		 ServerExId
		,Name
		,Host
		,CountryRegionCode
		,Model
		,SerialNumber
		,WarrantyExpirationDate
		,CPUType
        ,RAM
		,HardDisk
		,UPS
		,AntivirusSoftware
	)

	SELECT TOP (10) 
		 s.ExternalId
		,case 
			when s.Name like '%7%' then null
			else s.Name
			end as Name
		,s.Host
		,(select cr.CountryRegionCode from repository.CountryRegion cr WHERE cr.CountryId = FLOOR(RAND()*(s.ServerId-0+10))+10) AS CountryRegionCode
		,s.Model
		,s.SerialNumber
		,case 
			when s.WarrantyExpirationDate < getdate()
			THEN DATEADD(DAY,10,s.WarrantyExpirationDate)
			ELSE s.WarrantyExpirationDate
			END AS WarrantyExpirationDate
		,s.CPUType
        ,s.RAM
		,case 
			when s.Name like '%1%' then null
			else s.HardDisk
			end as HardDisk
		,s.UPS
		,s.AntivirusSoftware
	FROM 
		repository.Servers s
	ORDER BY NEWID()

    SET @number = @number + 1;
END
PRINT 'Stop INSERT_INTO_recon_Servers'
COMMIT TRAN INSERT_INTO_recon_Servers
GO

---------------------------------------------------------
----------------INSERT INTO recon.Systems----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_recon_Systems
PRINT 'Start INSERT_INTO_recon_Systems'
DECLARE 

@number int = 1

WHILE @number <= 100
BEGIN
INSERT INTO recon.Systems
           (
		    SystemExId
		   ,CompanyName
           ,Name
           ,Version
           ,TechSupportExpDate)
	 SELECT TOP (10) 
		 ExternalId
		,case 
			when Name like '%8%' then null
			else CompanyName
			end as CompanyName
		,Name
		,Version
		,case 
			when TechSupportExpDate < getdate()
			THEN DATEADD(DAY,10,TechSupportExpDate)
			ELSE TechSupportExpDate
			END AS TechSupportExpDate
	FROM 
		repository.Systems
	ORDER BY NEWID()

    SET @number = @number + 1;
END
PRINT 'Stop INSERT_INTO_recon_Systems'
COMMIT TRAN INSERT_INTO_recon_Systems
GO

---------------------------------------------------------
----------INSERT INTO recon.Accounts----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_recon_Accounts
PRINT 'Start INSERT_INTO_recon_Accounts'
DECLARE 
	@number int = 1,
	@Name nvarchar(50) = 'Konto',
	@PasswordExpires datetime = getdate()

WHILE @number <= 100
BEGIN
INSERT INTO recon.Accounts
           (AccountExId
		   ,CountryRegionCode 
		   ,SystemExId
		   ,ServerExId
           ,Name
		   ,Description
           ,Type)

		   SELECT TOP (10)
			 a.ExternalId
			,(select cr.CountryRegionCode from repository.CountryRegion cr WHERE cr.CountryId = FLOOR(RAND()*(a.AccountId-0+10))+10) AS CountryRegionCode
			,s2.ExternalId AS SystemExId
			,s.ExternalId AS ServerExId
			,case 
				when a.Name LIKE '%1%' THEN NULL
				ELSE a.Name 
				END AS Name
			,case 
				when a.Name LIKE '%5%' THEN 'Test'
				ELSE Description
				END AS Description
			,Type
		FROM 
			repository.Accounts a
			LEFT JOIN repository.Servers s ON s.ServerId = a.ServerId
			LEFT JOIN repository.Systems s2 ON s2.SystemId = a.SystemId
		ORDER BY NEWID()

    SET @number = @number + 1;
END
PRINT 'Stop INSERT_INTO_recon_Accounts'
COMMIT TRAN INSERT_INTO_recon_Accounts
GO

-- Enable all the constraint in database
EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
GO