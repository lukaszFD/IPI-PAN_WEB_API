CREATE TABLE [repository].[Accounts] (
    [ExternalId]      UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [AccountId]       INT              IDENTITY (1, 1) NOT NULL,
    [CountryId]       INT              NOT NULL,
    [UserId]          INT              NULL,
    [SystemId]        INT              NULL,
    [ServerId]        INT              NULL,
    [Name]            NVARCHAR (50)    NOT NULL,
    [Description]     NVARCHAR (200)   NULL,
    [Type]            CHAR (1)         NOT NULL,
    [PasswordExpires] DATETIME         NULL,
    [Tofix]           AS               ([repository].[CheckDate]([PasswordExpires])),
    [CreationDate]    DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]        DATETIME         NULL,
    [DeleteDate]      DATETIME         NULL,
    [RecAccountId]    INT              NULL,
    PRIMARY KEY CLUSTERED ([AccountId] ASC),
    CHECK ([Type]='D' OR [Type]='U'),
    FOREIGN KEY ([CountryId]) REFERENCES [repository].[CountryRegion] ([CountryId]),
    FOREIGN KEY ([RecAccountId]) REFERENCES [recon].[Accounts] ([RecAccountId]),
    FOREIGN KEY ([ServerId]) REFERENCES [repository].[Servers] ([ServerId]),
    FOREIGN KEY ([SystemId]) REFERENCES [repository].[Systems] ([SystemId]),
    FOREIGN KEY ([UserId]) REFERENCES [gr_user].[Users] ([UserId])
);








GO


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'ExternalId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'AccountId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account location - country id. In relation to [GlobalRepository].[repository].[CountryRegion].[CountryId].', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID on a database.  In relation to [GlobalRepository].[gr_user].[Users].[UserId]', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System identifier from the database.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The server identifier on the database. In relation to [GlobalRepository].[repository].[Servers].[ServerId]', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account name. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'PasswordExpires';


GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the account was created. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last update for the account.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the account.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'DeleteDate';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identity reconciliation of data.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'RecAccountId';

