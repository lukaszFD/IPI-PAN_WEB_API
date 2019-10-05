CREATE TABLE [audit].[Accounts] (
    [AudID]               INT              IDENTITY (1, 1) NOT NULL,
    [UserName]            NVARCHAR (100)   DEFAULT (stuff(suser_sname(),(1),charindex('\',suser_sname()),'')) NULL,
    [DateFrom]            DATETIME         NOT NULL,
    [DateTo]              DATETIME         DEFAULT (getdate()) NULL,
    [NEW_ExternalId]      UNIQUEIDENTIFIER NULL,
    [OLD_ExternalId]      UNIQUEIDENTIFIER NULL,
    [NEW_AccountId]       INT              NULL,
    [OLD_AccountId]       INT              NULL,
    [NEW_CountryId]       INT              NULL,
    [OLD_CountryId]       INT              NULL,
    [NEW_UserId]          INT              NULL,
    [OLD_UserId]          INT              NULL,
    [NEW_SystemId]        INT              NULL,
    [OLD_SystemId]        INT              NULL,
    [NEW_ServerId]        INT              NULL,
    [OLD_ServerId]        INT              NULL,
    [NEW_Name]            NVARCHAR (50)    NOT NULL,
    [OLD_Name]            NVARCHAR (50)    NOT NULL,
    [NEW_Description]     NVARCHAR (200)   NULL,
    [OLD_Description]     NVARCHAR (200)   NULL,
    [NEW_Type]            CHAR (1)         NULL,
    [OLD_Type]            CHAR (1)         NULL,
    [NEW_PasswordExpires] DATETIME         NULL,
    [OLD_PasswordExpires] DATETIME         NULL,
    [NEW_Tofix]           CHAR (1)         NULL,
    [OLD_Tofix]           CHAR (1)         NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Flag indicating accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Flag indicating accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Account name. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Account name. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - The server identifier on the database. In relation to [GlobalRepository].[repository].[Servers].[ServerId]', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - The server identifier on the database. In relation to [GlobalRepository].[repository].[Servers].[ServerId]', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - System identifier from the database.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - System identifier from the database.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - User ID on a database.  In relation to [GlobalRepository].[gr_user].[Users].[UserId]', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - User ID on a database.  In relation to [GlobalRepository].[gr_user].[Users].[UserId]', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Account location - country id. In relation to [GlobalRepository].[repository].[CountryRegion].[CountryId].', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_CountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Account location - country id. In relation to [GlobalRepository].[repository].[CountryRegion].[CountryId].', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_CountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_AccountId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_AccountId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'OLD_ExternalId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'NEW_ExternalId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'DateFrom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for the table', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'AudID';

