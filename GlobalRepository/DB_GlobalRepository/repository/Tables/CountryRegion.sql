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
CREATE TRIGGER repository.After_U_CountryRegion_trg
ON [repository].[CountryRegion]
AFTER UPDATE
AS 
BEGIN
SET NOCOUNT ON;

	UPDATE a
	SET a.EditDate = getdate()
	FROM 
		[repository].[CountryRegion] a 
		JOIN inserted i ON i.[CountryId] = a.[CountryId]
END