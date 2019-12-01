using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Repository
{
    public partial class Systems
    {
        public Systems()
        {
            Accounts = new HashSet<Accounts>();
        }

        public Guid ExternalId { get; set; }
        public int SystemId { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public int? TechSupport { get; set; }
        public DateTime TechSupportExpDate { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? EditDate { get; set; }
        public DateTime? DeleteDate { get; set; }
        public int? RecSystemId { get; set; }

        public virtual ICollection<Accounts> Accounts { get; set; }
    }
}
