-- Disable all the constraint in database
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
GO

-- Reset identity 
DBCC CHECKIDENT ('repository.Accounts', RESEED, 0)
GO

DBCC CHECKIDENT ('repository.Servers', RESEED, 0)
GO

DBCC CHECKIDENT ('repository.Systems', RESEED, 0)
GO


-- Delete data 
DELETE FROM repository.Accounts
GO

DELETE FROM repository.Servers
GO

DELETE FROM repository.Systems
GO



---------------------------------------------------------
----------INSERT INTO repository.Servers----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_repository_Servers

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
           ,replace (replace(@Host,'{0}',RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{1}', RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1))
           ,cast(RIGHT( LEFT('123',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1) as int )
           ,replace (replace (replace (replace(@Model,'{0}',RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{1}', RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{2}', RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)),'{3}',RIGHT( LEFT('0123456789',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1))
           ,CAST(RAND() * 1000000 AS INT)
           ,DATEADD(day,@number,getdate()) 
           ,64
           ,256
           ,RIGHT( LEFT('DS',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)
           ,RIGHT( LEFT('01',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)
           ,RIGHT( LEFT('01',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1)
		   )
    SET @number = @number + 1;
END
COMMIT TRAN INSERT_INTO_repository_Servers
GO
---------------------------------------------------------
----------------------Systems----------------------------
---------------------------------------------------------

---------------------------------------------------------
----------INSERT INTO repository.Systems----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_repository_Systems

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
		   ,DATEADD(day,@number,getdate()) 
		   )
    SET @number = @number + 1;
END
COMMIT TRAN INSERT_INTO_repository_Systems
GO
---------------------------------------------------------
----------------------Systems----------------------------
---------------------------------------------------------

---------------------------------------------------------
----------INSERT INTO repository.Accounts----------------
---------------------------------------------------------
BEGIN TRAN INSERT_INTO_repository_Accounts

DECLARE 
	@number int = 1,
	@CountryId int = 1,
	@Name nvarchar(50) = 'Konto',
	@PasswordExpires datetime = getdate()

WHILE @number <= 237
BEGIN
INSERT INTO repository.Accounts
           (CountryId 
           ,SystemId
           ,ServerId
           ,Name
           ,Type
           ,PasswordExpires)
     VALUES
           (@CountryId + @number
           ,@number
           ,@number
           ,@Name +'_'+ cast(@number AS nvarchar(100))
           ,RIGHT( LEFT('DU',ABS(BINARY_CHECKSUM(NEWID())%35) + 1 ),1) 
           ,DATEADD(day,@number,getdate()) )

    SET @number = @number + 1;
END
COMMIT TRAN INSERT_INTO_repository_Accounts
GO

---------------------------------------------------------
----------------------Accounts---------------------------
---------------------------------------------------------


-- Enable all the constraint in database
EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
GO
