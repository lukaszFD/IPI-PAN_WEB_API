CREATE TABLE [gr_user].[Users] (
    [ExternalId]   UNIQUEIDENTIFIER NOT NULL,
    [UserId]       INT              IDENTITY (1, 1) NOT NULL,
    [Description]  NVARCHAR (200)   NULL,
    [Username] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
    [Type]         CHAR (1)         NOT NULL,
    [CreationDate] DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]     DATETIME         NULL,
    [DeleteDate]   DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC),
    CHECK ([Type]='A' OR [Type]='N')
);

GO
CREATE TRIGGER gr_user.After_U_Users_trg
ON gr_user.[Users]
AFTER UPDATE
AS 
BEGIN
SET NOCOUNT ON;

	UPDATE a
	SET a.EditDate = getdate()
	FROM 
		gr_user.[Users] a 
		JOIN inserted i ON i.[UserId] = a.[UserId]
END

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id retrieved from the database that performs the authorization.', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'ExternalId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID on the database. In relation to [GlobalRepository]. [repository].[Accounts].[UserId]', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the user.', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User type: A - administrator, N - normal ', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of creation of the user. ', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of editing the user. ', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of removal of the user. ', @level0type = N'SCHEMA', @level0name = N'gr_user', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'DeleteDate';

