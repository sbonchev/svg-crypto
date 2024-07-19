using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Text.Json;
using Vsg.DataModels;
using Vsg.Services;
using Websocket.Client;

namespace Vsg.Console
{
    /// <summary>
    /// Background service implementation for DB collecting Biance crypto info.
    /// </summary>
    public class CryptoClientService : BackgroundService
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<ICryptoService> _logger;
        private readonly IConfiguration _config;
        private int Tdelay = 1000;
        private CancellationTokenSource _cts;
        private bool _isRun = false;
        
        public CryptoClientService(IServiceProvider serviceProvider, ILogger<ICryptoService> logger, IConfiguration config)
        {
            _serviceProvider = serviceProvider;
            _logger = logger;
            _config = config;
            _cts = new();
        }

        /// <summary>
        /// Get Biance url for required crypto currences and related periods.
        /// </summary>
        private string GetUrl
        {
            get
            {
                var cryptos = _config.GetSection("DefCryptoCurrences")?
                                     .Value?.Split(",").ToList<string>(); // -- ex.: "btcusdt", "adausdt", "ethusdt"
                if (cryptos == null || cryptos.Count() < 1)
                    throw new ArgumentException("There is no crypto-currency values definded into appsettings config!");

                var url = _config.GetSection("URL").Value;
                if (string.IsNullOrEmpty(url))
                    throw new ArgumentException("There is no Biance URL definded into appsettings config!");

                var klineCryptos = "";
                foreach (var prd in Enum.GetValues<TimeIntervals>())
                {
                    foreach (var klineCrypto in cryptos)
                    {
                        var kcc = klineCrypto.ToLower().Trim();
                        klineCryptos += $"/{kcc}@kline_1{prd}";
                        if (prd == TimeIntervals.m) // -- add 5m & 30m periods
                        {
                            klineCryptos += $"/{kcc}@kline_5{prd}";
                            klineCryptos += $"/{kcc}@kline_30{prd}";
                        }
                    }
                }
                return $"{url}{klineCryptos}";
            }
        }

        internal async Task<string> ToBeRun()
        {
            if (!_isRun)
            {
                _cts = new(); // --- MUST BE RE INIT THE CT!:
                await StartAsync(_cts.Token);
                return "BackgroundService is running!";
            }  
            else
                return "BackgroundService has already been run!";
        }

        public string ToBeStopped()
        {
            if (_isRun)
            {
                _cts.Cancel();
                return "BackgroundService will be stopped!";
            }
               
            else
                return "BackgroundService cannot be canceled because is not run!";
        }

        /// <summary>
        /// Exec background worker task async.
        /// </summary>
        /// <param name="cancelToken">Cancelation token.</param>
        /// <returns></returns>
        protected override async Task ExecuteAsync(CancellationToken cancelToken)
        {
            
            using (var client = new WebsocketClient(new Uri(GetUrl)))
            {
                try
                {
                    if (_cts.Token != cancelToken) // --- in case if we want to cancel it via API!
                        cancelToken = _cts.Token;

                    client.MessageReceived.Subscribe(async msg =>  await HandleMessageAsync(msg.Text), cancelToken);
                    await client.Start();
                    _isRun = true;

                    while (!cancelToken.IsCancellationRequested)
                    {
                        await Task.Delay(Tdelay, cancelToken);
                    }
                }
                catch (OperationCanceledException ex)
                {   // shouldn't exit with a non-zero exit code. In other words, this is expected...
                    _logger.LogError(ex, $"Crypto Client Background Service Has Been Stopped!");
                    // --- Be canceled:
                    _isRun = false;
                    //throw;
                }
            }
        }

        /// <summary>
        /// Handle every new Biance record to Db.
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        private async Task HandleMessageAsync(string? message)
        {
            if (string.IsNullOrEmpty(message))
                return;

            try
            {
                var data = JsonSerializer.Deserialize<CryptoKline>(message);
                if (data == null || string.IsNullOrEmpty(data.Symbol))
                {
                    _logger.LogWarning($"Received invalid data: {message}");
                    return;
                }
                if (data.ErrorCode > 0 || !string.IsNullOrEmpty(data.ErrorMessage)) {
                    throw new BianceCryptoException($"Biance API Exception: Error Code - {data.ErrorCode} \n " +
                                                    $"Error Message - {data.ErrorMessage}");
                }
                using (var scope = _serviceProvider.CreateScope())
                {
                    var priceRepository = scope.ServiceProvider.GetRequiredService<IRepositoryService<CryptoPrices>>();
                    var priceCrypto = new CryptoPrices
                    {
                        Symbol = data.Symbol.ToLower().Trim(),
                        LastPrice = data.Details!.LastPrice,
                        Interval = data.Details!.Interval!.ToLower().Trim(),
                        CloseTime = data.Details.CloseTime,
                    };
                    var crp = priceRepository.FirstOrDefault(e => e.CloseTime == priceCrypto.CloseTime
                                                             && e.Symbol == priceCrypto.Symbol
                                                             && e.Interval == priceCrypto.Interval
                                                             && e.LastPrice == priceCrypto.LastPrice);
                    if (crp == null) // -- checks if CryptoPrices entity is unique
                    {
                        priceCrypto.IdAvg = priceRepository.GetMaxAvgId;
                        await priceRepository.UpdInertAsync(priceCrypto).ConfigureAwait(false);
                    }
                }
            }
            catch (BianceCryptoException ex)
            {
                _logger.LogError(ex, $"Biance socket API error: {message}");
                return;
            }
            catch (JsonException ex)
            {
                _logger.LogError(ex, $"Error deserializing WebSocket error: {message}");
                return;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error message: {message}");
                return;
            }
        }
        
    }

}
