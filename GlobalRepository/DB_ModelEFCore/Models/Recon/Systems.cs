using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Recon
{
    public partial class Systems
    {
        public int RecSystemId { get; set; }
        public Guid? SystemExId { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public DateTime? TechSupportExpDate { get; set; }
        public string Status { get; set; }
        public DateTime CreationDate { get; set; }
    }
}
