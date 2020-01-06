using Newtonsoft.Json;

namespace GR_WpfApp.Class
{
    public partial class Documentation
    {
        [JsonProperty("tableId")]
        public long TableId { get; set; }

        [JsonProperty("schemaName")]
        public string SchemaName { get; set; }

        [JsonProperty("tableName")]
        public string TableName { get; set; }

        [JsonProperty("columnId")]
        public long ColumnId { get; set; }

        [JsonProperty("columnName")]
        public string ColumnName { get; set; }

        [JsonProperty("dataType")]
        public string DataType { get; set; }

        [JsonProperty("maxLength")]
        public long MaxLength { get; set; }

        [JsonProperty("precision")]
        public long Precision { get; set; }

        [JsonProperty("isNullable")]
        public bool IsNullable { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

    }
}
