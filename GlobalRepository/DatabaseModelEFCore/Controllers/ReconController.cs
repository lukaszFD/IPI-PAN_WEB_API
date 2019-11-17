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
        /// Reconciliation of data for accounts. 
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
        /// <summary>
        /// Reconciliation of data for servers. 
        /// </summary>
        /// <param name="item"></param>
        public void ReconciliationServers(ReconServers item)
        {
            var recon = new ReconServers
            {
                ServerExId = item.ServerExId,
                Name = item.Name,
                Host = item.Host,
                CountryRegionCode = item.CountryRegionCode,
                Model = item.Model,
                SerialNumber = item.SerialNumber,
                WarrantyExpirationDate = item.WarrantyExpirationDate,
                Cputype = item.Cputype,
                Ram = item.Ram,
                HardDisk =  item.HardDisk,
                Ups = item.Ups,
                AntivirusSoftware = item.AntivirusSoftware
            };
            context.ReconServers.AddAsync(recon);
            context.SaveChangesAsync();
        }
        /// <summary>
        /// Reconciliation of data for systems. 
        /// </summary>
        /// <param name="item"></param>
        public void ReconciliationSystems(ReconSystems item)
        {
            var recon = new ReconSystems
            {
                SystemExId = item.SystemExId,
                CompanyName = item.CompanyName,
                Name = item.Name,
                Version = item.Version,
                TechSupportExpDate = item.TechSupportExpDate
            };
            context.ReconSystems.AddAsync(recon);
            context.SaveChangesAsync();
        }

    }
}
