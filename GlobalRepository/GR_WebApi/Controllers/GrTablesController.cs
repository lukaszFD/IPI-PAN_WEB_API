using DB_ModelEFCore.Controllers.Documentation;
using DB_ModelEFCore.Models.Documentation;
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
    public class GrTablesController : ControllerBase
    {
        private readonly ILogger<GrTablesController> _logger;

        public GrTablesController(ILogger<GrTablesController> logger)
        {
            _logger = logger;
        }
        [HttpGet("Documentation/All")]
        public async Task<ActionResult<List<GrTables>>> GetGlobalRespositoryDocumentation()
        {
            var data = await new Documentation().DBDocumentation();

            if (data == null)
            {
                _logger.LogWarning("No data found for GetGlobalRespositoryDocumentation/Documentation/All");
                return NotFound();
            }
            return data;
        }
        [HttpGet("Documentation/{schema_name}/{table_name}")]
        public async Task<ActionResult<List<GrTables>>> GetSpecyfikInformationDocumentation(string schema_name, string table_name)
        {
            var data = await new Documentation().DBDocumentation(schema_name, table_name);

            if (data == null)
            {
                _logger.LogWarning("No data found for GetGlobalRespositoryDocumentation/Documentation/{schema_name}/{table_name}");
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

        // PUT: api/GrTables/5
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

            // POST: api/GrTables
        //    [HttpPost]
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
