using DB_ModelEFCore.Controllers.Repository.Class;
using DB_ModelEFCore.Models.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Repository
{
    public class GlobalRepositoryData : IUserService
    {
        private readonly RepositoryContext _repo;
        public GlobalRepositoryData()
        {
            _repo = new RepositoryContext();
        }
        /// <summary>
        /// Create new account with system and server. 
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public async Task<Guid> CreateNewAccount(NewAccount item, string userExId)
        {
            var system = new Systems
            {
                CompanyName = item.SystemCompanyName,
                Name = item.SystemName,
                Version = item.SystemVersion,
                TechSupportExpDate = item.SystemTechSupportExpDate
            };
            _repo.Systems.Add(system);
            await _repo.SaveChangesAsync();
            int systemId = system.SystemId;

            var server = new Servers
            {
                Name = item.ServerName,
                Host = item.ServerHost,
                CountryId = _repo.CountryRegion.Where(c => c.CountryRegionCode == item.ServerCountryRegionCode).Select(c => c.CountryId).SingleOrDefault(),
                Model = item.ServerModel,
                SerialNumber = item.ServerSerialNumber,
                WarrantyExpirationDate = item.ServerWarrantyExpirationDate,
                Cputype = item.ServerCputype,
                Ram = item.ServerRam,
                HardDisk = item.ServerHardDisk,
                Ups = item.ServerUps,
                AntivirusSoftware = item.ServerAntivirusSoftware
            };
            _repo.Servers.Add(server);
            await _repo.SaveChangesAsync();
            int serverId = server.ServerId;

            var account = new Accounts
            {
                UserId = _repo.Users.Where(u => u.ExternalId == new Guid(userExId)).Select(u => u.UserId).SingleOrDefault(),
                CountryId = _repo.CountryRegion.Where(c => c.CountryRegionCode == item.AccountCountryRegionCode).Select(c => c.CountryId).SingleOrDefault(),
                SystemId = systemId,
                ServerId = serverId,
                Name = item.AccountName,
                Description = item.AccountDescription,
                Type = item.AccountType,
                PasswordExpires = item.AccountPasswordExpires
            };
            _repo.Accounts.Add(account);
            await _repo.SaveChangesAsync();

            return _repo.Accounts.Where(a => a.AccountId == account.AccountId).Select(a => a.ExternalId).SingleOrDefault();
        }

        /// <summary>
        /// Count GrData
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public async Task<int> GrDataCount(string userExId)
        {
            return await Task.Run(() => _repo.Accounts.Where(a => a.UserId == _repo.Users.Where(u => u.ExternalId == new Guid(userExId)).Select(u => u.UserId).SingleOrDefault()).Count()).ConfigureAwait(true);
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditAccounts). 
        /// </summary>
        /// <param name="userExID"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        public async Task<IEnumerable<GrAccount>> GrData(string userExID, int pageSize, int pageNumber)
        {
            var query = (from u in _repo.Set<Users>().Where(a => a.ExternalId == new Guid(userExID))
                         join
                         a in _repo.Set<Accounts>().Where(a => a.DeleteDate == null) on u.UserId equals a.UserId
                         join
                         c in _repo.Set<CountryRegion>() on a.CountryId equals c.CountryId into country
                         from _country in country.DefaultIfEmpty()
                         select new GrAccount
                         {
                             AccountExId = a.ExternalId,
                             CountryRegionCode = _country.CountryRegionCode,
                             UserName = u.Username,
                             Name = a.Name,
                             Description = a.Description,
                             Type = a.Type,
                             PasswordExpires = a.PasswordExpires,
                             GrServer = from s in _repo.Set<Servers>().Where(x => x.ServerId == a.ServerId)
                                        join
                                        c1 in _repo.Set<CountryRegion>() on s.CountryId equals c1.CountryId into country1
                                        from _country1 in country1.DefaultIfEmpty()
                                        select new GrServer
                                        {
                                            ServerExId = s.ExternalId,
                                            Name = s.Name,
                                            Host = s.Host,
                                            CountryRegionCode = _country1.CountryRegionCode,
                                            Model = s.Model,
                                            SerialNumber = s.SerialNumber,
                                            TechSupport = s.TechSupport,
                                            WarrantyExpirationDate = s.WarrantyExpirationDate,
                                            Cputype = s.Cputype,
                                            Ram = s.Ram,
                                            HardDisk = s.HardDisk,
                                            Ups = s.Ups,
                                            AntivirusSoftware = s.AntivirusSoftware
                                        },
                             GrSystem = from sy in _repo.Set<Systems>().Where(x => x.SystemId == a.SystemId)
                                        select new GrSystem
                                        {
                                            SystemExId = sy.ExternalId,
                                            CompanyName = sy.CompanyName,
                                            Name = sy.Name,
                                            Version = sy.Version,
                                            TechSupport = sy.TechSupport,
                                            TechSupportExpDate = sy.TechSupportExpDate
                                        }
                         }).AsQueryable();
            return await query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToListAsync();
        }
        /// <summary>
        /// Checking if the password and login assigned to the user is correct. 
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<Users> Authenticate(string username, string password)
        {
            var user = await Task.Run(() => _repo.Users.SingleOrDefault(x => x.Username == username && x.Password == password));
            if (user == null)
            {
                return null;
            };
            return user;
        }
        /// <summary>
        /// Create new user. 
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public async Task<Guid> CreateNewUser(NewUser item)
        {
            var user = new Users
            {
                Username = item.Username,
                Password = item.Password,
                Description = item.Description,
                Type = "N"
            };
            _repo.Users.Add(user);
            await _repo.SaveChangesAsync();

            return await _repo.Users.Where(a => a.UserId == user.UserId).Select(a => a.ExternalId).SingleOrDefaultAsync();
        }
        /// <summary>
        /// Delete account
        /// </summary>
        /// <param name="accountExId"></param>
        public async Task DeleteAccount(string accountExId)
        {
            using (var accountContext = new RepositoryContext())
            {
                var account = await Task.Run(() => (from a in accountContext.Accounts.Where(a => a.ExternalId == new Guid(accountExId)) select a).FirstOrDefault());

                if (account != null)
                {
                    account.DeleteDate = DateTime.Now;
                    accountContext.Accounts.Update(account);
                    await accountContext.SaveChangesAsync();
                }
            }

            using (var serverContext = new RepositoryContext())
            {
                var server = await Task.Run(() => (from a in serverContext.Accounts.Where(a => a.ExternalId == new Guid(accountExId))
                                                   join
                                                   s in serverContext.Servers on a.ServerId equals s.ServerId
                                                   select s).FirstOrDefault());
                if (server != null)
                {
                    server.DeleteDate = DateTime.Now;
                    serverContext.Servers.Update(server);
                    await serverContext.SaveChangesAsync();
                }
            }

            using (var systemContext = new RepositoryContext())
            {
                var system = await Task.Run(() => (from a in systemContext.Accounts.Where(a => a.ExternalId == new Guid(accountExId))
                                                   join
                                                   s in systemContext.Systems on a.SystemId equals s.SystemId
                                                   select s).FirstOrDefault());

                if (system != null)
                {
                    system.DeleteDate = DateTime.Now;
                    systemContext.Systems.Update(system);
                    await systemContext.SaveChangesAsync();
                }
            }
        }
        /// <summary>
        /// Check admin guid
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Guid>> AdminCheck()
        {
            return await  Task.Run(() => _repo.Users.Where(a => a.Type == "A" && a.DeleteDate == null).Select(a => a.ExternalId).ToList()).ConfigureAwait(true);
        }
    }
}
