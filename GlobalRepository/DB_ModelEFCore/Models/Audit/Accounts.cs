using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Audit
{
    public partial class Accounts
    {
        public int AudId { get; set; }
        public string UserName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public Guid ExternalId { get; set; }
        public int AccountId { get; set; }
        public int? NewCountryId { get; set; }
        public int? OldCountryId { get; set; }
        public int? NewUserId { get; set; }
        public int? OldUserId { get; set; }
        public int? NewSystemId { get; set; }
        public int? OldSystemId { get; set; }
        public int? NewServerId { get; set; }
        public int? OldServerId { get; set; }
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
        public int? NewRecAccountId { get; set; }
        public int? OldRecAccountId { get; set; }
    }
}
