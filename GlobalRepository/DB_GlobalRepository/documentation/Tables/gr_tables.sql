CREATE TABLE [documentation].[gr_tables] (
    [TableId]     INT            IDENTITY (1, 1) NOT NULL,
    [schema_name] NVARCHAR (128) NULL,
    [table_name]  [sysname]      NOT NULL,
    [column_id]   INT            NOT NULL,
    [column_name] [sysname]      NULL,
    [data_type]   [sysname]      NULL,
    [max_length]  SMALLINT       NOT NULL,
    [precision]   TINYINT        NOT NULL,
    [is_nullable] BIT            NULL,
    [Description] SQL_VARIANT    NULL,
    PRIMARY KEY CLUSTERED ([TableId] ASC)
);

