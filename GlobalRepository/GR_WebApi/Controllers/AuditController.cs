using DB_ModelEFCore.Controllers.Audit;
using DB_ModelEFCore.Controllers.Audit.Class;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AuditController : ControllerBase
    {
        private readonly ILogger<AuditController> _logger;

        public AuditController(ILogger<AuditController> logger)
        {
            _logger = logger;
        }

        [HttpGet("Accounts")]
        public async Task <ActionResult<IEnumerable<AuditAccounts>>> GetAuditAccounts(string userName, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            _logger.LogInformation($"Data downloading for AuditAccounts by {userName}");
            var data = await new AuditData().AuditAccounts(userName, pageSize, pageNumber);

            if (data == null)
            {
                _logger.LogWarning($"No data found for GetAuditAccounts(string {userName})");
                return NotFound();
            }
            return Ok(data);
        }
        [HttpGet("Servers")]
        public async Task<ActionResult<IEnumerable<AuditServers>>> GetAuditServers(string serverExId, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            _logger.LogInformation($"Data downloading for AuditServers by {serverExId}");
            var data = await new AuditData().AuditServers(serverExId, pageSize, pageNumber);

            if (data == null)
            {
                _logger.LogWarning($"No data found for GetAuditServers(string {serverExId})");
                return NotFound();
            }
            return Ok(data);
        }
        [HttpGet("Systems")]
        public async Task<ActionResult<IEnumerable<AuditSystems>>> GetAuditSystems(string systemrExId, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            _logger.LogInformation($"Data downloading for AuditSystems by {systemrExId}");
            var data = await new AuditData().AuditSystems(systemrExId, pageSize, pageNumber);

            if (data == null)
            {
                _logger.LogWarning($"No data found for GetAuditSystems(string {systemrExId})");
                return NotFound();
            }
            return Ok(data);
        }
    }
}
