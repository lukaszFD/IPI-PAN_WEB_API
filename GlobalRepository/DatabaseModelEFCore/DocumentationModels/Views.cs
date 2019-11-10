using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.DocumentationModels
{
    public partial class Views
    {
        public string SchemaName { get; set; }
        public string TableName { get; set; }
        public int ColumnId { get; set; }
        public string ColumnName { get; set; }
        public string DataType { get; set; }
        public short MaxLength { get; set; }
        public byte Precision { get; set; }
        public bool? IsNullable { get; set; }
        public object Description { get; set; }
    }
}
