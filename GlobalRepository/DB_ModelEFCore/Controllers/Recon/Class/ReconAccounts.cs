using System;

namespace DB_ModelEFCore.Controllers.Recon.Class
{
    /// <summary>
    /// Reconciliation of data for accounts. 
    /// </summary>
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
