using DB_ModelEFCore.Controllers.Recon;
using DB_ModelEFCore.Controllers.Recon.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    /// <summary>
    /// Class to reconcile data in the repository.
    /// </summary>
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [Route("[controller]")]
    [ApiController]
    public class ReconciliationController : ControllerBase
    {
        private readonly ILogger<ReconciliationController> _logger;
        private readonly string _userEx;

        public ReconciliationController(ILogger<ReconciliationController> logger)
        {
            _logger = logger;
            _userEx = Thread.CurrentPrincipal.Identity.Name;
        }
        /// <summary>
        /// Accounts reconciliations. 
        /// </summary>
        /// <param name="recon"></param>
        /// <returns></returns>
        [HttpPost("Accounts")]
        public async Task<ActionResult<ReconAccounts>> ReconAccounts(ReconAccounts recon)
        {
            try
            {
                await new ReconciliationData().ReconciliationAccounts(recon);
                _logger.LogInformation($"The data have been accepted for user: {_userEx} (ReconAccounts).");
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = "The data have been accepted" });
        }
        /// <summary>
        /// Servers reconciliations. 
        /// </summary>
        /// <param name="recon"></param>
        /// <returns></returns>
        [HttpPost("Servers")]
        public async Task<ActionResult<ReconServers>> ReconServers(ReconServers recon)
        {
            try
            {
                await new ReconciliationData().ReconciliationServers(recon);
                _logger.LogInformation($"The data have been accepted for user: {_userEx} (ReconServers).");
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = "The data have been accepted" });
        }
        /// <summary>
        ///  System reconciliations. 
        /// </summary>
        /// <param name="recon"></param>
        /// <returns></returns>
        [HttpPost("Systems")]
        public async Task<ActionResult<ReconSystems>> ReconSystems(ReconSystems recon)
        {
            try
            {
                await new ReconciliationData().ReconciliationSystems(recon);
                _logger.LogInformation($"The data have been accepted for user: {_userEx} (ReconSystems).");
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(new { message = "The data have been accepted" });
        }
    }
}
