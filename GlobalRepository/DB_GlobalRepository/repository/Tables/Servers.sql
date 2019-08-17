CREATE TABLE [repository].[Servers] (
    [ServerId]               INT           IDENTITY (1, 1) NOT NULL,
    [Name]                   NVARCHAR (50) NOT NULL,
    [Host]                   NVARCHAR (50) NOT NULL,
    [Location]               NVARCHAR (50) NOT NULL,
    [Model]                  NVARCHAR (50) NOT NULL,
    [SerialNumber]           INT           NOT NULL,
    [TechSupport]            CHAR (1)      DEFAULT ((0)) NOT NULL,
    [WarrantyExpirationDate] DATE          NOT NULL,
    [CPUType]                SMALLINT      NULL,
    [RAM]                    SMALLINT      NULL,
    [HardDisk]               CHAR (1)      NOT NULL,
    [UPS]                    CHAR (1)      DEFAULT ((0)) NOT NULL,
    [AntivirusSoftware]      CHAR (1)      DEFAULT ((0)) NOT NULL,
    [CreationDate]           DATETIME      DEFAULT (getdate()) NOT NULL,
    [EditDate]               DATETIME      NULL,
    [DeleteDate]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ServerId] ASC),
    CHECK ([AntivirusSoftware]=(0) OR [AntivirusSoftware]=(1)),
    CHECK ([HardDisk]='D' OR [HardDisk]='S'),
    CHECK ([TechSupport]=(0) OR [TechSupport]=(1)),
    CHECK ([UPS]=(0) OR [UPS]=(1))
);


GO
CREATE TRIGGER repository.After_U_Servers_trg
ON repository.Servers
AFTER UPDATE
AS 
BEGIN
SET NOCOUNT ON;

	UPDATE a
	SET a.EditDate = getdate()
	FROM 
		repository.Servers a 
		JOIN inserted i ON i.ServerId = a.ServerId
END