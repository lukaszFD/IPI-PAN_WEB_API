using System;

namespace DB_ModelEFCore.Controllers.Audit.Class
{
    /// <summary>
    /// Audit of data for servers.
    /// </summary>
    public partial class AuditServers
    {
        public Guid ServerExId { get; set; }
        public string UserName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string NewName { get; set; }
        public string OldName { get; set; }
        public string NewHost { get; set; }
        public string OldHost { get; set; }
        public string NewCountryRegionCode { get; set; }
        public string OldCountryRegionCode { get; set; }
        public string NewModel { get; set; }
        public string OldModel { get; set; }
        public int? NewSerialNumber { get; set; }
        public int? OldSerialNumber { get; set; }
        public string NewTechSupport { get; set; }
        public string OldTechSupport { get; set; }
        public DateTime? NewWarrantyExpirationDate { get; set; }
        public DateTime? OldWarrantyExpirationDate { get; set; }
        public short? NewCputype { get; set; }
        public short? OldCputype { get; set; }
        public short? NewRam { get; set; }
        public short? OldRam { get; set; }
        public string NewHardDisk { get; set; }
        public string OldHardDisk { get; set; }
        public string NewUps { get; set; }
        public string OldUps { get; set; }
        public string NewAntivirusSoftware { get; set; }
        public string OldAntivirusSoftware { get; set; }
    }
}
