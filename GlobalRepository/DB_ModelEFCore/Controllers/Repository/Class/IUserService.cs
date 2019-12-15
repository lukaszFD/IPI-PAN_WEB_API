using DB_ModelEFCore.Models.Repository;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Repository.Class
{
    public interface IUserService
    {
        Task<Users> Authenticate(string username, string password);
    }
}
