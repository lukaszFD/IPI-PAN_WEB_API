using DB_ModelEFCore.Controllers.Documentation;
using DB_ModelEFCore.Models.Documentation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class GrTablesController : ControllerBase
    {
        private readonly ILogger<GrTablesController> _logger;

        public GrTablesController(ILogger<GrTablesController> logger)
        {
            _logger = logger;
        }
        [HttpGet("Documentation/All")]
        public async Task<ActionResult<List<GrTables>>> GetGlobalRespositoryDocumentation()
        {
            var data = await new Documentation().DBDocumentation();

            if (data == null)
            {
                _logger.LogWarning("No data found for GetGlobalRespositoryDocumentation/Documentation/All");
                return NotFound();
            }
            return data;
        }
        [HttpGet("Documentation/{schema_name}/{table_name}")]
        public async Task<ActionResult<List<GrTables>>> GetSpecyfikInformationDocumentation(string schema_name, string table_name)
        {
            var data = await new Documentation().DBDocumentation(schema_name, table_name);

            if (data == null)
            {
                _logger.LogWarning("No data found for GetGlobalRespositoryDocumentation/Documentation/{schema_name}/{table_name}");
                return NotFound();
            }
            return data;
        }
    }
}
