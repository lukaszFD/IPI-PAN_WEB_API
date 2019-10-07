CREATE TABLE [recon].[Accounts] (
    [RecAccountId]      INT              IDENTITY (1, 1) NOT NULL,
    [AccountExId]       UNIQUEIDENTIFIER NULL,
    [CountryRegionCode] NVARCHAR (2)     NULL,
    [UserExId]          UNIQUEIDENTIFIER NULL,
    [SystemExId]        UNIQUEIDENTIFIER NULL,
    [ServerExId]        UNIQUEIDENTIFIER NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Description]       NVARCHAR (200)   NULL,
    [Type]              CHAR (1)         NULL,
    [PasswordExpires]   DATETIME         NULL,
    [Status]            CHAR (1)         DEFAULT ('I') NOT NULL,
    [CreationDate]      DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RecAccountId] ASC),
    CHECK ([Status]='P' OR [Status]='I' OR [Status]='E')
);










GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'AccountExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account location - country code.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ExID on a database.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'UserExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System ExID on a database.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'SystemExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server ExID on a database.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'ServerExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account name. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the account. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account type. U - user account, D - database account. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Password expiration date.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'PasswordExpires';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E - error, I - inserted, P - processed ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the account was created. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier on the database.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Accounts', @level2type = N'COLUMN', @level2name = N'RecAccountId';


GO



CREATE TRIGGER	[recon].[After_I_ReconAccount_trg]
ON [recon].[Accounts]	
AFTER INSERT
AS 
BEGIN TRY
	EXEC [GlobalRepository].[error].[CheckReconAccounts]
END TRY
BEGIN CATCH
		EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
			@schemaName = 'recon',
			@tableName = 'Accounts', 
			@columnName = null,
			@columnId = null 
END CATCH