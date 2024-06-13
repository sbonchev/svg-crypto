using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Text.Json;
using Vsg.DataModels;
using Vsg.Services;
using Websocket.Client;

namespace Vsg.Console
{
    public class CryptoClientService : BackgroundService
    {
        private const string Url = "wss://stream.binance.com:9443/ws";
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<ICryptoService> _logger;

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
                client.MessageReceived.Subscribe(msg => HandleMessage(msg.Text));

                await client.Start();
                while (!cancelToken.IsCancellationRequested)
                {
                    await Task.Delay(900);
                }
            }           
        }

        private void HandleMessage(string message)
        {
            CryptoKline data = null;
            try
            {
                data = JsonSerializer.Deserialize<CryptoKline>(message);
            }
            catch (JsonException ex)
            {
                _logger.LogError(ex, "Error deserializing WebSocket message: {Message}", message);
                return;
            }

            if (data == null || string.IsNullOrEmpty(data.Symbol))
            {
                _logger.LogWarning("Received invalid data: {Message}", message);
                return;
            }

            using (var scope = _serviceProvider.CreateScope())
            {
                var priceRepository = scope.ServiceProvider.GetRequiredService<IRepositoryService<object>>();
                var priceCrypto = new CryptoPrices
                {
                    Symbol = data.Symbol.ToLower().Trim(),
                    LastPrice = data.Details.LastPrice,
                    Interval = data.Details.Interval.ToLower().Trim(),
                    CloseTime = data.Details.CloseTime
                };

                priceRepository.UpdInertAsync(priceCrypto).Wait();
            }
        }

    }
}
