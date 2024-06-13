using Microsoft.Extensions.Caching.Memory;
using Vsg.DataModels; 

namespace Vsg.Services
{
    public class CryptoService : ICryptoService
    {

        private readonly IRepositoryService<CryptoPrices> _priceRepository;
        private readonly IMemoryCache _cache;
        private const int CashTime = 5;


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
                var avgPrices = srvResult.OrderBy(t => t.LastPrice)
                                        .Select(p => p.LastPrice);
                if (avgPrices.Count() < 24)
                    throw new ArgumentException("Not sufficient date-points.");

                var avgPrice = avgPrices.TakeLast(24).Average();
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
            var cacheKey = $"{symbol}_SimpleMovingAvg";
            if (_cache.TryGetValue(cacheKey, out decimal cachedPrice))
            {
                return cachedPrice;
            }

            try
            {
                bool isStartFromNow = false;
                DateTime start;
                if (s == null)
                {
                    start = DateTime.UtcNow;
                    isStartFromNow = true;
                }
                else
                {
                    start = s.Value;
                }
                var dtStartStamp = start.Ticks;

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
                _cache.Set(cacheKey, avgSimplePrice, TimeSpan.FromMinutes(CashTime));

                return avgSimplePrice;
            }
            catch (Exception ex)
            {
                throw new Exception($"An error occurred while calculating SMA: {ex.Message} \n {ex.StackTrace}");
            }

        }
    }
}


