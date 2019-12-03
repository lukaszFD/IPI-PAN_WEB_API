using DB_ModelEFCore.Models.Repository;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace DB_ModelEFCore.Controllers.Repository.Class
{
    public partial class GrServer
    {
        public Guid ServerExId { get; set; }
        public string Name { get; set; }
        public string Host { get; set; }
        public string CountryRegionCode { get; set; }
        public string Model { get; set; }
        public int SerialNumber { get; set; }
        public int? TechSupport { get; set; }
        public DateTime WarrantyExpirationDate { get; set; }
        public short? Cputype { get; set; }
        public short? Ram { get; set; }
        public string HardDisk { get; set; }
        public string Ups { get; set; }
        public string AntivirusSoftware { get; set; }
    }
}
