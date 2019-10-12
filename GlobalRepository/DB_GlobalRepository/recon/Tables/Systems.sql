CREATE TABLE [recon].[Systems] (
    [RecSystemId]        INT              IDENTITY (1, 1) NOT NULL,
    [SystemExId]         UNIQUEIDENTIFIER NULL,
    [CompanyName]        NVARCHAR (50)    NULL,
    [Name]               NVARCHAR (50)    NULL,
    [Version]            NVARCHAR (50)    NULL,
    [TechSupportExpDate] DATE             NULL,
    [Status]             CHAR (1)         DEFAULT ('I') NOT NULL,
    [CreationDate]       DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RecSystemId] ASC),
    CHECK ([Status]='P' OR [Status]='I' OR [Status]='E')
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the system provider', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CompanyName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System name', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System version', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E - error, I - inserted, P - processed ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'RecSystemId';


GO
CREATE TRIGGER	[recon].[After_I_ReconSystem_trg]
ON [recon].[Systems]	
AFTER INSERT
AS 
BEGIN TRY
	EXEC [GlobalRepository].[error].[CheckReconSystems]
END TRY
BEGIN CATCH
		EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Systems', 
			@columnName = null,
			@columnId = null 
END CATCH
GO
EXECUTE sp_settriggerorder @triggername = N'[recon].[After_I_ReconSystem_trg]', @order = N'first', @stmttype = N'insert';


GO

create  TRIGGER	[recon].[After_I_MergeSystem_trg]
ON [recon].[Systems]	
AFTER INSERT
AS 
BEGIN TRY
	EXEC [GlobalRepository].recon.MergeReconSystems
END TRY
BEGIN CATCH
		EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Systems', 
			@columnName = null,
			@columnId = null 
END CATCH
GO
EXECUTE sp_settriggerorder @triggername = N'[recon].[After_I_MergeSystem_trg]', @order = N'last', @stmttype = N'insert';

