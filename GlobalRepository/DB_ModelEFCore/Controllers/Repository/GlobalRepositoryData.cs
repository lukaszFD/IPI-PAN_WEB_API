using DB_ModelEFCore.Controllers.Repository.Class;
using DB_ModelEFCore.Models.Repository;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Repository
{
    public class GlobalRepositoryData 
    {
        private readonly RepositoryContext _repo;
        public GlobalRepositoryData()
        {
            _repo = new RepositoryContext();
        }
        /// <summary>
        /// Count GrData
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public async Task<int> GrDataCount(string userName)
        {
            return await Task.Run(() => _repo.Accounts.Where(a => a.UserId == _repo.Users.Where(u => u.Description == userName).Select(u => u.UserId).SingleOrDefault()).Count()).ConfigureAwait(true);
        }
        /// <summary>
        /// This method returns all objects available in web communication (AuditAccounts). 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
            public async Task<IEnumerable<GrAccount>> GrData(string userName, int pageSize, int pageNumber)
        {
            var query = (from u in _repo.Set<Users>().Where(a => a.Description == userName)
                         join
                         a in _repo.Set<Accounts>() on u.UserId equals a.UserId
                         join
                         c in _repo.Set<CountryRegion>() on a.CountryId equals c.CountryId into country
                         from _country in country.DefaultIfEmpty()
                         select new GrAccount
                         {
                             AccountExId = a.ExternalId,
                             CountryRegionCode = _country.CountryRegionCode,
                             UserName = u.Description,
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

        public async Task<Users> Authenticate(string username, string password)
        {
            var user = await Task.Run(() => _repo.Users.SingleOrDefault(x => x.Username == username && x.Password == password));
            if (user == null)
            {
                return null;
            };
            return user;
        }
    }
}
