using System;
using System.Collections.Generic;
using System.Text;

namespace DB_ModelEFCore.Controllers.Repository.Class
{
    public partial class GrAccount
    {
        public Guid? AccountExId { get; set; }
        public string CountryRegionCode { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public DateTime? PasswordExpires { get; set; }
        public IEnumerable<GrSystem> GrSystem { get; set; }
        public IEnumerable<GrServer> GrServer { get; set; }
    }
}
