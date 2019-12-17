using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DB_ModelEFCore.Models.Repository
{
    /// <summary>
    /// A class in which information about all account owners is stored. 
    /// </summary>
    public partial class Users
    {
        public Users()
        {
            Accounts = new HashSet<Accounts>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid ExternalId { get; set; }
        public int UserId { get; set; }
        public string Description { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Type { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? EditDate { get; set; }
        public DateTime? DeleteDate { get; set; }

        public virtual ICollection<Accounts> Accounts { get; set; }
    }
}
