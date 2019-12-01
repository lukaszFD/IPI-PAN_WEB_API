using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Repository
{
    public partial class CountryRegion
    {
        public CountryRegion()
        {
            Accounts = new HashSet<Accounts>();
            Servers = new HashSet<Servers>();
        }

        public int CountryId { get; set; }
        public string CountryRegionCode { get; set; }
        public string Name { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? EditDate { get; set; }
        public DateTime? DeleteDate { get; set; }

        public virtual ICollection<Accounts> Accounts { get; set; }
        public virtual ICollection<Servers> Servers { get; set; }
    }
}
