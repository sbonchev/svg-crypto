using Microsoft.AspNetCore.Mvc;
using Vsg.Services;

namespace Vsg.Web.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json", "application/xml")]
    public class BinanceCryptoController : ControllerBase
    {
        private readonly ICryptoService _serviceCrypto;
        private readonly ILogger<ICryptoService> _logger;

        public BinanceCryptoController(ICryptoService serviceProvider, ILogger<ICryptoService> logger)
        {
            _serviceCrypto = serviceProvider;
            _logger = logger;
        }

        [HttpGet("{symbol}/24hAvgPrice")]
        public async Task<IActionResult> Get24hAvgPrice(string symbol)
        {
            try
            {
                var result = await _serviceCrypto.Get24hAvgPriceAsync(symbol);
                return Ok(result);
            }
            
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error exec Get24hAvgPrice!");
                return StatusCode(500, new { error = "Internal error!", details = ex.Message });
            }
        }

        [HttpGet("{symbol}/GetSimpleAvgMoving")]
        public async Task<IActionResult> GetSimpleAvgMoving(string symbol, 
                                                            [FromQuery] int n, 
                                                            [FromQuery] string p, 
                                                            [FromQuery] DateTime? s)
        {
            try
            {
                var result = await _serviceCrypto.GetSimpleMovingAvgAsync(symbol, n, p, s);
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error exec GetSimpleAvgMoving!");
                return StatusCode(500, new { error = "Internal error!", details = ex.Message });
            }
        }
    }


}
