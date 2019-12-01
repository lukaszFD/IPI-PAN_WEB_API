using System;
using System.Collections.Generic;

namespace DB_ModelEFCore.Models.Repository
{
    public partial class Accounts
    {
        public Guid ExternalId { get; set; }
        public int AccountId { get; set; }
        public int CountryId { get; set; }
        public int? UserId { get; set; }
        public int? SystemId { get; set; }
        public int? ServerId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public DateTime? PasswordExpires { get; set; }
        public int? Tofix { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? EditDate { get; set; }
        public DateTime? DeleteDate { get; set; }
        public int? RecAccountId { get; set; }

        public virtual CountryRegion Country { get; set; }
        public virtual Servers Server { get; set; }
        public virtual Systems System { get; set; }
        public virtual Users User { get; set; }
    }
}
