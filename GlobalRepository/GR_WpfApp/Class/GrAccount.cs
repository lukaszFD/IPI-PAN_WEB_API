using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace GR_WpfApp.Class
{
    public partial class GrAccount
    {
        [JsonProperty("accountCountryRegionCode")]
        public string AccountCountryRegionCode { get; set; }

        [JsonProperty("accountName")]
        public string AccountName { get; set; }

        [JsonProperty("accountDescription")]
        public string AccountDescription { get; set; }

        [JsonProperty("accountType")]
        public string AccountType { get; set; }

        [JsonProperty("accountPasswordExpires")]
        public DateTimeOffset AccountPasswordExpires { get; set; }

        [JsonProperty("serverName")]
        public string ServerName { get; set; }

        [JsonProperty("serverHost")]
        public string ServerHost { get; set; }

        [JsonProperty("serverCountryRegionCode")]
        public string ServerCountryRegionCode { get; set; }

        [JsonProperty("serverModel")]
        public long ServerModel { get; set; }

        [JsonProperty("serverSerialNumber")]
        public long ServerSerialNumber { get; set; }

        [JsonProperty("serverWarrantyExpirationDate")]
        public DateTimeOffset ServerWarrantyExpirationDate { get; set; }

        [JsonProperty("serverCputype")]
        public long ServerCputype { get; set; }

        [JsonProperty("serverRam")]
        public long ServerRam { get; set; }

        [JsonProperty("serverHardDisk")]
        public string ServerHardDisk { get; set; }

        [JsonProperty("serverUps")]
        public string ServerUps { get; set; }

        [JsonProperty("serverAntivirusSoftware")]
        public string ServerAntivirusSoftware { get; set; }

        [JsonProperty("systemCompanyName")]
        public string SystemCompanyName { get; set; }

        [JsonProperty("systemName")]
        public string SystemName { get; set; }

        [JsonProperty("systemVersion")]
        public string SystemVersion { get; set; }

        [JsonProperty("systemTechSupportExpDate")]
        public DateTimeOffset SystemTechSupportExpDate { get; set; }
    }
}
