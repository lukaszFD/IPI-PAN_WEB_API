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
        /// <returns></returns>
        public async Task<List<GrTables>> DBDocumentation()
        {
            List<GrTables> list = await Task.Run(() => new DocumentationContext().GrTables.ToList()).ConfigureAwait(true);
            return list;
        }
        /// <summary>
        /// This method returns objects available in network communication (documentation). It is necessary to specify two parameters. 
        /// </summary>
        /// <param name="schema_name"></param>
        /// <param name="table_name"></param>
        /// <returns></returns>
        public async Task<List<GrTables>> DBDocumentation(string schema_name, string table_name)
        {
            List<GrTables> list = 
                await Task.Run(() => 
                new DocumentationContext().GrTables.Where(x => x.TableName == table_name & x.SchemaName == schema_name).ToList()
                                ).ConfigureAwait(true);
            return list;
        }
    }
}
