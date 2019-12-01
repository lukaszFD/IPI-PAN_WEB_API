using System;

namespace DB_ModelEFCore.Controllers.Recon.Class
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
