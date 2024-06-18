using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Text.Json;
using Vsg.DataModels;
//using TimeInt = Vsg.DataModels.TimeIntervals;
using Vsg.Services;
using Websocket.Client;

namespace Vsg.Console
{
    /// <summary>
    /// Background service implementation for DB collecting Biance crypto info.
    /// </summary>
    public class CryptoClientService : BackgroundService
    {
        private const string Url = "wss://stream.binance.com:9443/ws";
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<ICryptoService> _logger;
        private int Tdelay = 900;

        public CryptoClientService(IServiceProvider serviceProvider, ILogger<ICryptoService> logger)
        {
            _serviceProvider = serviceProvider;
            _logger = logger;
        }

        private string GetUrl
        {
            get
            {
                var cryptos = new List<string> { "btcusdt", "adausdt", "ethusdt" };
                var klineCryptos = "";
                foreach (var prd in Enum.GetValues<TimeIntervals>())
                {
                    foreach (var klineCrypto in cryptos)
                    {
                        klineCryptos += $"/{klineCrypto}@kline_1{prd}";
                        if (prd == TimeIntervals.m) // -- add 5m & 30m periods
                        {
                            klineCryptos += $"/{klineCrypto}@kline_5{prd}";
                            klineCryptos += $"/{klineCrypto}@kline_30{prd}";
                        }
                    }
                }
                return $"{Url}{klineCryptos}";
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
                    _logger.LogWarning("Received invalid data: {Message}", message);
                    return;
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
                        var id = priceRepository.GetContext().Prices.Any()
                            ? priceRepository.GetContext().Prices.Max(p => p.IdAvg)
                            : 0;
                        priceCrypto.IdAvg = id + 1;
                        priceRepository.UpdInertAsync(priceCrypto).Wait();
                    }
                }
            }
            catch (JsonException ex)
            {
                _logger.LogError(ex, "Error deserializing WebSocket message: {Message}", message);
                return;
            }
        }

        /// <summary>
        /// Checks periods - 1m, 5m, 30m, 1h, 1d, 1w
        /// </summary>
        private bool IsPeriod(long timeClosed, string period)
        {
            const int ebs = 59;  // -- ebsylon = 3 secunds vs refreshing each 2s
            long tc = timeClosed; //--/ 1000; //-- ms remove
            var test = Math.Abs((tc / 60) * 60 - tc);
            return $"1{TimeIntervals.m}" == period && Math.Abs((tc / 60) * 60  - tc) <= ebs
                || $"5{TimeIntervals.m}" == period && Math.Abs((tc / 300) * 300 - tc) < ebs
                || $"30{TimeIntervals.m}" == period && Math.Abs((tc / 1800) * 1800 - tc) < ebs
                || $"1{TimeIntervals.h}" == period && Math.Abs((tc / 3600) * 3600 - tc) < ebs
                || $"1{TimeIntervals.d}" == period && Math.Abs((tc / (3600 * 24)) * 3600 * 24 - tc) < ebs
                || $"1{TimeIntervals.w}" == period && Math.Abs((tc / (3600 * 24 * 7)) * 3600 * 24 * 7 - tc) < ebs;
        }
    }

}
