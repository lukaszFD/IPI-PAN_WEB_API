using DB_ModelEFCore.Controllers.Audit.Class;
using DB_ModelEFCore.Models.Audit;
using DB_ModelEFCore.Models.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AudAccounts = DB_ModelEFCore.Models.Audit.Accounts;
using AudServers = DB_ModelEFCore.Models.Audit.Servers;
using AudSystems = DB_ModelEFCore.Models.Audit.Systems;
using RepoServers = DB_ModelEFCore.Models.Repository.Servers;
using RepoSystems = DB_ModelEFCore.Models.Repository.Systems;
using RepoUsers = DB_ModelEFCore.Models.Repository.Users;
using RepoCountryRegion = DB_ModelEFCore.Models.Repository.CountryRegion;

namespace DB_ModelEFCore.Controllers.Audit
{
    public class AuditData
    {
        private readonly RepositoryContext _repo;
        private readonly AuditContext _audit;
        public AuditData()
        {
            _repo = new RepositoryContext();
            _audit = new AuditContext();
        }
        /// <summary>
        /// Count accounts in audit
        /// </summary>
        /// <param name="accountExId"></param>
        /// <returns></returns>
        public async Task<int> AuditAccountsCount(string accountExId)
        {
            return await Task.Run(() => _audit.Accounts.Where(a => a.ExternalId == new Guid(accountExId)).Count()).ConfigureAwait(true);
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditAccounts). 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditAccounts>> AuditAccounts(string accountExId, int pageSize, int pageNumber)
        {
            var query = (from
                        a in _audit.Set<AudAccounts>().Where(a => a.ExternalId == new Guid(accountExId))
                         join
                         u1 in _repo.Set<RepoUsers>().ToList() on a.NewUserId equals u1.UserId into user1
                         join
                         u2 in _repo.Set<RepoUsers>().ToList() on a.OldUserId equals u2.UserId into user2
                         join
                         c1 in _repo.Set<RepoCountryRegion>().ToList() on a.NewCountryId equals c1.CountryId into country1
                         join
                         c2 in _repo.Set<RepoCountryRegion>().ToList() on a.OldCountryId equals c2.CountryId into country2
                         join
                        s1 in _repo.Set<RepoServers>().ToList() on a.NewServerId equals s1.ServerId into server1
                         join
                         s2 in _repo.Set<RepoServers>().ToList() on a.OldServerId equals s2.ServerId into server2
                         join
                         sy1 in _repo.Set<RepoSystems>().ToList() on a.NewSystemId equals sy1.SystemId into system1
                         join
                         sy2 in _repo.Set<RepoSystems>().ToList() on a.OldSystemId equals sy2.SystemId into system2
                         from _user1 in user1.DefaultIfEmpty()
                         from _user2 in user2.DefaultIfEmpty()
                         from _country1 in country1.DefaultIfEmpty()
                         from _country2 in country2.DefaultIfEmpty()
                         from _server1 in server1.DefaultIfEmpty()
                         from _server2 in server2.DefaultIfEmpty()
                         from _system1 in system1.DefaultIfEmpty()
                         from _system2 in system2.DefaultIfEmpty()

                         select new AuditAccounts
                         {
                             AccountExId = a.ExternalId,
                             UserName = a.UserName,
                             DateFrom = a.DateFrom,
                             DateTo = a.DateTo,
                             NewCountryRegionCode = _country1.CountryRegionCode,
                             OldCountryRegionCode = _country2.CountryRegionCode,
                             NewUserName = _user1.Description,
                             OldUserName = _user2.Description,
                             NewSystemExId = _system1.ExternalId,
                             OldSystemExId = _system2.ExternalId,
                             NewServerExId = _server1.ExternalId,
                             OldServerExId = _server2.ExternalId,
                             NewName = a.NewName,
                             OldName = a.OldName,
                             NewDescription = a.NewDescription,
                             OldDescription = a.OldDescription,
                             NewType = a.NewType,
                             OldType = a.OldType,
                             NewPasswordExpires = a.NewPasswordExpires,
                             OldPasswordExpires = a.OldPasswordExpires,
                             NewTofix = a.NewTofix,
                             OldTofix = a.OldTofix
                         }).AsQueryable();
            return await query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToListAsync();
        }
        /// <summary>
        /// Count servers in audit
        /// </summary>
        /// <param name="serverExId"></param>
        /// <returns></returns>
        public async Task<int> AuditServersCount(string serverExId)
        {
            return await Task.Run(() => _audit.Servers.Where(a => a.ExternalId == new Guid(serverExId)).Count()).ConfigureAwait(true);
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditServers).
        /// </summary>
        /// <param name="serverExId"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditServers>> AuditServers(string serverExId, int pageSize, int pageNumber)
        {
            var query = (from s in _audit.Set<AudServers>().Where(s => s.ExternalId == new Guid(serverExId))
                         join
                         c1 in _repo.Set<RepoCountryRegion>().ToList() on s.NewCountryId equals c1.CountryId into country1
                         join
                         c2 in _repo.Set<RepoCountryRegion>().ToList() on s.OldCountryId equals c2.CountryId into country2
                         from _country1 in country1.DefaultIfEmpty()
                         from _country2 in country2.DefaultIfEmpty()
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
                             NewCountryRegionCode = _country1.CountryRegionCode,
                             OldCountryRegionCode = _country2.CountryRegionCode,
                             NewModel = s.NewModel,
                             OldModel = s.OldModel,
                             NewSerialNumber = s.NewSerialNumber,
                             OldSerialNumber = s.OldSerialNumber,
                             NewTechSupport = s.NewTechSupport,
                             OldTechSupport = s.OldTechSupport,
                             NewWarrantyExpirationDate = s.NewWarrantyExpirationDate,
                             OldWarrantyExpirationDate = s.OldWarrantyExpirationDate,
                             NewCputype = s.NewCputype,
                             OldCputype = s.OldCputype,
                             NewRam = s.NewRam,
                             OldRam = s.OldRam,
                             NewHardDisk = s.NewHardDisk,
                             OldHardDisk = s.OldHardDisk,
                             NewUps = s.NewUps,
                             OldUps = s.OldUps,
                             NewAntivirusSoftware = s.NewAntivirusSoftware,
                             OldAntivirusSoftware = s.OldAntivirusSoftware
                         }
                    ).AsQueryable();
            return await query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToListAsync();
        }
        /// <summary>
        /// Count systems in audit
        /// </summary>
        /// <param name="systemExId"></param>
        /// <returns></returns>
        public async Task<int> AuditSystemsCount(string systemExId)
        {
            return await Task.Run(() => _audit.Systems.Where(a => a.ExternalId == new Guid(systemExId)).Count()).ConfigureAwait(true);
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditSystems). 
        /// </summary>
        /// <param name="systemExId"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        public async Task<IEnumerable<AuditSystems>> AuditSystems(string systemExId, int pageSize, int pageNumber)
        {
            var query = (from s in _audit.Set<AudSystems>().Where(s => s.ExternalId == new Guid(systemExId))
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
                         }).AsQueryable();
            return await query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToListAsync();
        }
    }
}
