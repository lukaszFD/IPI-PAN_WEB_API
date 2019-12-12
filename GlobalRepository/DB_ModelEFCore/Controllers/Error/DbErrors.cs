using DB_ModelEFCore.Models.Error;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Error
{
    public class DbErrors
    {
        private readonly ErrorContext _err;
        DbErrors()
        {
            _err = new ErrorContext();
        }
        /// <summary>
        /// This method returns all objects available in web communication (ErrorMessages). 
        /// </summary>
        /// <returns></returns>
        public async Task<List<ErrorMessages>> DBErrorMessages()
        {
            List<ErrorMessages> list = await Task.Run(() => _err.ErrorMessages.ToList()).ConfigureAwait(true);
            return list;
        }
    }
}
