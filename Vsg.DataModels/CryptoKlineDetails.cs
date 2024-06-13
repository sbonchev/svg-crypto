using System.Text.Json.Serialization;
using Vsg.DataModels.Converters;

namespace Vsg.DataModels
{
    /// <summary>
    /// Crypto Kline method details info.
    /// </summary>
    public class KlineDetails
    {
        /// <summary>
        /// Keeps periods - 1m, 5m, 30m, 1h, 1d, 1w, 1M
        /// </summary>
        [JsonPropertyName("i")]
        public string? Interval { get; set; }

        /// <summary>
        /// Kline close time
        /// </summary>
        [JsonPropertyName("T")]
        public Int64 CloseTime { get; set; }

        /// <summary>
        /// Close price
        /// </summary>
        [JsonPropertyName("c")]
        [JsonConverter(typeof(StringToDecimalConverter))]
        public decimal LastPrice { get; set; }

        /// <summary>
        /// Number of trades
        /// </summary>
        [JsonPropertyName("n")]
        public int NumberTrades { get; set; }
    }
}
