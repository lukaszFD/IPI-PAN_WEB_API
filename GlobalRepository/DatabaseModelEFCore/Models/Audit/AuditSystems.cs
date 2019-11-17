using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.Models.Audit
{
    public partial class AuditSystems
    {
        public Guid SystemExId { get; set; }
        public string UserName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string NewCompanyName { get; set; }
        public string OldCompanyName { get; set; }
        public string NewName { get; set; }
        public string OldName { get; set; }
        public string NewVersion { get; set; }
        public string OldVersion { get; set; }
        public string NewTechSupport { get; set; }
        public string OldTechSupport { get; set; }
        public DateTime? NewTechSupportExpDate { get; set; }
        public DateTime? OldTechSupportExpDate { get; set; }
    }
}
