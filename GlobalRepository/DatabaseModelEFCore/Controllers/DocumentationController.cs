using DatabaseModelEFCore.Context;
using DatabaseModelEFCore.Models.Documentation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DatabaseModelEFCore.Controllers
{
    public class DocumentationController
    {
        private DocumentationContext context;
        /// <summary>
        /// This method returns all objects available in web communication (documentation). 
        /// </summary>
        /// <returns>IEnumerable<Views></returns>
        public async Task<IEnumerable<Views>> Documentation()
        {

            IEnumerable <Views> list = await Task.Run(() => context.Views.ToArray()).ConfigureAwait(true);
            return list;
        }
    }
}
