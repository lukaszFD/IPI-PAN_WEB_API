CREATE TABLE [recon].[Servers] (
    [RecServerId]            INT              IDENTITY (1, 1) NOT NULL,
    [ServerExId]             UNIQUEIDENTIFIER NULL,
    [Name]                   NVARCHAR (50)    NULL,
    [Host]                   NVARCHAR (50)    NULL,
    [CountryRegionCode]      NVARCHAR (2)     NULL,
    [Model]                  NVARCHAR (50)    NULL,
    [SerialNumber]           INT              NULL,
    [TechSupport]            CHAR (1)         NULL,
    [WarrantyExpirationDate] DATE             NULL,
    [CPUType]                SMALLINT         NULL,
    [RAM]                    SMALLINT         NULL,
    [HardDisk]               CHAR (1)         NULL,
    [UPS]                    CHAR (1)         NULL,
    [AntivirusSoftware]      CHAR (1)         NULL,
    [Status]                 CHAR (1)         DEFAULT ('I') NOT NULL,
    [CreationDate]           DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RecServerId] ASC),
    CHECK ([Status]='P' OR [Status]='I' OR [Status]='E')
);














GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server name.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server host name.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account location - country code.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number of the server', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Technical support for the server.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warranty expiration date.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processor type.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Security of the server in elenctic energy.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Anti-virus software.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'AntivirusSoftware';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E - error, I - inserted, P - processed ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server model.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Model';


GO

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'RecServerId';


GO




CREATE TRIGGER	[recon].[After_I_ReconServer_trg]
ON [recon].[Servers]	
AFTER INSERT
AS 
BEGIN TRY
	EXEC [GlobalRepository].[error].[CheckReconServers]
END TRY
BEGIN CATCH
		EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Servers', 
			@columnName = null,
			@columnId = null 
END CATCH
GO
EXECUTE sp_settriggerorder @triggername = N'[recon].[After_I_ReconServer_trg]', @order = N'first', @stmttype = N'insert';


GO

create  TRIGGER	[recon].[After_I_MergeServer_trg]
ON [recon].[Servers]	
AFTER INSERT
AS 
BEGIN TRY
	EXEC [GlobalRepository].recon.MergeReconServers
END TRY
BEGIN CATCH
		EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Servers', 
			@columnName = null,
			@columnId = null 
END CATCH
GO
EXECUTE sp_settriggerorder @triggername = N'[recon].[After_I_MergeServer_trg]', @order = N'last', @stmttype = N'insert';

