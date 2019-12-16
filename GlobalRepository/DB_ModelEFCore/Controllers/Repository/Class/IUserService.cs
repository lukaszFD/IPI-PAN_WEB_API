using DB_ModelEFCore.Models.Repository;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Repository.Class
{
    /// <summary>
    /// Inerface to query the method that checks the password and login saved on the database. 
    /// </summary>
    public interface IUserService
    {
        Task<Users> Authenticate(string username, string password);
    }
}
