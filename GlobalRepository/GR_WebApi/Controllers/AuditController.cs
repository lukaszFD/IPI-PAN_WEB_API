using DB_ModelEFCore.Controllers.Audit;
using DB_ModelEFCore.Controllers.Audit.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    /// <summary>
    /// A class that contains methods to return audit data.
    /// </summary>
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [Route("[controller]")]
    [ApiController]
    public class AuditController : ControllerBase
    {
        private readonly ILogger<AuditController> _logger;
        private readonly string _userEx;

        public AuditController(ILogger<AuditController> logger)
        {
            _logger = logger;
            _userEx = Thread.CurrentPrincipal.Identity.Name;
        }
        /// <summary>
        /// Return the number of accounts in the audit. 
        /// </summary>
        /// <param name="accountExId"></param>
        /// <returns></returns>
        [HttpGet("Accounts/Count")]
        public async Task<ActionResult<int>> GetAuditAccountsCount(string accountExId)
        {
            int data;
            try
            {
                _logger.LogInformation($"Count for GetAuditAccountsCount by user : {_userEx}");
                data = await new AuditData().AuditAccountsCount(accountExId);

                if (data == 0)
                {
                    return NotFound(new { message = $"No account is assigned to the user : {_userEx}" });
                }
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = $"For user {_userEx} are assigned {data}" });
        }
        /// <summary>
        /// Return the number of servers in the audit. 
        /// </summary>
        /// <param name="serverExId"></param>
        /// <returns></returns>
        [HttpGet("Servers/Count")]
        public async Task<ActionResult<int>> GetAuditServersCount(string serverExId)
        {
            int data;
            try
            {
                _logger.LogInformation($"Count for GetAuditServersCount by user : {_userEx}");
                data = await new AuditData().AuditServersCount(serverExId);

                if (data == 0)
                {
                    return NotFound(new { message = $"No servers is assigned to the user : {_userEx}" });
                }
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = $"For user {_userEx} are assigned {data}" });
        }
        /// <summary>
        /// Return the number of systems in the audit. 
        /// </summary>
        /// <param name="systemExId"></param>
        /// <returns></returns>
        [HttpGet("Systems/Count")]
        public async Task<ActionResult<int>> GetAuditSystemsCount(string systemExId)
        {
            int data;
            try
            {
                _logger.LogInformation($"Count for GetAuditSystemsCount by user : {_userEx}");
                data = await new AuditData().AuditSystemsCount(systemExId);

                if (data == 0)
                {
                    return NotFound(new { message = $"No systems is assigned to the user : {_userEx}" });
                }
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = $"For user {_userEx} are assigned {data}" });
        }
        /// <summary>
        /// Return accounts saved in the audit. 
        /// </summary>
        /// <param name="accountExId"></param>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet("Accounts")]
        public async Task <ActionResult<IEnumerable<AuditAccounts>>> GetAuditAccounts(string accountExId, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            IEnumerable<AuditAccounts> data;
            try
            {
                _logger.LogInformation($"Data downloading for account : {accountExId} by user : {_userEx} (GetAuditServers)");
                data = await new AuditData().AuditAccounts(accountExId, pageSize, pageNumber);

                if (data == null)
                {
                    _logger.LogWarning($"No data found for user : {_userEx} and account : {accountExId}");
                    return NotFound(new { message = $"No data found for user : {_userEx} and account : {accountExId}" });
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
        /// Return servers saved in the audit. 
        /// </summary>
        /// <param name="serverExId"></param>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet("Servers")]
        public async Task<ActionResult<IEnumerable<AuditServers>>> GetAuditServers(string serverExId, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            IEnumerable<AuditServers> data;
            try
            {
                _logger.LogInformation($"Data downloading for server : {serverExId} by user : {_userEx} (GetAuditServers)");
                data = await new AuditData().AuditServers(serverExId, pageSize, pageNumber);

                if (data == null)
                {
                    _logger.LogWarning($"No data found for user : {_userEx} and server : {serverExId}");
                    return NotFound(new { message = $"No data found for user : {_userEx} and server : {serverExId}" });
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
        /// Return systems saved in the audit. 
        /// </summary>
        /// <param name="systemrExId"></param>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet("Systems")]
        public async Task<ActionResult<IEnumerable<AuditSystems>>> GetAuditSystems(string systemrExId, [FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            IEnumerable<AuditSystems> data;
            try
            {
                _logger.LogInformation($"Data downloading for system : {systemrExId} by user : {_userEx} (GetAuditSystems)");
                data = await new AuditData().AuditSystems(systemrExId, pageSize, pageNumber);

                if (data == null)
                {
                    _logger.LogWarning($"No data found for user : {_userEx} and system : {systemrExId}");
                    return NotFound(new { message = $"No data found for user : {_userEx} and system : {systemrExId}" });
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
