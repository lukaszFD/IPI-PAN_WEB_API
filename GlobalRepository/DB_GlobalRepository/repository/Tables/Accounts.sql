CREATE TABLE [repository].[Accounts] (
    [AccountGUID]     UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [AccountId]       INT              IDENTITY (1, 1) NOT NULL,
    [UserId]          INT              NULL,
    [SystemId]        INT              NULL,
    [ServerId]        INT              NULL,
    [Name]            NVARCHAR (50)    NOT NULL,
    [Description]     NVARCHAR (200)   NULL,
    [Type]            CHAR (1)         NOT NULL,
    [PasswordExpires] DATETIME         NULL,
    [Tofix]           CHAR (1)         NULL,
    [CreationDate]    DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]        DATETIME         NULL,
    [DeleteDate]      DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([AccountId] ASC),
    CHECK ([Type]='D' OR [Type]='U'),
	CHECK ([Tofix]=0 OR [Tofix]=1)
);

GO
CREATE NONCLUSTERED INDEX [IX_Accounts_AccountGUID]
    ON [repository].[Accounts]([AccountGUID] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_Accounts_UserId]
    ON [repository].[Accounts]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Accounts_SystemId]
    ON [repository].[Accounts]([SystemId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Accounts_ServerId]
    ON [repository].[Accounts]([ServerId] ASC);


GO
CREATE TRIGGER repository.After_U_Accounts_trg
ON repository.Accounts
AFTER UPDATE
AS 
BEGIN
SET NOCOUNT ON;

	UPDATE a
	SET a.EditDate = getdate()
	FROM 
		repository.Accounts a 
		JOIN inserted i ON i.AccountId = a.AccountId
END
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'AccountGUID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'AccountId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID on a database.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System identifier from the database.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The server identifier on the database.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'ServerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account name. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the account was created. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last update for the account.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the account.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'DeleteDate';

