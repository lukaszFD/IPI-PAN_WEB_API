using DB_ModelEFCore.Controllers.Recon;
using DB_ModelEFCore.Controllers.Recon.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [Route("[controller]")]
    [ApiController]
    public class ReconciliationController : ControllerBase
    {
        [HttpPost("Accounts")]
        public async Task<ActionResult<ReconAccounts>> ReconAccounts(ReconAccounts recon)
        {
            await new ReconciliationData().ReconciliationAccounts(recon);
            return Ok();
        }
        [HttpPost("Servers")]
        public async Task<ActionResult<ReconServers>> ReconServers(ReconServers recon)
        {
            await new ReconciliationData().ReconciliationServers(recon);
            return Ok();
        }
        [HttpPost("Systems")]
        public async Task<ActionResult<ReconSystems>> ReconSystems(ReconSystems recon)
        {
            await new ReconciliationData().ReconciliationSystems(recon);
            return Ok();
        }
    }
}
