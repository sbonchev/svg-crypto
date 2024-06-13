using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Vsg.DataModels
{
    /// <summary>
    /// Crypto Kline DB table.
    /// </summary>
    [Table("CryptoPrices")]
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
        [Key]
        public decimal LastPrice { get; set; }

        /// <summary>
        /// Keeps periods - 1m, 5m, 30m, 1h, 1d, 1w, 1M
        /// </summary>
        [Key]
        [MaxLength(3)]
        public string Interval { get; set; }

        /// <summary>
        /// Crypto symbol name
        /// </summary>
        [Key]
        [MaxLength(32)]
        public string Symbol { get; set; }

    }
}
