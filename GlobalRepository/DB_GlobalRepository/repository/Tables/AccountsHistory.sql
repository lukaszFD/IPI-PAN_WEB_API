CREATE TABLE [repository].[AccountsHistory] (
    [ExternalId]      UNIQUEIDENTIFIER NOT NULL,
    [ValidFrom]       DATETIME2 (2)    NOT NULL,
    [ValidTo]         DATETIME2 (2)    NOT NULL,
    [AccountId]       INT              NOT NULL,
    [CountryId]       INT              NOT NULL,
    [UserId]          INT              NULL,
    [SystemId]        INT              NULL,
    [ServerId]        INT              NULL,
    [Name]            NVARCHAR (50)    NOT NULL,
    [Description]     NVARCHAR (200)   NULL,
    [Type]            CHAR (1)         NOT NULL,
    [PasswordExpires] DATETIME         NULL,
    [Tofix]           CHAR (1)         NULL,
    [CreationDate]    DATETIME         NOT NULL,
    [EditDate]        DATETIME         NULL,
    [DeleteDate]      DATETIME         NULL
);


GO
CREATE CLUSTERED INDEX [ix_AccountsHistory]
    ON [repository].[AccountsHistory]([ValidTo] ASC, [ValidFrom] ASC);

