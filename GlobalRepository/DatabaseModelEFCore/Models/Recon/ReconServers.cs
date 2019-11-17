using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.Models.Recon
{
    public partial class ReconServers
    {
        public Guid? ServerExId { get; set; }
        public string Name { get; set; }
        public string Host { get; set; }
        public string CountryRegionCode { get; set; }
        public string Model { get; set; }
        public int? SerialNumber { get; set; }
        public DateTime? WarrantyExpirationDate { get; set; }
        public short? Cputype { get; set; }
        public short? Ram { get; set; }
        public string HardDisk { get; set; }
        public string Ups { get; set; }
        public string AntivirusSoftware { get; set; }
    }
}
