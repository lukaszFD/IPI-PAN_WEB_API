using DB_ModelEFCore.Controllers.Repository;
using DB_ModelEFCore.Controllers.Repository.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [Route("[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly ILogger<AdminController> _logger;
        private readonly string _userEx;

        public AdminController(ILogger<AdminController> logger)
        {
            _logger = logger;
            _userEx = Thread.CurrentPrincipal.Identity.Name;
        }
        /// <summary>
        /// Create new user
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        [HttpPost("CreateNewUser")]
        public async Task<ActionResult<NewUser>> CreateNewUser(NewUser user)
        {
            string data = null;
            foreach (var item in await new GlobalRepositoryData().AdminCheck())
            {
                if (_userEx.ToUpper() == item.ToString().ToUpper())
                {
                    try
                    {
                        data = Convert.ToString(await new GlobalRepositoryData().CreateNewUser(user));
                        _logger.LogInformation($"NewUser : {data}");
                        if (data == null)
                        {
                            _logger.LogWarning($"No data found for {_userEx}");
                            return NotFound(new { message = $"No data found for {_userEx}" });
                        }
                    }
                    catch (System.Exception ex)
                    {
                        _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                        return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                    }
                }
                else
                {
                    return StatusCode(500, $"You don't have the privilege to perform this operation.");
                }
            }
            return Ok(data);
        }
    }
}
