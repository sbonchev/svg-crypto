
using System;
using System.Reactive;
using System.Reflection;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading;
using System.Threading.Tasks;
using System.Xml.Linq;
using Vsg.DataModels;
using Websocket.Client;

namespace Vsg.Console
{
    internal class Client
    {
        //private readonly string _url = "wss://stream.binance.com:9443/ws/" +
        //    "btcusdt@kline_1M" + // /adausdt@kline_1w/ethusdt@kline_1w" +
        //    "/btcusdt@kline_1w"; // /adausdt@kline_1m/ethusdt@kline_1m";
        private readonly string _url = "wss://stream.binance.com:9443/ws/btcusdt@kline_1h";
        private readonly string _url1 = "wss://stream.binance.com:9443/ws/btcusdt@kline_1M";
        //"wss://stream.binance.com:9443/ws/btcusdt@ticker/adausdt@ticker/ethusdt@ticker"   

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
                        //var iterval = (TimeIntervals)prd;
                        klineCryptos += $"/{klineCrypto}@kline_1{prd}";
                    }
                }
                return $"wss://stream.binance.com:9443/ws{klineCryptos}"; 
            }
        }

        public async Task ExecuteAsync() //CancellationToken stoppingToken
        {
            //var url = new Uri("wss://stream.binance.com:9443/ws/btcusdt@ticker/adausdt@ticker/ethusdt@ticker");

            using (var client = new WebsocketClient(new Uri(GetUrl)))
            {
                client.MessageReceived.Subscribe(msg => HandleMessage(msg.Text));

                await client.Start();
                await Task.Delay(1000000);
                //while (!stoppingToken.IsCancellationRequested)
                //{
                //    await Task.Delay(1000);
                //}
            }
            //using (var client = new WebsocketClient(new Uri(_url1)))
            //{
            //    client.MessageReceived.Subscribe(msg => HandleMessage(msg.Text));

            //    await client.Start();
            //    await Task.Delay(1000000);
            //}
        }

        private void HandleMessage(string message)
        {
            CryptoKline data = null;
            try
            {
                data = JsonSerializer.Deserialize<CryptoKline>(message); //67465.51000000M //1718582399999
            }
            catch (JsonException ex)
            {
                //    _logger.LogError(ex, "Error deserializing WebSocket message: {Message}", message);
                //    return;
            }

            //if (data == null || string.IsNullOrEmpty(data.Symbol))
            //{
            //    _logger.LogWarning("Received invalid data: {Message}", message);
            //    return;
            //}

            //using (var scope = _serviceProvider.CreateScope())
            //{
            //    var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();
            //    var priceRepository = unitOfWork.Repository<PriceModel>();

            var priceCrypto = new CryptoPrices
            {
                Symbol = data.Symbol.ToUpper(),
                LastPrice = data.Details.LastPrice,
                Interval = data.Details.Interval,
                CloseTime = data.Details.CloseTime            };

            //    priceRepository.AddAsync(priceCrypto).Wait();
            //    unitOfWork.SaveChangesAsync().Wait();
            //}
        }

    }
}
