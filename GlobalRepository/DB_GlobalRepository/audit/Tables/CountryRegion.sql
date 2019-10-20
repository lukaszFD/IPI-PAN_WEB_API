CREATE TABLE [audit].[CountryRegion] (
    [AudID]                 INT            IDENTITY (1, 1) NOT NULL primary key,
    [UserName]              NVARCHAR (100) DEFAULT (stuff(suser_sname(),(1),charindex('\',suser_sname()),'')) NULL,
    [DateFrom]              DATETIME       NOT NULL,
    [DateTo]                DATETIME       DEFAULT (getdate()) NULL,
    [CountryId]             INT            NULL,
    [NEW_CountryRegionCode] NVARCHAR (3)   NULL,
    [OLD_CountryRegionCode] NVARCHAR (3)   NULL,
    [NEW_Name]              NVARCHAR (50)  NULL,
    [OLD_Name]              NVARCHAR (50)  NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Full name of the country.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Full name of the country.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'NEW_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Abbreviated country code. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'OLD_CountryRegionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Abbreviated country code. ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'NEW_CountryRegionCode';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'DateFrom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for the table', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'AudID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for [repository].[CountryRegion] table.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'COLUMN', @level2name = N'CountryId';

