using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.Models.Repository
{
    public partial class Systems
    {
        public Systems()
        {
            Accounts = new HashSet<Accounts>();
        }
        public Guid SystemExId { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public int? TechSupport { get; set; }
        public DateTime TechSupportExpDate { get; set; }

        public virtual ICollection<Accounts> Accounts { get; set; }
    }
}
