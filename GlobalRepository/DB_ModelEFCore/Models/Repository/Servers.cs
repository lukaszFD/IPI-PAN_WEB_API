using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Repository
{
    /// <summary>
    /// Class in which information about all servers that are assigned to accounts is stored. 
    /// </summary>
    public partial class Servers
    {
        public Servers()
        {
            Accounts = new HashSet<Accounts>();
        }

        public Guid ExternalId { get; set; }
        public int ServerId { get; set; }
        public string Name { get; set; }
        public string Host { get; set; }
        public int CountryId { get; set; }
        public string Model { get; set; }
        public int SerialNumber { get; set; }
        public int? TechSupport { get; set; }
        public DateTime WarrantyExpirationDate { get; set; }
        public short? Cputype { get; set; }
        public short? Ram { get; set; }
        public string HardDisk { get; set; }
        public string Ups { get; set; }
        public string AntivirusSoftware { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? EditDate { get; set; }
        public DateTime? DeleteDate { get; set; }
        public int? RecServerId { get; set; }

        public virtual CountryRegion Country { get; set; }
        public virtual ICollection<Accounts> Accounts { get; set; }
    }
}
