using DB_ModelEFCore.Controllers.Repository;
using DB_ModelEFCore.Controllers.Repository.Class;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace GR_WebApi.Controllers
{
    /// <summary>
    /// Main class for creating and extracting data about existing accounts. 
    /// </summary>
    [Authorize(AuthenticationSchemes = "BasicAuthentication")]
    [Route("[controller]")]
    [ApiController]
    public class GlobalRepositoryDataController : ControllerBase
    {
        private readonly ILogger<GlobalRepositoryDataController> _logger;
        private readonly string _userEx;

        public GlobalRepositoryDataController(ILogger<GlobalRepositoryDataController> logger)
        {
            _logger = logger;
            _userEx = Thread.CurrentPrincipal.Identity.Name;
        }
        /// <summary>
        /// Create a new account with information about servers and systems. 
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        [HttpPost("CreateNewAccount")]
        public async Task<ActionResult<NewAccount>> CreateNewAccount(NewAccount account)
        {
            string data;
            try
            {
                data = Convert.ToString(await new GlobalRepositoryData().CreateNewAccount(account, _userEx));
                _logger.LogInformation($"CreateNewAccount {data} for {_userEx}");
                if (data == null)
                {
                    _logger.LogWarning($"No data found for {_userEx}");
                    return NotFound(new { message = $"No data found for user : {_userEx} and account : {account}" });
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
        /// Collect all data about existing accounts. 
        /// </summary>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [HttpGet("/AllAccounts")]
        public async Task<ActionResult<IEnumerable<GrAccount>>> GetGlobalRespositoryData([FromQuery] int pageNumber, [FromQuery] int pageSize)
        {
            IEnumerable<GrAccount> data;
            try
            {
                _logger.LogInformation($"Data downloading for GrAccount by user : {_userEx}");
                data = await new GlobalRepositoryData().GrData(_userEx, pageSize, pageNumber);

                if (data == null)
                {
                    _logger.LogWarning($"No data found for {_userEx}");
                    return NotFound(new { message = $"No data found for user {_userEx}" });
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
        /// Checking how many accounts are assigned to a user. 
        /// </summary>
        /// <returns></returns>
        [HttpGet("/AllAccounts/Count")]
        public async Task<ActionResult<int>> GetGlobalRespositoryDatCount()
        {
            int data;
            try
            {
                _logger.LogInformation($"Count for GrAccount by user : {_userEx}");
                data = await new GlobalRepositoryData().GrDataCount(_userEx);
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
            return Ok(new { message = $"For user {_userEx} are assigned {data}." });
        }

        /// <summary>
        /// DEelte account
        /// </summary>
        /// <param name="accountExId"></param>
        /// <returns></returns>
        [HttpDelete("DeleteAccount")]
        public async Task<ActionResult<bool>> DeleteAccount(string accountExId)
        {
            try
            {
                await new GlobalRepositoryData().DeleteAccount(accountExId);
            }
            catch (System.Exception ex)
            {
                _logger.LogError($"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
                return StatusCode(500, $"An error has occurred during data processing. For : {_userEx}. Error : {ex.Message}");
            }
            return Ok(true);
        }
    }
}
