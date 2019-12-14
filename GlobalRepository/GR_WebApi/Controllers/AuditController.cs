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
        [HttpGet("Accounts/Count")]
        public async Task<ActionResult<int>> GetAuditAccountsCount(string accountExId)
        {
            _logger.LogInformation($"Data downloading for AuditAccountsCount by {accountExId}");
            return Ok(await new AuditData().AuditAccountsCount(accountExId));
        }
        [HttpGet("Servers/Count")]
        public async Task<ActionResult<int>> GetAuditServersCount(string serverExId)
        {
            _logger.LogInformation($"Data downloading for AuditAccountsCount by {serverExId}");
            return Ok(await new AuditData().AuditServersCount(serverExId));
        }
        [HttpGet("Systems/Count")]
        public async Task<ActionResult<int>> GetAuditSystemsCount(string systemExId)
        {
            _logger.LogInformation($"Data downloading for AuditAccountsCount by {systemExId}");
            return Ok(await new AuditData().AuditSystemsCount(systemExId));
        }
        [HttpGet("Accounts")]
        public async Task <ActionResult<IEnumerable<AuditAccounts>>> GetAuditAccounts(string accountExId, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            _logger.LogInformation($"Data downloading for AuditAccounts by {accountExId}");
            var data = await new AuditData().AuditAccounts(accountExId, pageSize, pageNumber);

            if (data == null)
            {
                _logger.LogWarning($"No data found for GetAuditAccounts(string {accountExId})");
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
