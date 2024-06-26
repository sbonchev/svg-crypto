﻿using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Vsg.DataModels; 

namespace Vsg.Services
{
    /// <summary>
    /// CryptoService for calculating 24h price & simple movment average.
    /// </summary>
    public class CryptoService : ICryptoService
    {

        private readonly IRepositoryService<CryptoPrices> _priceRepository;
        private readonly IMemoryCache _cache;
        private readonly IConfiguration _config;
        private const int CashTime = 1;


        public CryptoService(IRepositoryService<CryptoPrices> priceRepository, IMemoryCache cache, IConfiguration config)
        {

            _priceRepository = priceRepository;
            _cache = cache;
            _config = config;
        }

        /// <summary>
        /// Calculate average crypto valus for the last 24h and selected currency crypto symbol.
        /// </summary>
        /// <param name="symbol">Selected currency crypto</param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        /// <exception cref="Exception"></exception>
        public async Task<decimal> Get24hAvgPriceAsync(string symbol)
        {
            symbol = CheckCryptoSymbol(symbol);
            var cacheKey = $"{symbol}_24hAvgPrice";
            if (_cache.TryGetValue(cacheKey, out decimal cachedPrice))
            {
                return cachedPrice;
            }
            try
            {
                var srvResult = await _priceRepository.GetAllAsync(crp => crp.Symbol == symbol
                                                                  && crp.Interval == $"1{TimeIntervals.h}");
                var maxAvgId = srvResult.GroupBy(g => new { g.Symbol, g.Interval, g.CloseTime })
                                         .Select(grp => grp.Max(m => m.IdAvg));
                var avgPrices = srvResult.Where(dp => maxAvgId.Contains(dp.IdAvg))
                                         .OrderBy(t => t.LastPrice)
                                         .Select(p => p.LastPrice);
                var hDatePointCount = avgPrices.Count();
                if (hDatePointCount < 1)
                    throw new ArgumentException($"Not sufficient date-points for crypto currency: {symbol}!");
                // --- By the task requirement: "average price for the last 24h of data in the database ( or the oldest available, if 24h of data is not available )"
                var avgPrice = avgPrices.TakeLast(hDatePointCount>24?24:hDatePointCount)
                                        .Average();
                _cache.Set(cacheKey, avgPrice, TimeSpan.FromMinutes(CashTime));

                return avgPrice;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error in service: Exception - {ex.Message} \n Inner Exception  - {ex.InnerException} \n  {ex.StackTrace}");
            }
        }

        /// <summary>
        /// Calculate average crypto valus for the selected currency crypto symbol, periods and [date].
        /// </summary>
        /// <param name="symbol">Selected currency crypto.</param>
        /// <param name="n">Time-intervals count.</param>
        /// <param name="p">Selected period.</param>
        /// <param name="s">To date.</param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        /// <exception cref="Exception"></exception>
        public async Task<decimal> GetSimpleMovingAvgAsync(string symbol, int n, string p, DateTime? s)
        {
            symbol = CheckCryptoSymbol(symbol);
            var period = p.ToLower().Trim();
            bool isPeriod = period == "1w" || period == "1d" || period == "1m" || period == "5m" || period == "30m";
            if (!isPeriod)
            {
                throw new ArgumentException($"Invalid time period {period}, (SMA valid periods are: 1w, 1d, 1m, 5m, 30m).");
            };
            //if (_cache.TryGetValue($"{symbol}_SimpleMovingAvg", out decimal cachedPrice))
            //    return cachedPrice;
            try
            {
                bool isStartFromNow = false;
                long dtStartStamp;
                if (s == null) //-- Get DateTime Now
                {
                    dtStartStamp = DateTimeOffset.Now.ToUnixTimeMilliseconds(); 
                    isStartFromNow = true;
                }
                else //-- user def. DateTime
                {
                    DateTime startDt = s.Value;
                    dtStartStamp = new DateTimeOffset(startDt.Year, startDt.Month, startDt.Day, 0, 0, 0, TimeSpan.Zero)
                                       .ToUnixTimeMilliseconds();
                }
                var dataPoints = await _priceRepository.GetAllAsync(crp => crp.Symbol == symbol
                                                                    && (isStartFromNow
                                                                    ? crp.CloseTime <= dtStartStamp
                                                                    : crp.CloseTime >= dtStartStamp)
                                                                    && crp.Interval == period);
                var maxAvgId = dataPoints.GroupBy(g => new { g.Symbol, g.Interval, g.CloseTime })
                                         .Select(grp => grp.Max(m => m.IdAvg));

                var avgPrices = dataPoints.Where(dp => maxAvgId.Contains(dp.IdAvg))
                                          .OrderBy(t => t.LastPrice)
                                          .Select(p => p.LastPrice);

                if (avgPrices.Count() < n)
                    throw new ArgumentException($"Not sufficient date-points for crypto currency crypto-symbol: {symbol}, period: {p}, count: {n}!");

                var avgSimplePrice = avgPrices.TakeLast(n).Average();
                //_cache.Set($"{symbol}_SimpleMovingAvg", avgSimplePrice, TimeSpan.FromMinutes(CashTime));

                return avgSimplePrice;
            }
            catch (Exception ex)
            {
                throw new Exception($"An error occurred while calculating SMA: Exception - {ex.Message} \n Inner Exception  - {ex.InnerException} \n  {ex.StackTrace}");
            }
        }

        private string CheckCryptoSymbol(string symbol)
        {
            symbol = symbol.ToLower().Trim();
            var cryptos = _config.GetSection("DefCryptoCurrences")?
                                     .Value?.Split(",").ToList<string>(); // -- ex.: "btcusdt", "adausdt", "ethusdt"

            if (string.IsNullOrEmpty(symbol) || cryptos == null || cryptos.Count < 1 || !cryptos.Contains(symbol))
                throw new ArgumentException($"There is no valid crypto-currency value (symbol: {symbol}) definded into appsettings config!");

            return symbol;
        }
    }
}


