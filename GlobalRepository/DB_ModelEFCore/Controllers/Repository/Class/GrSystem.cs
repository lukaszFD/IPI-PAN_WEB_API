using System;
using System.Collections.Generic;
using System.Text;

namespace DB_ModelEFCore.Controllers.Repository.Class
{
    public partial class GrSystem
    {
        public Guid SystemExId { get; set; }
        public string CompanyName { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public int? TechSupport { get; set; }
        public DateTime TechSupportExpDate { get; set; }
    }
}
