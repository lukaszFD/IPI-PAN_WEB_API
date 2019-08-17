CREATE TABLE [gr_user].[Users] (
    [UserGUID]     UNIQUEIDENTIFIER NOT NULL,
    [UserId]       INT              IDENTITY (1, 1) NOT NULL,
    [Description]  NVARCHAR (200)   NULL,
    [Type]         CHAR (1)         NOT NULL,
    [CreationDate] DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]     DATETIME         NULL,
    [DeleteDate]   DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC),
    CHECK ([Type]='A' OR [Type]='N')
);


GO
CREATE NONCLUSTERED INDEX [IX_Users_UserGUID]
    ON [gr_user].[Users]([UserGUID] ASC);


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