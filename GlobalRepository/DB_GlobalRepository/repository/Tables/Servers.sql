CREATE TABLE [repository].[Servers] (
    [ServerId]               INT           IDENTITY (1, 1) NOT NULL,
    [Name]                   NVARCHAR (50) NOT NULL,
    [Host]                   NVARCHAR (50) NOT NULL,
    [CountryId]              INT           NOT NULL,
    [Model]                  NVARCHAR (50) NOT NULL,
    [SerialNumber]           INT           NOT NULL,
    [TechSupport]            CHAR (1)      DEFAULT ((0)) NOT NULL,
    [WarrantyExpirationDate] DATE          NOT NULL,
    [CPUType]                SMALLINT      NULL,
    [RAM]                    SMALLINT      NULL,
    [HardDisk]               CHAR (1)      NOT NULL,
    [UPS]                    CHAR (1)      DEFAULT ((0)) NOT NULL,
    [AntivirusSoftware]      CHAR (1)      DEFAULT ((0)) NOT NULL,
    [CreationDate]           DATETIME      DEFAULT (getdate()) NOT NULL,
    [EditDate]               DATETIME      NULL,
    [DeleteDate]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ServerId] ASC),
    CHECK ([AntivirusSoftware]=(0) OR [AntivirusSoftware]=(1)),
    CHECK ([HardDisk]='D' OR [HardDisk]='S'),
    CHECK ([TechSupport]=(0) OR [TechSupport]=(1)),
    CHECK ([UPS]=(0) OR [UPS]=(1)),
    FOREIGN KEY ([CountryId]) REFERENCES [repository].[CountryRegion] ([CountryId])
);






GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warranty expiration date. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Security of the server in elenctic energy. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Technical support for the server. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The server ID of the database. In relation to [GlobalRepository].[repository].[Accounts].[ServerId].', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number of the server', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server name.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server host name.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of editing the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'DeleteDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processor type ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Anti-virus software. default value is false. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'AntivirusSoftware';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server location - country id. In relation to [GlobalRepository].[repository].[CountryRegion].[CountryId].[CountryId].', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'CountryId';


GO



CREATE TRIGGER [repository].[After_U_Servers_trg]
ON [repository].[Servers]
AFTER UPDATE
AS 
BEGIN
SET NOCOUNT ON;

	UPDATE a
	SET a.EditDate = getdate()
	FROM 
		[repository].[Servers] a 
		JOIN inserted i ON i.[ServerId] = a.[ServerId]
END