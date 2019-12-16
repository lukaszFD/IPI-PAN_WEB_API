using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Recon
{
    /// <summary>
    /// Class in which information about reconciliation of data for servers is stored. 
    /// </summary>
    public partial class Servers
    {
        public int RecServerId { get; set; }
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
        public string Status { get; set; }
        public DateTime CreationDate { get; set; }
    }
}
