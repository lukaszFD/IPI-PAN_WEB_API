CREATE TABLE [repository].[CountryRegion] (
    [CountryId]         INT           IDENTITY (1, 1) NOT NULL,
    [CountryRegionCode] NVARCHAR (3)  NOT NULL,
    [Name]              NVARCHAR (50) NOT NULL,
    [CreationDate]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [EditDate]          DATETIME      NULL,
    [DeleteDate]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CountryId] ASC)
);

GO
CREATE TRIGGER [repository].[After_U_CountryRegion_trg]
ON [repository].[CountryRegion]
AFTER UPDATE
AS 
BEGIN TRY
	BEGIN TRAN aud
		INSERT INTO [GlobalRepository].[audit].[CountryRegion]
		(
			[DateTo],
			[CountryId],
			[NEW_CountryRegionCode],
			[OLD_CountryRegionCode],
			[NEW_Name],
			[OLD_Name]
		)
		SELECT 
			 isnull(c.EditDate,c.CreationDate)
			,c.[CountryId]
			,c.[CountryRegionCode]
			,d.[CountryRegionCode]
			,c.[Name]
			,d.[Name]
		FROM 
			[repository].[CountryRegion] c
			JOIN  deleted d ON d.[CountryId] = c.[CountryId]
	COMMIT TRAN aud

	BEGIN TRAN upd
		UPDATE a
		SET a.EditDate = getdate()
		FROM 
			[repository].[CountryRegion] a 
			JOIN deleted d ON d.[CountryId] = a.[CountryId]
	COMMIT TRAN upd
END TRY
	BEGIN CATCH
			EXECUTE [GlobalRepository].[error].[AddErrorMessage] 
				@schemaName = 'repository',
				@tableName = 'Accounts', 
				@columnName = null,
				@columnId = null 
END CATCH

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Country id in the database. In relation to [GlobalRepository]. [repository]. [Servers]. [CountryId].', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'CountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Abbreviated country code. ', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Full name of the country.', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of creation of the entry', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'CreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of editing the entry', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'EditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of deletion of the entry', @level0type = N'SCHEMA', @level0name = N'repository', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'DeleteDate';

