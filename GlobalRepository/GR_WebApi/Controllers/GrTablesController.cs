using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DB_ModelEFCore.Controllers.Documentation;
using DB_ModelEFCore.Models.Documentation;
using Microsoft.Extensions.Logging;

namespace GR_WebApi.Controllers
{

    [Route("[controller]")]
    [ApiController]
    public class GrTablesController : ControllerBase
    {
        private readonly ILogger _logger;

        public GrTablesController(ILogger<GrTablesController> logger)
        {
            _logger = logger;
        }
        [HttpGet]
        public async Task<ActionResult<List<GrTables>>> GetGlobalRespositoryDocumentation()
        {
            _logger.LogInformation("Message displayed: {Message}", DateTime.UtcNow.ToLongTimeString());

            var data = await new Documentation().DBDocumentation();

            if (data == null)
            {
                return NotFound();
            }
            return data;


        }

        //// GET: api/GrTables/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<GrTables>> GetGrTables(int id)
        //{
        //    var grTables = await _context.GrTables.FindAsync(id);

        //    if (grTables == null)
        //    {
        //        return NotFound();
        //    }

        //    return grTables;
        //}

        //// PUT: api/GrTables/5
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutGrTables(int id, GrTables grTables)
        //{
        //    if (id != grTables.TableId)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(grTables).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!GrTablesExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: api/GrTables
        //[HttpPost]
        //public async Task<ActionResult<GrTables>> PostGrTables(GrTables grTables)
        //{
        //    _context.GrTables.Add(grTables);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetGrTables", new { id = grTables.TableId }, grTables);
        //}

        //// DELETE: api/GrTables/5
        //[HttpDelete("{id}")]
        //public async Task<ActionResult<GrTables>> DeleteGrTables(int id)
        //{
        //    var grTables = await _context.GrTables.FindAsync(id);
        //    if (grTables == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.GrTables.Remove(grTables);
        //    await _context.SaveChangesAsync();

        //    return grTables;
        //}

        //private bool GrTablesExists(int id)
        //{
        //    return _context.GrTables.Any(e => e.TableId == id);
        //}
    }
}
