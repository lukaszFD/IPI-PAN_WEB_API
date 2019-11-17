using System;
using System.Collections.Generic;

namespace DatabaseModelEFCore.Models.Repository
{
    public partial class Systems
    {
        public Guid SystemExId { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public int? TechSupport { get; set; }
        public DateTime TechSupportExpDate { get; set; }
    }
}
