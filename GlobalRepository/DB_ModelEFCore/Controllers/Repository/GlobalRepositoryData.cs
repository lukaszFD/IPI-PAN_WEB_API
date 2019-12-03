﻿using DB_ModelEFCore.Controllers.Repository.Class;
using DB_ModelEFCore.Models.Repository;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Repository
{
    class GlobalRepositoryData
    {
        private readonly RepositoryContext _repo;
        public GlobalRepositoryData()
        {
            _repo = new RepositoryContext();
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditAccounts). 
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public async Task<IEnumerable<GrAccount>> GrAccounts(string userName)
        {
            IEnumerable<GrAccount> list = await Task.Run(() =>
                (
                    from a in _repo.Accounts
                    join
                    u in _repo.Users.Where(a => a.Description == userName) on a.UserId equals u.UserId
                    join
                    c in _repo.CountryRegion on a.CountryId equals c.CountryId
                    select new GrAccount
                    {
                        AccountExId = a.ExternalId,
                        CountryRegionCode = c.CountryRegionCode,
                        UserName = u.Description,
                        Name = a.Name,
                        Description = a.Description,
                        Type = a.Type,
                        PasswordExpires = a.PasswordExpires,
                        GrServer = from s in _repo.Servers.Where(x=> x.ServerId == a.ServerId)
                                    join
                                    c1 in _repo.CountryRegion on s.CountryId equals c1.CountryId
                                    select new GrServer
                                    { 
                                        ServerExId = s.ExternalId,
                                        Name = s.Name,
                                        Host = s.Host,
                                        CountryRegionCode = c1.CountryRegionCode,
                                        Model = s.Model,
                                        SerialNumber = s.SerialNumber,
                                        TechSupport = s.TechSupport,
                                        WarrantyExpirationDate = s.WarrantyExpirationDate,
                                        Cputype = s.Cputype,
                                        Ram = s.Ram,
                                        HardDisk =s.HardDisk,
                                        Ups = s.Ups,
                                        AntivirusSoftware = s.AntivirusSoftware
                                    },
                        GrSystem = from sy in _repo.Systems.Where(x=> x.SystemId == a.SystemId)
                                   select new GrSystem
                                   { 
                                        SystemExId = sy.ExternalId,
                                        CompanyName = sy.CompanyName,
                                        Name = sy.Name,
                                        Version = sy.Version,
                                        TechSupport = sy.TechSupport,
                                        TechSupportExpDate = sy.TechSupportExpDate
                                   }
                    }
                ));
            return list;
        }
    }
}
