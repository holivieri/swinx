using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Swinx.APIModels;

namespace Swinx.APIControllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class TestController : ControllerBase
    {
        [HttpGet("getDummyUser")]
        public ActionResult<UserModel> getDummyUser()
        {
            var u = new UserModel() { Email = "test@gmail.com", Password = "123456" };
            return Ok(u);

        }

    }
}
