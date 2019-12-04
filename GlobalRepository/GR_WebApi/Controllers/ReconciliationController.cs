using DB_ModelEFCore.Controllers.Recon;
using DB_ModelEFCore.Controllers.Recon.Class;
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
    public class ReconciliationController : ControllerBase
    {
        //POST: api/GrTables
        [HttpPost("Accounts")]
        public async Task<ActionResult<ReconAccounts>> ReconAccounts(ReconAccounts recon)
        {
            await new ReconciliationData().ReconciliationAccounts(recon);
            return Ok();
        }
    }
}
