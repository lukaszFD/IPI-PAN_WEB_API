using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Error
{
    public partial class ErrorMessages
    {
        public int ErrorId { get; set; }
        public string UserName { get; set; }
        public int? ColumnId { get; set; }
        public string ColumnName { get; set; }
        public string TableName { get; set; }
        public string SchemaName { get; set; }
        public int? ErrorNumber { get; set; }
        public int? ErrorState { get; set; }
        public int? ErrorSeverity { get; set; }
        public int? ErrorLine { get; set; }
        public string ErrorMessage { get; set; }
        public DateTime? ErrorDateTime { get; set; }
    }
}
