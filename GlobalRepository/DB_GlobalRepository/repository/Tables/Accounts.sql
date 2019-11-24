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
    [PasswordExpires] DATE         NULL,
    [Tofix]           int null,
    [CreationDate]    DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]        DATETIME         NULL,
    [DeleteDate]      DATETIME         NULL,
    [RecAccountId]    INT              NULL,
    PRIMARY KEY CLUSTERED ([AccountId] ASC),
    CHECK ([Type]='D' OR [Type]='U'),
	CHECK ([Tofix]=(0) OR [Tofix]=(1)),
    FOREIGN KEY ([CountryId]) REFERENCES [repository].[CountryRegion] ([CountryId]),
    FOREIGN KEY ([ServerId]) REFERENCES [repository].[Servers] ([ServerId]),
    FOREIGN KEY ([SystemId]) REFERENCES [repository].[Systems] ([SystemId]),
    FOREIGN KEY ([UserId]) REFERENCES [gr_user].[Users] ([UserId])
);


go


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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the account was created. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of the last update for the account.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the account.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'DeleteDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating accounts that have missing attributes. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Tofix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identity reconciliation of data.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'RecAccountId';


GO

CREATE TRIGGER [repository].[After_U_Accounts_trg]
ON [repository].[Accounts]
AFTER UPDATE
AS 
BEGIN TRY
begin tran aud
	   INSERT INTO [audit].[Accounts]
	   (   
		  [DateFrom],
		  [ExternalId],
		  [AccountId],
		  [NEW_CountryId],
		  [OLD_CountryId],
		  [NEW_UserId],
		  [OLD_UserId],
		  [NEW_SystemId],
		  [OLD_SystemId],
		  [NEW_ServerId],
		  [OLD_ServerId],
		  [NEW_Name],
		  [OLD_Name],
		  [NEW_Description],
		  [OLD_Description],
		  [NEW_Type],
		  [OLD_Type],
		  [NEW_PasswordExpires],
		  [OLD_PasswordExpires],
		  [NEW_Tofix],
		  [OLD_Tofix],
		  [NEW_RecAccountId],
		  [OLD_RecAccountId]
		)
		SELECT 
			isnull(a.EditDate,a.CreationDate),
			a.ExternalId,
			a.AccountId,
			a.CountryId,
			d.CountryId,
			a.UserId,
			d.UserId,
			a.SystemId,
			d.SystemId,
			a.ServerId,
			d.ServerId,
			a.Name,
			d.Name,
			a.Description,
			d.Description,
			a.Type,
			d.Type,
			a.PasswordExpires,
			d.PasswordExpires,
			a.Tofix,
			d.Tofix,
			a.RecAccountId,
			d.RecAccountId
		FROM 
			[repository].Accounts a 
			JOIN  deleted d ON d.AccountId = a.AccountId
commit tran aud 

begin tran upd
		UPDATE a
		SET a.EditDate = getdate()
		FROM 
			[repository].Accounts a 
			JOIN deleted d ON d.AccountId = a.AccountId
commit tran upd
END TRY
BEGIN CATCH


			EXECUTE [error].[AddErrorMessage] 
				@schemaName = 'repository',
				@tableName = 'Accounts', 
				@columnName = null,
				@columnId = null 
END CATCH

GO
EXECUTE sp_settriggerorder @triggername = N'[repository].[After_U_Accounts_trg]', @order = N'first', @stmttype = N'update';
go
