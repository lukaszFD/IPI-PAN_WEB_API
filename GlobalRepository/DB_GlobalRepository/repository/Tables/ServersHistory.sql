CREATE TABLE [repository].[ServersHistory] (
    [ExternalId]             UNIQUEIDENTIFIER NOT NULL,
    [ValidFrom]              DATETIME2 (2)    NOT NULL,
    [ValidTo]                DATETIME2 (2)    NOT NULL,
    [ServerId]               INT              NOT NULL,
    [Name]                   NVARCHAR (50)    NOT NULL,
    [Host]                   NVARCHAR (50)    NOT NULL,
    [CountryId]              INT              NOT NULL,
    [Model]                  NVARCHAR (50)    NOT NULL,
    [SerialNumber]           INT              NOT NULL,
    [TechSupport]            CHAR (1)         NOT NULL,
    [WarrantyExpirationDate] DATE             NOT NULL,
    [CPUType]                SMALLINT         NULL,
    [RAM]                    SMALLINT         NULL,
    [HardDisk]               CHAR (1)         NOT NULL,
    [UPS]                    CHAR (1)         NOT NULL,
    [AntivirusSoftware]      CHAR (1)         NOT NULL,
    [CreationDate]           DATETIME         NOT NULL,
    [EditDate]               DATETIME         NULL,
    [DeleteDate]             DATETIME         NULL
);


GO
CREATE CLUSTERED INDEX [ix_ServersHistory]
    ON [repository].[ServersHistory]([ValidTo] ASC, [ValidFrom] ASC);

