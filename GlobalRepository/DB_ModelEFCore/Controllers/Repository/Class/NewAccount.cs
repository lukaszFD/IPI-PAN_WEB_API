using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Controllers.Repository.Class
{
    public class NewAccount
    {
        public string AccountCountryRegionCode { get; set; }
        public Guid? AccountUserId { get; set; }
        public string AccountName { get; set; }
        public string AccountDescription { get; set; }
        public string AccountType { get; set; }
        public DateTime? AccountPasswordExpires { get; set; }

        public string ServerName { get; set; }
        public string ServerHost { get; set; }
        public string ServerCountryRegionCode { get; set; }
        public string ServerModel { get; set; }
        public int ServerSerialNumber { get; set; }
        public DateTime ServerWarrantyExpirationDate { get; set; }
        public short? ServerCputype { get; set; }
        public short? ServerRam { get; set; }
        public string ServerHardDisk { get; set; }
        public string ServerUps { get; set; }
        public string ServerAntivirusSoftware { get; set; }

        public string SystemCompanyName { get; set; }
        public string SystemName { get; set; }
        public string SystemVersion { get; set; }
        public DateTime SystemTechSupportExpDate { get; set; }
    }
}
