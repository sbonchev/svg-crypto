using Microsoft.Extensions.Caching.Memory;
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
        private const int CashTime = 1;


        public CryptoService(IRepositoryService<CryptoPrices> priceRepository, IMemoryCache cache)
        {

            _priceRepository = priceRepository;
            _cache = cache;
        }

        public async Task<decimal> Get24hAvgPriceAsync(string symbol)
        {
            var cacheKey = $"{symbol}_24hAvgPrice";
            if (_cache.TryGetValue(cacheKey, out decimal cachedPrice))
            {
                return cachedPrice;
            }
            try
            {
                var srvResult = await _priceRepository.GetAllAsync(crp => crp.Symbol == symbol
                                                                  && crp.Interval == $"1{TimeIntervals.h}");
                var avgPrices = srvResult.OrderBy(t => t.LastPrice) //-- for any case
                                         .Select(p => p.LastPrice);
                var hDatePointCount = avgPrices.Count();
                if (hDatePointCount < 1)
                    throw new ArgumentException("Not sufficient date-points!");
                // --- By the task requirement: "average price for the last 24h of data in the database ( or the oldest available, if 24h of data is not available )"
                var avgPrice = avgPrices.TakeLast(hDatePointCount>24?24:hDatePointCount)
                                        .Average();
                _cache.Set(cacheKey, avgPrice, TimeSpan.FromMinutes(CashTime));

                return avgPrice;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error in service: {ex.Message} \n {ex.StackTrace}");
            }
        }

        public async Task<decimal> GetSimpleMovingAvgAsync(string symbol, int n, string p, DateTime? s)
        {
            var period = p.ToLower().Trim();
            bool isPeriod = period == "1w" || period == "1d" || period == "1w" || period == "5m" || period == "30m";
            if (!isPeriod)
            {
                throw new ArgumentException("Invalid time period.");
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
                                                                    && isStartFromNow
                                                                    ? crp.CloseTime <= dtStartStamp
                                                                    : crp.CloseTime >= dtStartStamp
                                                                    && crp.Interval == period);
                var avgPrices = dataPoints.OrderBy(t => t.LastPrice)
                                          .Select(p => p.LastPrice);

                if (avgPrices.Count() < n)
                    throw new ArgumentException("Not sufficient date-points.");

                var avgSimplePrice = avgPrices.TakeLast(n).Average();
                //_cache.Set($"{symbol}_SimpleMovingAvg", avgSimplePrice, TimeSpan.FromMinutes(CashTime));

                return avgSimplePrice;
            }
            catch (Exception ex)
            {
                throw new Exception($"An error occurred while calculating SMA: {ex.Message} \n {ex.StackTrace}");
            }

        }
    }
}


