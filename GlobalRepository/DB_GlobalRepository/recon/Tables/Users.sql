CREATE TABLE [recon].[Users] (
    [UserExId]     UNIQUEIDENTIFIER NULL,
    [Description]  NVARCHAR (200)   NULL,
    [Status]       CHAR (1)         DEFAULT ('I') NOT NULL,
    [CreationDate] DATETIME         DEFAULT (getdate()) NOT NULL,
    CHECK ([Status]='P' OR [Status]='I' OR [Status]='E')
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id retrieved from the database that performs the authorization.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'UserExId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description of the user.', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'E - error, I - inserted, P - processed ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date of creation of the user. ', @level0type = N'SCHEMA', @level0name = N'recon', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'CreationDate';

