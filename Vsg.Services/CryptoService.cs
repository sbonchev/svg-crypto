using Microsoft.Extensions.Caching.Memory;
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
        public decimal Get24hAvgPriceAsync(string symbol)
        {
            symbol = CheckCryptoSymbol(symbol);
            var cacheKey = $"{symbol}_24hAvgPrice";
            if (_cache.TryGetValue(cacheKey, out decimal cachedPrice))
            {
                return cachedPrice;
            }
            try
            {                
                var avgPrice = _priceRepository.Get24hAvgPriceAsync(symbol);
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
        public decimal GetSimpleMovingAvgAsync(string symbol, int n, string p, DateTime? s)
        {
            (_cache as MemoryCache)?.Clear();
            symbol = CheckCryptoSymbol(symbol);
            string period = p.ToLower().Trim();
            bool isPeriod = period == "1w" || period == "1d" || period == "1m" || period == "5m" || period == "30m";
            if (!isPeriod)
                throw new ArgumentException($"Invalid time period {period}, (SMA valid periods are: 1w, 1d, 1m, 5m, 30m).");

            try
            {
                bool isStartFromNow = false;
                long dtStartStamp;
                DateTime startDt;
                if (s == null) //-- Get DateTime Now
                {
                    startDt = DateTime.Now; 
                    isStartFromNow = true;
                }
                else //-- user def. DateTime
                {
                    startDt = s.Value;
                }
                dtStartStamp = new DateTimeOffset(startDt.Year, startDt.Month, startDt.Day, 0, 0, 0, TimeSpan.Zero)
                                                 .ToUnixTimeMilliseconds();

                return _priceRepository.GetSimpleMovingAvgAsync(symbol, n, period, dtStartStamp, isStartFromNow);
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
                                 .Value?.Split(",").ToList(); // -- ex.: "btcusdt", "adausdt", "ethusdt"

            if (string.IsNullOrEmpty(symbol) || cryptos == null || cryptos.Count < 1 || !cryptos.Contains(symbol))
                throw new ArgumentException($"There is no valid crypto-currency value (symbol: {symbol}) definded into appsettings config!");

            return symbol;
        }

    }
}


