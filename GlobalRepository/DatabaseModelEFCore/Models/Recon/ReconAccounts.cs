using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.Models.Recon
{
    public partial class ReconAccounts
    {
        public Guid? AccountExId { get; set; }
        public string CountryRegionCode { get; set; }
        public Guid? UserExId { get; set; }
        public Guid? SystemExId { get; set; }
        public Guid? ServerExId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public DateTime? PasswordExpires { get; set; }
    }
}
