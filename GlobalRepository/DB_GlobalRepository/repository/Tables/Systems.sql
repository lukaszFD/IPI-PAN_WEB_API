CREATE TABLE [repository].[Systems] (
    [ExternalId]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [SystemId]           INT              IDENTITY (1, 1) NOT NULL,
    [CompanyName]        NVARCHAR (50)    NOT NULL,
    [Name]               NVARCHAR (50)    NOT NULL,
    [Version]            NVARCHAR (50)    NOT NULL,
    [TechSupport]        CHAR (1)         DEFAULT ((0)) NOT NULL,
    [TechSupportExpDate] DATE             NOT NULL,
    [CreationDate]       DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]           DATETIME         NULL,
    [DeleteDate]         DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([SystemId] ASC),
    CHECK ([TechSupport]=(0) OR [TechSupport]=(1))
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'DeleteDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of editing the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System version', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag informing that there is support for the system. Default value is false.  ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System ID based on the database. In relation to [GlobalRepository].[repository].[Accounts].[SystemId].', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System name', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the system provider', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CompanyName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'ExternalId';

