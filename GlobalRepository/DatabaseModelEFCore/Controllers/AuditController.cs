using DatabaseModelEFCore.Context;
using DatabaseModelEFCore.Models.Audit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatabaseModelEFCore.Controllers
{
    public class AuditController
    {
        /// <summary>
        /// Asynchronous methods for downloading audit data from sql server.
        /// </summary>
        #region using guid
        private AuditContext context;
        /// <summary>
        /// The method returns the accounts that were saved in the audit. 
        /// </summary>
        /// <param name="accountExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditAccounts>> Accounts(Guid accountExId)
        {
            IEnumerable<AuditAccounts> list = 
                await Task.Run(() => context.AuditAccounts.Where(a => a.AccountExId == accountExId).ToArray()).ConfigureAwait(true);
            return list;
        }
        /// <summary>
        /// The method returns the servers that were saved in the audit. 
        /// </summary>
        /// <param name="serverExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditServers>> Servers(Guid serverExId)
        {
            IEnumerable<AuditServers> list =
                await Task.Run(() => context.AuditServers.Where(a => a.ServerExId == serverExId).ToArray()).ConfigureAwait(true);
            return list;
        }
        /// <summary>
        /// The method returns the systems that were saved in the audit. 
        /// </summary>
        /// <param name="systemExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditSystems>> Systems(Guid systemExId)
        {
            IEnumerable<AuditSystems> list =
                await Task.Run(() => context.AuditSystems.Where(a => a.SystemExId == systemExId).ToArray()).ConfigureAwait(true);
            return list;
        }
        #endregion using guid

        #region using userName
        /// <summary>
        /// The method returns the accounts that were saved in the audit. 
        /// </summary>
        /// <param name="accountExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditAccounts>> Accounts(string userName)
        {
            IEnumerable<AuditAccounts> list =
                await Task.Run(() => context.AuditAccounts.Where(a => a.UserName == userName).ToArray()).ConfigureAwait(true);
            return list;
        }
        /// <summary>
        /// The method returns the servers that were saved in the audit. 
        /// </summary>
        /// <param name="serverExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditServers>> Servers(string userName)
        {
            IEnumerable<AuditServers> list =
                await Task.Run(() => context.AuditServers.Where(a => a.UserName == userName).ToArray()).ConfigureAwait(true);
            return list;
        }
        /// <summary>
        /// The method returns the systems that were saved in the audit. 
        /// </summary>
        /// <param name="systemExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditSystems>> Systems(string userName)
        {
            IEnumerable<AuditSystems> list =
                await Task.Run(() => context.AuditSystems.Where(a => a.UserName == userName).ToArray()).ConfigureAwait(true);
            return list;
        }
        #endregion using userName
    }
}
