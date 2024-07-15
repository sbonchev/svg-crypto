using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
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
                _logger.LogInformation($"Get 24h Avgerage Price for: {symbol}");
                var result = await Task.Run(() => _serviceCrypto.Get24hAvgPriceAsync(symbol));

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error exec Get24hAvgPrice for crypto currency {symbol}!");
                return StatusCode(500, new { error = $"Internal 24h-average-price for currency:{symbol} error!", details = ex.Message });
            }
        }

        [HttpGet("{symbol}/GetSimpleAvgMoving")]
        public async Task<IActionResult> GetSimpleAvgMoving(string symbol, //-- model required
                                                            [BindRequired, FromQuery(Name = "intervals_count")] int n, 
                                                            [BindRequired, FromQuery(Name = "biance_period")] string p, 
                                                            [FromQuery(Name = "from_date YYYY-MM-DD")] DateTime? s)
        {
            try
            {
                _logger.LogInformation($"Get Simple Avgerage Price for: currency-{symbol}, count-{n}, period-{p}, set date:{s}");
                var result = await Task.Run(() => _serviceCrypto.GetSimpleMovingAvgAsync(symbol, n, p, s));

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error exec GetSimpleAvgMoving for crypto currency {symbol}!");
                return StatusCode(500, new { error = $"Internal error SMA-symbol:{symbol}, period:{p}, count:{n}, date:{s}!",
                                             details = ex.Message });
            }
        }
    }


}
