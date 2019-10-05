CREATE TABLE [error].[ErrorMessages] (
    [ErrorID]       INT            IDENTITY (1, 1) NOT NULL,
    [UserName]      NVARCHAR (100) NULL,
    [TableName]     NVARCHAR (100) NULL,
    [ColumnName]    NVARCHAR (100) NULL,
    [ErrorNumber]   INT            NULL,
    [ErrorState]    INT            NULL,
    [ErrorSeverity] INT            NULL,
    [ErrorLine]     INT            NULL,
    [ErrorMessage]  NVARCHAR (MAX) NULL,
    [ErrorDateTime] DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ErrorID] ASC)
);



