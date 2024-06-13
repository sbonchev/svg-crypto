using System.ComponentModel.DataAnnotations;

namespace Vsg.DataModels
{
    /// <summary>
    /// Crypto Kline DB table.
    /// </summary>
    public class CryptoPrices
    {
        /// <summary>
        /// Kline's close time
        /// </summary>
        [Key]
        public Int64 CloseTime { get; set; }

        /// <summary>
        /// Close price
        /// </summary>
        public decimal LastPrice { get; set; }

        /// <summary>
        /// Keeps periods - 1m, 1h, 1d, 1w, 1M
        /// </summary>
        public string? Interval { get; set; }

        /// <summary>
        /// Crypto symbol name
        /// </summary>
        public string? Symbol { get; set; }

    }
}
