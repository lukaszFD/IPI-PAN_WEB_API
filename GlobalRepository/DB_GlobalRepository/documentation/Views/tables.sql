


CREATE view [documentation].[tables]
as

select schema_name(tab.schema_id) as schema_name,
    tab.name as table_name, 
    col.column_id,
    col.name as column_name, 
    t.name as data_type,    
    col.max_length,
    col.precision,
	col.is_nullable,
	sep.value [Description]
from sys.tables as tab
    inner join sys.columns as col on tab.object_id = col.object_id
    left join sys.types as t on col.user_type_id = t.user_type_id
	left join sys.extended_properties sep on tab.object_id = sep.major_id AND col.column_id = sep.minor_id

