using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Swinx.APIDTOs;
using Swinx.APIModels;
using Swinx.APIRepositories;
using Swinx.APIUtilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Swinx.APIControllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class PatientsController : ControllerBase
    {
        private readonly ISwinxDbContext _context;
        private readonly IDataProtector _protector;

        public PatientsController(IDataProtectionProvider encr, ISwinxDbContext context)
        {
            _protector = encr.CreateProtector("FEGGHYS43BHGS3GFDFGFGDF");
            _context = context;
        }

        //[HttpGet("getAllergies")]
        //public async Task<ActionResult<List<Allergy>>> GetAllergies([FromQuery] PaginationDTO pagination)
        //{
        //    //Pagination example

        //    var queryable = _context.Allergies.AsQueryable();
        //    await HttpContext.InsertParameterPaginationInHeader(queryable);

        //    var allergies = await queryable.OrderBy(allergy => allergy.AllergyName)
        //                            .Paginate(pagination)
        //                            .ToListAsync();

        //    return allergies;

        //}

        [HttpGet("index")]
        public IActionResult Index()
        {
            string source = "Hernán Olivieri";
            string encText = _protector.Protect(source);
            string decrypt = _protector.Unprotect(encText);
            return Ok(new { source, encText, decrypt });
        }
    }
}
