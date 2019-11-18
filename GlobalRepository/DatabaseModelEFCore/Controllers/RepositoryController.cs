using DatabaseModelEFCore.Context;
using DatabaseModelEFCore.Models.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;

namespace DatabaseModelEFCore.Controllers
{
    public class RepositoryController
    {
        private RepositoryContext context;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="accountExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<GlobalRepositoryAccounts>> GlobalRepository(Guid accountExId)
        {
            IEnumerable<GlobalRepositoryAccounts> list =
                await Task.Run(() =>
                context.Accounts.GroupJoin
                (context.Systems, a => a.SystemExId, s => s.SystemExId, (a, s) => new { a, s }).SelectMany
                (a => a.s.DefaultIfEmpty(), (a, s) => new { a.a, s }).GroupJoin
                (context.Servers, asy => asy.a.ServerExId, sr => sr.ServerExId, (asy, sr) => new { asy, sr }).SelectMany
                (asyr => asyr.sr.DefaultIfEmpty(), (asyr, a) => 
                    new GlobalRepositoryAccounts
                    {
                        AccountExId = asyr.asy.a.AccountExId,
                        AccountCountryRegionCode = asyr.asy.a.CountryRegionCode,
                        AccountUserId = asyr.asy.a.UserId,
                        AccountName = asyr.asy.a.Name,
                        AccountDescription = asyr.asy.a.Description,
                        AccountType = asyr.asy.a.Type,
                        AccountPasswordExpires = asyr.asy.a.PasswordExpires,
                        AccountTofix = asyr.asy.a.Tofix,

                        ServerExId = asyr.asy.a.ServerExId,
                        ServerName = a.Name,
                        ServerHost = a.Host,
                        ServerCountryRegionCode = a.CountryRegionCode,
                        ServerModel = a.Model,
                        ServerSerialNumber = a.SerialNumber,
                        ServerTechSupport = a.TechSupport,
                        ServerWarrantyExpirationDate = a.WarrantyExpirationDate,
                        ServerCputype = a.Cputype,
                        ServerRam = a.Ram,
                        ServerHardDisk = a.HardDisk,
                        ServerUps = a.Ups,
                        ServerAntivirusSoftware =a.AntivirusSoftware,

                        SystemExId = asyr.asy.s.SystemExId,
                        SystemCompanyName = asyr.asy.s.CompanyName,
                        SystemName = asyr.asy.s.Name,
                        SystemVersion = asyr.asy.s.Version,
                        SystemTechSupport = asyr.asy.s.TechSupport,
                        SystemTechSupportExpDate = asyr.asy.s.TechSupportExpDate
                    }
                    )).ConfigureAwait(true);


            return list;
        }


        //context.Accounts.SelectMany
        //        (a=> context.Systems.Where(sys => a.SystemExId == sys.SystemExId).DefaultIfEmpty(),

        //        (a, sys) => new GlobalRepositoryAccounts
        //        { 

        //        }
        //        )).ConfigureAwait(true);

    }
}
