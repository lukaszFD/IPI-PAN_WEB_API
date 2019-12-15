using DB_ModelEFCore.Controllers.Repository;
using DB_ModelEFCore.Controllers.Repository.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading;
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

        [HttpPost("CreateNewAccount")]
        public async Task<ActionResult<NewAccount>> CreateNewAccount(NewAccount account)
        {
            var data = await new GlobalRepositoryData().CreateNewAccount(account);

            if (data == null)
            {
                return BadRequest(new { message = "An error has occurred while processing your query" });
            }
            return Ok(data);
        }
        [HttpGet("/AllAccounts")]
        public async Task<ActionResult<IEnumerable<GrAccount>>> GetGlobalRespositoryData([FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            string userEx = Thread.CurrentPrincipal.Identity.Name;
            _logger.LogInformation($"Data downloading for GrAccount by {userEx}");
            var data = await new GlobalRepositoryData().GrData(userEx, pageSize, pageNumber);

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
