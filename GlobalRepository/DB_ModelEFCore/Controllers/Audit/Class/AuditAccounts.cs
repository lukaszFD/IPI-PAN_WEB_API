using System;

namespace DB_ModelEFCore.Controllers.Audit.Class
{
    public partial class AuditAccounts
    {
        public Guid AccountExId { get; set; }
        public string UserName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string NewCountryRegionCode { get; set; }
        public string OldCountryRegionCode { get; set; }
        public int? NewUserId { get; set; }
        public int? OldUserId { get; set; }
        public Guid? NewSystemExId { get; set; }
        public Guid? OldSystemExId { get; set; }
        public Guid? NewServerExId { get; set; }
        public Guid? OldServerExId { get; set; }
        public string NewName { get; set; }
        public string OldName { get; set; }
        public string NewDescription { get; set; }
        public string OldDescription { get; set; }
        public string NewType { get; set; }
        public string OldType { get; set; }
        public DateTime? NewPasswordExpires { get; set; }
        public DateTime? OldPasswordExpires { get; set; }
        public string NewTofix { get; set; }
        public string OldTofix { get; set; }
    }
}
