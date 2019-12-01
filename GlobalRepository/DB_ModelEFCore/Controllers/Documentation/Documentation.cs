using DB_ModelEFCore.Models.Documentation;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Documentation
{
    public class Documentation
    {
        private DocumentationContext context;
        /// <summary>
        /// This method returns all objects available in web communication (documentation). 
        /// </summary>
        /// <returns>IEnumerable<Views></returns>
        public async Task<List<GrTables>> DBDocumentation()
        {

            List<GrTables> list = await Task.Run(() => new DocumentationContext().GrTables.ToList()).ConfigureAwait(true);
            return list;

        }
    }
}
