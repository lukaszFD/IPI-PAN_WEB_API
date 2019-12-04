using DB_ModelEFCore.Controllers.Recon.Class;
using DB_ModelEFCore.Models.Recon;
using System;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Recon
{
    public class ReconciliationData
    {
        private readonly ReconContext _context;
        public ReconciliationData()
        {
            _context = new ReconContext();
        }
        /// <summary>
        /// Reconciliation of data for accounts. 
        /// </summary>
        /// <param name="item"></param>
        public async Task ReconciliationAccounts(ReconAccounts item)
        {
            var recon = new Accounts
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
            _context.Accounts.Add(recon);
            await _context.SaveChangesAsync();
        }
        /// <summary>
        /// Reconciliation of data for servers. 
        /// </summary>
        /// <param name="item"></param>
        public async Task ReconciliationServers(ReconServers item)
        {
            var recon = new Servers
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
                HardDisk = item.HardDisk,
                Ups = item.Ups,
                AntivirusSoftware = item.AntivirusSoftware
            };
            _context.Servers.Add(recon);
            await _context.SaveChangesAsync();
        }
        /// <summary>
        /// Reconciliation of data for systems. 
        /// </summary>
        /// <param name="item"></param>
        public async Task ReconciliationSystems(ReconSystems item)
        {
            var recon = new Systems
            {
                SystemExId = item.SystemExId,
                CompanyName = item.CompanyName,
                Name = item.Name,
                Version = item.Version,
                TechSupportExpDate = item.TechSupportExpDate
            };
            _context.Systems.Add(recon);
            await _context.SaveChangesAsync();
        }
    }
}
