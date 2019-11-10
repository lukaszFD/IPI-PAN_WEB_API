using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.RepositoryModels
{
    public partial class Accounts
    {
        public Guid AccountExId { get; set; }
        public string CountryRegionCode { get; set; }
        public int? UserId { get; set; }
        public Guid? SystemExId { get; set; }
        public Guid? ServerExId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public DateTime? PasswordExpires { get; set; }
        public int? Tofix { get; set; }
    }
}
