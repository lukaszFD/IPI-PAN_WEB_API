using DB_ModelEFCore.Controllers.Recon.Class;
using DB_ModelEFCore.Models.Recon;

namespace DB_ModelEFCore.Controllers.Recon
{
    public class ReconciliationData
    {
        private ReconContext context;
        /// <summary>
        /// Reconciliation of data for accounts. 
        /// </summary>
        /// <param name="item"></param>
        public void ReconciliationAccounts(ReconAccounts item)
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
            context.Accounts.AddAsync(recon);
            context.SaveChangesAsync();
        }
        /// <summary>
        /// Reconciliation of data for servers. 
        /// </summary>
        /// <param name="item"></param>
        public void ReconciliationServers(ReconServers item)
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
            context.Servers.AddAsync(recon);
            context.SaveChangesAsync();
        }
        /// <summary>
        /// Reconciliation of data for systems. 
        /// </summary>
        /// <param name="item"></param>
        public void ReconciliationSystems(ReconSystems item)
        {
            var recon = new Systems
            {
                SystemExId = item.SystemExId,
                CompanyName = item.CompanyName,
                Name = item.Name,
                Version = item.Version,
                TechSupportExpDate = item.TechSupportExpDate
            };
            context.Systems.AddAsync(recon);
            context.SaveChangesAsync();
        }
    }
}
