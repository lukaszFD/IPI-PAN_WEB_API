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
        public async Task<ActionResult<List<GrAccount>>> GetGlobalRespositoryData(string userName)
        {
            _logger.LogInformation($"Data downloading for GrAccount by {userName}");
            var data = await new GlobalRepositoryData().GrData(userName);

            if (data == null)
            {
                _logger.LogWarning("No data found for GetGlobalRespositoryData()");
                return NotFound();
            }
            return data;
        }
    }
}
