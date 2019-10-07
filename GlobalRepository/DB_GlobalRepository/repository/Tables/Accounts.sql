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


GO

CREATE TRIGGER [repository].[After_U_Accounts_trg]
ON [repository].[Accounts]
AFTER UPDATE
AS 
BEGIN
SET NOCOUNT ON;

BEGIN TRAN aud

DECLARE 
	@DateFrom datetime,
	@ExternalId uniqueidentifier,
	@AccountId int,
	@NEW_CountryId int,
	@OLD_CountryId int,
	@NEW_UserId int,
	@OLD_UserId int,
	@NEW_SystemId int,
	@OLD_SystemId int,
	@NEW_ServerId int,
	@OLD_ServerId int,
	@NEW_Name nvarchar(50),
	@OLD_Name nvarchar(50),
	@NEW_Description nvarchar(200),
	@OLD_Description nvarchar(200),
	@NEW_Type char(1),
	@OLD_Type char(1),
	@NEW_PasswordExpires datetime,
	@OLD_PasswordExpires datetime,
	@NEW_Tofix char(1),
	@OLD_Tofix char(1),
	@NEW_RecAccountId int,
	@OLD_RecAccountId int;

	SELECT 
		@DateFrom = isnull(a.EditDate,a.CreationDate),
		@ExternalId =  a.ExternalId,
		@AccountId = a.AccountId,
		@NEW_CountryId = a.CountryId,
		@OLD_CountryId = d.CountryId,
		@NEW_UserId = a.UserId,
		@OLD_UserId = d.UserId,
		@NEW_SystemId = a.SystemId,
		@OLD_SystemId = d.SystemId,
		@NEW_ServerId = a.ServerId,
		@OLD_ServerId = d.ServerId,
		@NEW_Name  = a.Name,
		@OLD_Name  = d.Name,
		@NEW_Description  = a.Description,
		@OLD_Description  = d.Description,
		@NEW_Type = a.Type,
		@OLD_Type = d.Type,
		@NEW_PasswordExpires  = a.PasswordExpires,
		@OLD_PasswordExpires  = d.PasswordExpires,
		@NEW_Tofix  = a.Tofix,
		@OLD_Tofix  = d.Tofix,
		@NEW_RecAccountId = a.RecAccountId,
		@OLD_RecAccountId = d.RecAccountId
	FROM 
		[repository].Accounts a 
		JOIN  deleted d ON d.AccountId = a.AccountId

   INSERT INTO [GlobalRepository].[audit].[Accounts]
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
	VALUES 
	(
		@DateFrom,
		@ExternalId,
		@AccountId,
		@NEW_CountryId,
		@OLD_CountryId,
		@NEW_UserId,
		@OLD_UserId,
		@NEW_SystemId,
		@OLD_SystemId,
		@NEW_ServerId,
		@OLD_ServerId,
		@NEW_Name,
		@OLD_Name,
		@NEW_Description,
		@OLD_Description,
		@NEW_Type,
		@OLD_Type,
		@NEW_PasswordExpires,
		@OLD_PasswordExpires,
		@NEW_Tofix,
		@OLD_Tofix,
		@NEW_RecAccountId,
		@OLD_RecAccountId  
	)
COMMIT TRAN aud

BEGIN TRAN upd
    UPDATE a
	SET a.EditDate = getdate()
	FROM 
		[repository].Accounts a 
		JOIN inserted i ON i.AccountId = a.AccountId
COMMIT TRAN upd
END
GO
EXECUTE sp_settriggerorder @triggername = N'[repository].[After_U_Accounts_trg]', @order = N'first', @stmttype = N'update';

