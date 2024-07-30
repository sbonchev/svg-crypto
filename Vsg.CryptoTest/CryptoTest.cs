using Microsoft.Extensions.Configuration;
using System.Net.Http.Headers;
using Vsg.CryptoUTests.SqlDapper;

namespace Vsg.CryptoTest
{
    /// <summary>
    /// Test Cryptto API
    /// </summary>
    [TestFixture]
    public class CryptoTest
    {
        private readonly HttpClient _httpClient;

        private readonly string _url;

        private readonly string[] _cryptos;

        private readonly CryptoDapper _cryptoDapper;

        private IConfigurationRoot GetConfig => new ConfigurationBuilder().AddJsonFile("appsettings.test.json")
                                                                          .Build();

        public CryptoTest() {
            var config = GetConfig!;
            _url = config["URL"]!;
            var connString = config["ConnectionString"]!;
            _cryptos = config["DefCryptoCurrences"]!
                             .Split(",")
                             .ToArray(); // -- ex.: "btcusdt", "adausdt", "ethusdt"
            _cryptoDapper = new CryptoDapper(connString);

            _httpClient = new();
            _httpClient.DefaultRequestHeaders.Accept.Clear();
            _httpClient.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue { NoCache = true };
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            _httpClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + config["JWT"]!);
        }

        /// <summary>
        /// Stop BackgroundService Worker.
        /// </summary>
        [SetUp]
        public void Setup()
        {
            Assert.DoesNotThrowAsync(async () => await CancelBackgroundService());
        }

        /// <summary>
        /// Test Get 24hAvgPrice Api Service.
        /// </summary>
        [Test]
        public void Get24hAvgPriceTest()
        {

            foreach (var symbol in _cryptos)
            {
                Assert.DoesNotThrowAsync(async () => await Get24AvgPriceAsync(symbol));
            }
        }

        /// <summary>
        /// Test SMA Api Service.
        /// </summary>
        [Test]
        public void GetSmaTest()
        {
            var preiods = new List<string> { "1w", "1d", "1m", "5m", "30m" };
            foreach (var symbol in _cryptos)
            {
                int count = new Random().Next(5, 100);
                foreach (var period in preiods)
                {
                    Assert.DoesNotThrowAsync(async () => await GetSmaAsync(symbol, count, period).ConfigureAwait(false));

                    Assert.DoesNotThrowAsync(async () => await GetSmaAsync(symbol, count, period, DateOnly.FromDateTime(new DateTime(2023,11,03))).ConfigureAwait(false));
                }
            }
        }

        #region Private Func => To Be Called In Test Cases

        /// <summary>
        /// Stop BackgroundService recking up Biance data.
        /// </summary>
        /// <returns></returns>
        private async Task CancelBackgroundService()
        {
            using var response = await _httpClient.GetAsync($"{_url}StopBgs");
            response.EnsureSuccessStatusCode();
            var responseBody = await response.Content.ReadAsStringAsync().ConfigureAwait(false);

            Assert.True(response.StatusCode == System.Net.HttpStatusCode.OK,
                        "BackgroundService Cancelation Failed!");
        }

        private async Task Get24AvgPriceAsync(string symbol)
        {
            using var response = await _httpClient.GetAsync($"{_url}{symbol}/24hAvgPrice");
            response.EnsureSuccessStatusCode();
            var responseBody = await response.Content.ReadAsStringAsync();

            Assert.False(responseBody == null, "Invalid BinanceCrypto Response!");
            Assert.True(response.StatusCode == System.Net.HttpStatusCode.OK,
                        "Get 24hAvgPrice Failed!");

            decimal priceCryptoApi = Convert.ToDecimal(responseBody);
            decimal priceDb = _cryptoDapper.Get24hAvgPrice(symbol);
            Assert.IsTrue(priceCryptoApi == priceDb,
                $"For Symbol: {symbol} Both prices: {priceCryptoApi} and {priceDb} should be equal if there is no cashing!");
        }

        private async Task GetSmaAsync(string symbol, int count, string period, DateOnly? date = null)
        {
            var url = $"{_url}{symbol}/GetSimpleAvgMoving?intervals_count={count}&biance_period={period}";
            if (date != null)
                url += $"&from_date={date.Value.ToString("yyyy-MM-dd")}";

            _httpClient.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue { NoCache = true };
            using (var response = await _httpClient.GetAsync(url).ConfigureAwait(false))
            {
                response.EnsureSuccessStatusCode();
                var responseBody = await response.Content.ReadAsStringAsync().ConfigureAwait(false);

                Assert.False(responseBody == null, "Invalid Sma BinanceCrypto Response!");
                Assert.True(response.StatusCode == System.Net.HttpStatusCode.OK, "Get SMA Failed!");

                decimal priceCryptoApi = Convert.ToDecimal(responseBody);
                decimal priceDb = _cryptoDapper.GetSma(symbol, count, period, date);

                Assert.IsTrue(priceCryptoApi == priceDb,
                    $"For Symbol: {symbol}, for count: {count}, for period: {period}, for date: {date ?? DateOnly.FromDateTime(DateTime.Now)} \n " +
                    $"Both prices: {priceCryptoApi} and {priceDb} should be equal if there is no cashing!");
            }
        }

        #endregion

    }
}