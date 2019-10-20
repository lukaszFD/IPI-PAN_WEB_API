CREATE TABLE [repository].[Systems] (
    [ExternalId]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [SystemId]           INT              IDENTITY (1, 1) NOT NULL,
    [CompanyName]        NVARCHAR (50)    NOT NULL,
    [Name]               NVARCHAR (50)    NOT NULL,
    [Version]            NVARCHAR (50)    NOT NULL,
    [TechSupport]        AS ([repository].[CheckDate]([TechSupportExpDate])),
    [TechSupportExpDate] DATE             NOT NULL,
    [CreationDate]       DATETIME         DEFAULT (getdate()) NOT NULL,
    [EditDate]           DATETIME         NULL,
    [DeleteDate]         DATETIME         NULL,
    [RecSystemId]        INT              NULL,
    PRIMARY KEY CLUSTERED ([SystemId] ASC),
    FOREIGN KEY ([RecSystemId]) REFERENCES [recon].[Systems] ([RecSystemId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Systems_SystemId]
    ON [repository].[Systems]([SystemId] ASC);


GO

CREATE TRIGGER [repository].[After_U_AuditSystem_trg]
ON [repository].[Systems]
AFTER UPDATE
AS 
BEGIN TRY
	   INSERT INTO [GlobalRepository].[audit].[Systems]
	   (   
			[DateFrom],
			[ExternalId],
			[SystemId],
			[NEW_CompanyName],
			[OLD_CompanyName],
			[NEW_Name],
			[OLD_Name],
			[NEW_Version],
			[OLD_Version],
			[NEW_TechSupport],
			[OLD_TechSupport],
			[NEW_TechSupportExpDate],
			[OLD_TechSupportExpDate],
			[NEW_RecSystemId],
			[OLD_RecSystemId]
	   )
	   SELECT 
	        isnull(s.EditDate,s.CreationDate),
			s.[ExternalId],
			s.[SystemId],
			s.[CompanyName],
			d.[CompanyName],
			s.[Name],
			d.[Name],
			s.[Version],
			d.[Version],
			s.[TechSupport],
			d.[TechSupport],
			s.[TechSupportExpDate],
			d.[TechSupportExpDate],
			s.[RecSystemId],
			d.[RecSystemId]
		FROM 
			[repository].[Systems] s
			JOIN deleted d ON d.SystemId = s.SystemId
END TRY
	BEGIN CATCH

	if @@trancount > 0
	rollback

	EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
		@schemaName = 'repository',
		@tableName = 'Systems', 
		@columnName = null,
		@columnId = null 
END CATCH
GO
EXECUTE sp_settriggerorder @triggername = N'[repository].[After_U_AuditSystem_trg]', @order = N'first', @stmttype = N'update';
go

CREATE TRIGGER [repository].[After_U_System_trg]
ON [repository].[Systems]
AFTER UPDATE
AS 
BEGIN TRY
		UPDATE a
		SET a.EditDate = getdate()
		FROM 
			[repository].Systems a 
			JOIN deleted d ON d.SystemId = a.SystemId
END TRY
	BEGIN CATCH

	if @@trancount > 0
	rollback

	EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
		@schemaName = 'repository',
		@tableName = 'Systems', 
		@columnName = null,
		@columnId = null 
END CATCH
GO
EXECUTE sp_settriggerorder @triggername = N'[repository].[After_U_System_trg]', @order = N'last', @stmttype = N'update';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'ExternalId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System ID based on the database. In relation to [GlobalRepository].[repository].[Accounts].[SystemId].', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the system provider', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CompanyName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System name', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System version', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag informing that there is support for the system. Default value is false.  ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of editing the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the entry. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'DeleteDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identity reconciliation of data.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'RecSystemId';

