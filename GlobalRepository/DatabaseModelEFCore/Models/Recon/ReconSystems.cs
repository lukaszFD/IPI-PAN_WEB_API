using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.Models.Recon
{
    public partial class ReconSystems
    {
        public Guid? SystemExId { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public DateTime? TechSupportExpDate { get; set; }
    }
}
