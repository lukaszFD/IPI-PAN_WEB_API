using DB_ModelEFCore.Controllers.Repository;
using DB_ModelEFCore.Controllers.Repository.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [Route("[controller]")]
    [ApiController]
    public class GlobalRepositoryDataController : ControllerBase
    {
        private readonly ILogger<GlobalRepositoryDataController> _logger;

        public GlobalRepositoryDataController(ILogger<GlobalRepositoryDataController> logger)
        {
            _logger = logger;
        }

        [HttpGet("/AllAccounts")]
        public async Task<ActionResult<IEnumerable<GrAccount>>> GetGlobalRespositoryData(string userName, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            _logger.LogInformation($"Data downloading for GrAccount by {userName}");
            var data = await new GlobalRepositoryData().GrData(userName, pageSize, pageNumber);

            if (data == null)
            {
                _logger.LogWarning("No data found for GetGlobalRespositoryData()");
                return NotFound();
            }
            return Ok(data);
        }

        [HttpGet("/AllAccounts/Count")]
        public async Task<ActionResult<int>> GetGlobalRespositoryDatCount(string userName)
        {
            _logger.LogInformation($"Count for GrAccount by {userName}");
            return Ok(await new GlobalRepositoryData().GrDataCount(userName));
        }
    }
}
