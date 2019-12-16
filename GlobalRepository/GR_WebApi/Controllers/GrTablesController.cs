using DB_ModelEFCore.Controllers.Documentation;
using DB_ModelEFCore.Models.Documentation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;


namespace GR_WebApi.Controllers
{
    /// <summary>
    /// Class for extracting information from the documentation of the repository.
    /// </summary>
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [ApiController]
    [Route("[controller]")]
    public class GrTablesController : ControllerBase
    {
        private readonly ILogger<GrTablesController> _logger;
        private readonly string _userEx;

        public GrTablesController(ILogger<GrTablesController> logger)
        {
            _logger = logger;
            _userEx = Thread.CurrentPrincipal.Identity.Name;
        }
        /// <summary>
        /// Checking how many objects are available for download from the documentation. 
        /// </summary>
        /// <returns></returns>
        [HttpGet("Documentation/All/Count")]
        public async Task<ActionResult<int>> GetGlobalRespositoryDocumentationCount()
        {
            int data;
            try
            {
                _logger.LogInformation($"GetGlobalRespositoryDocumentationCount for user : {_userEx}");
                data = await new Documentation().DBDocumentationCount();
                if (data == 0)
                {
                    return NotFound(new { message = $"Not found documentation." });
                }
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = $"There are {data} elements in the documentation." });
        }
        /// <summary>
        /// Getting all the objects from the documentation. 
        /// </summary>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet("Documentation/All")]
        public async Task<ActionResult<IEnumerable<GrTables>>> GetGlobalRespositoryDocumentation([FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            IEnumerable<GrTables> data;
            try
            {
                _logger.LogInformation($"GetGlobalRespositoryDocumentation for user : {_userEx}");
                data = await new Documentation().DBDocumentation(pageNumber, pageSize);

                if (data == null)
                {
                    _logger.LogWarning("No data found for GetGlobalRespositoryDocumentation/Documentation/All");
                    return NotFound(new { message = $"No data found in documentation." });
                }
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(data);
        }
        /// <summary>
        /// To retrieve objects from the documentation with table and schema names. 
        /// </summary>
        /// <param name="schema_name"></param>
        /// <param name="table_name"></param>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet("Documentation/{schema_name}/{table_name}")]
        public async Task<ActionResult<IEnumerable<GrTables>>> GetSpecyfikInformationDocumentation(string schema_name, string table_name, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            IEnumerable<GrTables> data;
            try
            {
                _logger.LogInformation($"GetSpecyfikInformationDocumentation for user : {_userEx}");
                data = await new Documentation().DBDocumentation(schema_name, table_name, pageNumber, pageSize);

                if (data == null)
                {
                    _logger.LogWarning($"No data found for GetGlobalRespositoryDocumentation/Documentation/{schema_name}/{table_name}");
                    return NotFound(new { message = $"No data found for GetGlobalRespositoryDocumentation/Documentation/{schema_name}/{table_name}" });
                }
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(data);
        }
    }
}
