using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Net.WebSockets;
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
        public static bool IsConsoleStart = false;

        public CryptoClientService(IServiceProvider serviceProvider, ILogger<ICryptoService> logger, IConfiguration config)
        {
            _serviceProvider = serviceProvider;
            _logger = logger;
            _config = config;
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

        protected override async Task ExecuteAsync(CancellationToken cancelToken)
        {
            using (var client = new WebsocketClient(new Uri(GetUrl)))
            {
                client.MessageReceived.Subscribe(msg => HandleMessage(msg.Text), cancelToken);

                await client.Start();

                while (!cancelToken.IsCancellationRequested)
                {
                    if(!IsConsoleStart && !client.IsStarted)
                    {
                        await client.Start();
                    }
                    if(IsConsoleStart && client.IsStarted)
                    {
                         await client.Stop(WebSocketCloseStatus.NormalClosure, "Vsg.Console app working...");
                    }
                    await Task.Delay(Tdelay);
                } 
            }
        }

        private void HandleMessage(string? message)
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
                        priceRepository.UpdInertAsync(priceCrypto).Wait();
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
