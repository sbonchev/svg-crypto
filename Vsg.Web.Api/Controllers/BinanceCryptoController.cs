using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Vsg.Console;
using Vsg.Services;

namespace Vsg.Web.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json", "application/xml")]
    public class BinanceCryptoController : ControllerBase
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly ICryptoService _serviceCrypto;
        private readonly ILogger<ICryptoService> _logger;
        private readonly AuthJwt _authJwt;

        public BinanceCryptoController(ICryptoService serviceCrypto, IServiceProvider serviceProvider, 
                                       ILogger<ICryptoService> logger, AuthJwt authJwt)
        {
            _serviceProvider = serviceProvider;
            _serviceCrypto = serviceCrypto;
            _logger = logger;
            _authJwt = authJwt;
        }

        /// <summary>
        /// Get a JWT secret token for authorization.
        /// </summary>
        /// <returns></returns>
        [HttpPost("GetToken")]
        public IResult GetToken()
        {
            try
            {
                return Results.Ok(_authJwt.GetJwt);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Get JWT Authorization Error!");
                return Results.Problem($"Get JWT Authorization Error! \n {ex.Message}");
            }
        }

        [Authorize()]
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

        [Authorize()]
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


        [HttpGet("StopBgs")]
        public IActionResult StopBgs()
        {
            try
            {
                string msgResult;
                using (var scope = _serviceProvider.CreateScope())
                {
                    var cryptoClientService = scope.ServiceProvider
                              .GetServices<IHostedService>()
                              .OfType<CryptoClientService>()
                              .Single();
                    msgResult = cryptoClientService.ToBeStopped();
                }
                _logger.LogInformation($"Background service worker cancelation: \n {msgResult}");

                return Ok(msgResult);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error on Background service worker cancelation!");
                return StatusCode(500, new
                {
                    error = $"Internal error on Background service worker cancelation!",
                    details = ex.Message
                });
            }
        }

    }

   

}



