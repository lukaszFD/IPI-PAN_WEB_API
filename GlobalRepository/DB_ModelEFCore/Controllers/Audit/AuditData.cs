using DB_ModelEFCore.Controllers.Audit.Class;
using DB_ModelEFCore.Models.Audit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Audit
{
    class AuditData
    {
        private AuditContext context;
        //public async Task<IEnumerable<AuditAccounts>> Accounts(string userName)
        //{
        //    IEnumerable<AuditAccounts> list =
        //        await Task.Run(() => context.Accounts.Where(a => a.UserName == userName).ToArray()).ConfigureAwait(true);
        //    return list;
        //}
    }
}
