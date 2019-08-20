CREATE TABLE [repository].[SystemsHistory] (
    [ExternalId]         UNIQUEIDENTIFIER NOT NULL,
    [ValidFrom]          DATETIME2 (2)    NOT NULL,
    [ValidTo]            DATETIME2 (2)    NOT NULL,
    [SystemId]           INT              NOT NULL,
    [CompanyName]        NVARCHAR (50)    NOT NULL,
    [Name]               NVARCHAR (50)    NOT NULL,
    [Version]            NVARCHAR (50)    NOT NULL,
    [TechSupport]        CHAR (1)         NOT NULL,
    [TechSupportExpDate] DATE             NOT NULL,
    [CreationDate]       DATETIME         NOT NULL,
    [EditDate]           DATETIME         NULL,
    [DeleteDate]         DATETIME         NULL
);


GO
CREATE CLUSTERED INDEX [ix_SystemsHistory]
    ON [repository].[SystemsHistory]([ValidTo] ASC, [ValidFrom] ASC);

