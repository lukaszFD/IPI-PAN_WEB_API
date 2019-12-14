using DB_ModelEFCore.Models.Documentation;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DB_ModelEFCore.Controllers.Documentation
{
    public class Documentation
    {
        private readonly DocumentationContext _doc;
        public Documentation()
        {
            _doc = new DocumentationContext();
        }
        /// <summary>
        /// Count DBDocumentation
        /// </summary>
        /// <returns></returns>
        public async Task<int> DBDocumentationCount()
        {
            return await Task.Run(() => _doc.GrTables.Count()).ConfigureAwait(true);
        }
        /// <summary>
        /// This method returns objects available in network communication (documentation). It is necessary to specify parameters (pageSize,pageNumber). 
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        public async Task<List<GrTables>> DBDocumentation(int pageSize, int pageNumber)
        {
            var query = _doc.Set<GrTables>().AsQueryable();
            return await query.Skip((pageNumber - 1) * pageSize).Take(pageNumber).ToListAsync();
        }
        /// <summary>
        /// This method returns objects available in network communication (documentation). It is necessary to specify parameters (schema_name,table_name,pageSize,pageNumber). 
        /// </summary>
        /// <param name="schema_name"></param>
        /// <param name="table_name"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        public async Task<List<GrTables>> DBDocumentation(string schema_name, string table_name, int pageSize, int pageNumber)
        {
            var query = _doc.Set<GrTables>().Where(x => x.TableName == table_name & x.SchemaName == schema_name).AsQueryable();
            return await query.Skip((pageNumber - 1) * pageSize).Take(pageNumber).ToListAsync();
        }
    }
}
