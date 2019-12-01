using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Repository
{
    public partial class Users
    {
        public Users()
        {
            Accounts = new HashSet<Accounts>();
        }

        public Guid ExternalId { get; set; }
        public int UserId { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? EditDate { get; set; }
        public DateTime? DeleteDate { get; set; }

        public virtual ICollection<Accounts> Accounts { get; set; }
    }
}
