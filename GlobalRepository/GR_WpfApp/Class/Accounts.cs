using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace GR_WpfApp.Class
{
    public partial class Accounts
    {
        [JsonProperty("accountExId")]
        public Guid AccountExId { get; set; }

        [JsonProperty("userName")]
        public string UserName { get; set; }

        [JsonProperty("dateFrom")]
        public DateTimeOffset DateFrom { get; set; }

        [JsonProperty("dateTo")]
        public DateTimeOffset DateTo { get; set; }

        [JsonProperty("newCountryRegionCode")]
        public string NewCountryRegionCode { get; set; }

        [JsonProperty("oldCountryRegionCode")]
        public string OldCountryRegionCode { get; set; }

        [JsonProperty("newUserName")]
        public object NewUserName { get; set; }

        [JsonProperty("oldUserName")]
        public string OldUserName { get; set; }

        [JsonProperty("newSystemExId")]
        public Guid NewSystemExId { get; set; }

        [JsonProperty("oldSystemExId")]
        public Guid OldSystemExId { get; set; }

        [JsonProperty("newServerExId")]
        public Guid NewServerExId { get; set; }

        [JsonProperty("oldServerExId")]
        public Guid OldServerExId { get; set; }

        [JsonProperty("newName")]
        public string NewName { get; set; }

        [JsonProperty("oldName")]
        public string OldName { get; set; }

        [JsonProperty("newDescription")]
        public object NewDescription { get; set; }

        [JsonProperty("oldDescription")]
        public object OldDescription { get; set; }

        [JsonProperty("newType")]
        public string NewType { get; set; }

        [JsonProperty("oldType")]
        public string OldType { get; set; }

        [JsonProperty("newPasswordExpires")]
        public object NewPasswordExpires { get; set; }

        [JsonProperty("oldPasswordExpires")]
        public object OldPasswordExpires { get; set; }

        [JsonProperty("newTofix")]
        public object NewTofix { get; set; }

        [JsonProperty("oldTofix")]
        public object OldTofix { get; set; }
    }
}
