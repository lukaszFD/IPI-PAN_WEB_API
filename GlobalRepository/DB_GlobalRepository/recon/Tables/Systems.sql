CREATE TABLE [recon].[Systems] (
    [SystemExId]         UNIQUEIDENTIFIER NULL,
    [CompanyName]        NVARCHAR (50)    NULL,
    [Name]               NVARCHAR (50)    NULL,
    [Version]            NVARCHAR (50)    NULL,
    [TechSupport]        CHAR (1)         NULL,
    [TechSupportExpDate] DATE             NULL,
    [Status]             CHAR (1)         DEFAULT ('I') NOT NULL,
    [CreationDate]       DATETIME         DEFAULT (getdate()) NOT NULL,
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag informing that there is support for the system.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E - error, I - inserted, P - processed ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CreationDate';

