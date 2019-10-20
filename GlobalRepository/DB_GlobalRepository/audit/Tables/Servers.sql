CREATE TABLE [audit].[Servers] (
    [AudID]                      INT              IDENTITY (1, 1) NOT NULL primary key,
    [UserName]                   NVARCHAR (100)   DEFAULT (stuff(suser_sname(),(1),charindex('\',suser_sname()),'')) NULL,
    [DateFrom]                   DATETIME         NOT NULL,
    [DateTo]                     DATETIME         DEFAULT (getdate()) NULL,
    [ExternalId]                 UNIQUEIDENTIFIER NOT NULL,
    [ServerId]                   INT              NOT NULL,
    [NEW_Name]                   NVARCHAR (50)    NULL,
    [OLD_Name]                   NVARCHAR (50)    NULL,
    [NEW_Host]                   NVARCHAR (50)    NULL,
    [OLD_Host]                   NVARCHAR (50)    NULL,
    [NEW_CountryId]              INT              NULL,
    [OLD_CountryId]              INT              NULL,
    [NEW_Model]                  NVARCHAR (50)    NULL,
    [OLD_Model]                  NVARCHAR (50)    NULL,
    [NEW_SerialNumber]           INT              NULL,
    [OLD_SerialNumber]           INT              NULL,
    [NEW_TechSupport]            CHAR (1)         NULL,
    [OLD_TechSupport]            CHAR (1)         NULL,
    [NEW_WarrantyExpirationDate] DATE             NULL,
    [OLD_WarrantyExpirationDate] DATE             NULL,
    [NEW_CPUType]                SMALLINT         NULL,
    [OLD_CPUType]                SMALLINT         NULL,
    [NEW_RAM]                    SMALLINT         NULL,
    [OLD_RAM]                    SMALLINT         NULL,
    [NEW_HardDisk]               CHAR (1)         NULL,
    [OLD_HardDisk]               CHAR (1)         NULL,
    [NEW_UPS]                    CHAR (1)         NULL,
    [OLD_UPS]                    CHAR (1)         NULL,
    [NEW_AntivirusSoftware]      CHAR (1)         NULL,
    [OLD_AntivirusSoftware]      CHAR (1)         NULL,
	[NEW_RecServerId] int NULL,
	[OLD_RecServerId] int NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Anti-virus software. default value is false. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_AntivirusSoftware';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Anti-virus software. default value is false. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_AntivirusSoftware';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Security of the server in elenctic energy. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Security of the server in elenctic energy. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_UPS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - The type of disk used on the server. D - normal drive, S - SSD', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_HardDisk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Number of ram memories on the server (MB)', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_RAM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Processor type ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Processor type ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_CPUType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Warranty expiration date. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Warranty expiration date. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_WarrantyExpirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Technical support for the server. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Technical support for the server. The default value is false. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Serial number of the server', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Serial number of the server', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server model.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server model.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server location - country id. In relation to [GlobalRepository].[repository].[CountryRegion].[CountryId].[CountryId].', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_CountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server location - country id. In relation to [GlobalRepository].[repository].[CountryRegion].[CountryId].[CountryId].', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_CountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server host name.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server host name.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_Host';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Server name.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Server name.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'NEW_Name';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'DateFrom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for the table', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'AudID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for [repository].[Servers] table.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication for [repository].[Servers] table.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Servers', @level2type = N'COLUMN', @level2name = N'ExternalId';
go

EXECUTE sys.sp_addextendedproperty @name=N'MS_Description', @value=N'New value - Identity reconciliation of data.' , @level0type=N'SCHEMA',@level0name=N'audit', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'NEW_RecServerId'
GO

EXECUTE sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Old value - Identity reconciliation of data.' , @level0type=N'SCHEMA',@level0name=N'audit', @level1type=N'TABLE',@level1name=N'Servers', @level2type=N'COLUMN',@level2name=N'OLD_RecServerId'
GO