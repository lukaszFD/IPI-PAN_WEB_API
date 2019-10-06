CREATE TABLE [audit].[Systems] (
    [AudID]                  INT              IDENTITY (1, 1) NOT NULL,
    [UserName]               NVARCHAR (100)   DEFAULT (stuff(suser_sname(),(1),charindex('\',suser_sname()),'')) NULL,
    [DateFrom]               DATETIME         NOT NULL,
    [DateTo]                 DATETIME         DEFAULT (getdate()) NULL,
    [ExternalId]             UNIQUEIDENTIFIER NOT NULL,
    [SystemId]               INT              NOT NULL,
    [NEW_CompanyName]        NVARCHAR (50)    NULL,
    [OLD_CompanyName]        NVARCHAR (50)    NULL,
    [NEW_Name]               NVARCHAR (50)    NULL,
    [OLD_Name]               NVARCHAR (50)    NULL,
    [NEW_Version]            NVARCHAR (50)    NULL,
    [OLD_Version]            NVARCHAR (50)    NULL,
    [NEW_TechSupport]        CHAR (1)         NULL,
    [OLD_TechSupport]        CHAR (1)         NULL,
    [NEW_TechSupportExpDate] DATE             NULL,
    [OLD_TechSupportExpDate] DATE             NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'OLD_TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Expiry date of support for the system ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'NEW_TechSupportExpDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Flag informing that there is support for the system. Default value is false.  ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'OLD_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Flag informing that there is support for the system. Default value is false.  ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'NEW_TechSupport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - System version', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'OLD_Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - System version', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'NEW_Version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - System name', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'OLD_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - System name', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'NEW_Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Old value - Name of the system provider', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'OLD_CompanyName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New value - Name of the system provider', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'NEW_CompanyName';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date to', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'DateTo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'DateFrom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who made the change ', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for the table', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'AudID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique id for [repository].[Systems] table.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'SystemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier transmitted in web communication for [repository].[Systems] table.', @level0type = N'SCHEMA', @level0name = N'audit', @level1type = N'TABLE', @level1name = N'Systems', @level2type = N'COLUMN', @level2name = N'ExternalId';

