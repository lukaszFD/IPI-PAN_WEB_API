using DB_ModelEFCore.Controllers.Audit.Class;
using DB_ModelEFCore.Models.Audit;
using DB_ModelEFCore.Models.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Audit
{
    class AuditData
    {
        private readonly RepositoryContext _repo;
        private readonly AuditContext _audit;
        public AuditData()
        {
            _repo = new RepositoryContext();
            _audit = new AuditContext();
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditAccounts). 
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditAccounts>> AuditAccounts(string userName)
        {
            IEnumerable<AuditAccounts> list = await Task.Run(() =>
                (   
                    from a in _audit.Accounts
                    join 
                    u1 in _repo.Users.Where(a => a.Description == userName) on a.NewUserId equals u1.UserId
                    join 
                    u2 in _repo.Users on a.OldUserId equals u2.UserId
                    join 
                    c1 in _repo.CountryRegion on a.NewCountryId equals c1.CountryId
                    join
                    c2 in _repo.CountryRegion on a.OldCountryId equals c2.CountryId
                    join 
                    s1 in _repo.Servers on a.NewServerId equals s1.ServerId
                    join
                    s2 in _repo.Servers on a.OldServerId equals s2.ServerId
                    join 
                    sy1 in _repo.Systems on a.NewSystemId equals sy1.SystemId
                    join
                    sy2 in _repo.Systems on a.OldSystemId equals sy2.SystemId
                    select new AuditAccounts
                    { 
                        AccountExId = a.ExternalId,
                        UserName = a.UserName,
                        DateFrom = a.DateFrom,
                        DateTo = a.DateTo,
                        NewCountryRegionCode = c1.CountryRegionCode,
                        OldCountryRegionCode = c2.CountryRegionCode,
                        NewUserName = u1.Description,
                        OldUserName = u2.Description,
                        NewSystemExId = sy1.ExternalId,
                        OldSystemExId = sy2.ExternalId,
                        NewServerExId = s1.ExternalId,
                        OldServerExId = s2.ExternalId,
                        NewName = a.NewName,
                        OldName = a.OldName,
                        NewDescription = a.NewDescription,
                        OldDescription = a.OldDescription,
                        NewType = a.NewType,
                        OldType =a.OldType,
                        NewPasswordExpires = a.NewPasswordExpires,
                        OldPasswordExpires = a.OldPasswordExpires,
                        NewTofix = a.NewTofix,
                        OldTofix = a.OldTofix
                    }
                ));
            return  list;
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditServers). 
        /// </summary>
        /// <param name="serverExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditServers>> AuditServers(Guid serverExId)
        {
            IEnumerable<AuditServers> list = await Task.Run(() =>
                (
                    from s in _audit.Servers.Where(s => s.ExternalId == serverExId)
                    join
                    c1 in _repo.CountryRegion on s.NewCountryId equals c1.CountryId
                    join
                    c2 in _repo.CountryRegion on s.OldCountryId equals c2.CountryId
                    select new AuditServers
                    {
                        ServerExId = s.ExternalId,
                        UserName = s.UserName,
                        DateFrom = s.DateFrom,
                        DateTo = s.DateTo,
                        NewName = s.NewName,
                        OldName = s.OldName,
                        NewHost = s.NewHost,
                        OldHost = s.OldHost,
                        NewCountryRegionCode = c1.CountryRegionCode,
                        OldCountryRegionCode = c2.CountryRegionCode,
                        NewModel = s.NewModel,
                        OldModel = s.OldModel,
                        NewSerialNumber = s.NewSerialNumber,
                        OldSerialNumber = s.OldSerialNumber,
                        NewTechSupport = s.NewTechSupport,
                        OldTechSupport =s.OldTechSupport,
                        NewWarrantyExpirationDate = s.NewWarrantyExpirationDate,
                        OldWarrantyExpirationDate = s.OldWarrantyExpirationDate,
                        NewCputype = s.NewCputype,
                        OldCputype = s.OldCputype,
                        NewRam = s.NewRam,
                        OldRam = s.OldRam,
                        NewHardDisk =s.NewHardDisk,
                        OldHardDisk = s.OldHardDisk,
                        NewUps = s.NewUps,
                        OldUps = s.OldUps,
                        NewAntivirusSoftware = s.NewAntivirusSoftware,
                        OldAntivirusSoftware = s.OldAntivirusSoftware
                    }
                ));
            return list;
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditSystems). 
        /// </summary>
        /// <param name="systemExId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditSystems>> AuditSystems(Guid systemExId)
        {
            IEnumerable<AuditSystems> list = await Task.Run(() =>
                (
                    from s in _audit.Systems.Where(s => s.ExternalId == systemExId)
                    select new AuditSystems
                    {
                        SystemExId = s.ExternalId,
                        UserName = s.UserName,
                        DateFrom = s.DateFrom,
                        DateTo = s.DateTo,
                        NewCompanyName = s.NewCompanyName,
                        OldCompanyName = s.OldCompanyName,
                        NewName = s.NewName,
                        OldName = s.OldName,
                        NewVersion = s.NewVersion,
                        OldVersion = s.OldVersion,
                        NewTechSupport = s.NewTechSupport,
                        OldTechSupport = s.OldTechSupport,
                        NewTechSupportExpDate = s.NewTechSupportExpDate,
                        OldTechSupportExpDate = s.OldTechSupportExpDate
                    }
                ));
            return list;
        }
    }
}
