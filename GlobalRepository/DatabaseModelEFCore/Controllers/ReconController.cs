using DatabaseModelEFCore.Context;
using DatabaseModelEFCore.Models.Recon;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseModelEFCore.Controllers
{
    public class ReconController
    {
        private ReconContext context;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="item"></param>
        public void ReconciliationAccounts(ReconAccounts item)
        {
            var recon = new ReconAccounts
            {
                AccountExId = item.AccountExId,
                CountryRegionCode = item.CountryRegionCode,
                UserExId = item.UserExId,
                SystemExId = item.SystemExId,
                ServerExId = item.ServerExId,
                Name = item.Name,
                Description = item.Description,
                Type = item.Type,
                PasswordExpires = item.PasswordExpires
            };
            context.ReconAccounts.AddAsync(recon);
            context.SaveChangesAsync();
        }
    }
}
