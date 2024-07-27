using Dapper;
using System.Data;
using System.Text;
using Vsg.DataModels;

namespace Vsg.CryptoUTests.SqlDapper
{
    internal class CryptoDapper : BaseDapper<CryptoPrices>
    {
        private readonly StringBuilder _sb;

        private const string DateFormat = "yyyy-MM-dd";
        internal CryptoDapper(string connString) : base(connString)
        {
            _sb = new();
        }
        
        /// <summary>
        /// Check 24hAvgPrice result vs db.
        /// </summary>
        /// <param name="symbol">Biance currency symbol.</param>
        /// <returns></returns>
        internal decimal Get24hAvgPrice(string symbol)
        {
            _sb.Clear();

            _sb.AppendLine("SELECT TOP 24 [c].[LastPrice] ");
            _sb.AppendLine("FROM [CryptoPrices] AS [c] ");
            _sb.AppendLine("WHERE [c].[Symbol] = @Symbol ");
            _sb.AppendLine("AND [c].[Interval] = '1h' ");
            _sb.AppendLine("AND [c].[IdAvg] IN ");
            _sb.AppendLine("  ( SELECT DISTINCT MAX([c0].[IdAvg]) ");
            _sb.AppendLine("    FROM [CryptoPrices] AS [c0] ");
            _sb.AppendLine("    WHERE [c0].[Symbol] = @Symbol AND [c0].[Interval] = '1h' ");
            _sb.AppendLine("    GROUP BY [c0].[Symbol], [c0].[Interval], [c0].[CloseTime] ) ");            
            _sb.AppendLine("ORDER BY [c].[CloseTime] DESC");

            var sql = _sb.ToString();
            var prms = new DynamicParameters();
            prms.Add("@Symbol", symbol, DbType.String, ParameterDirection.Input);

            return GetQueryResult(sql, prms).Average();
        }

        /// <summary>
        /// Check SMA result vs db.
        /// </summary>
        /// <param name="symbol">Biance currency symbol.</param>
        /// <param name="count"></param>
        /// <param name="period">Period intervals.</param>
        /// <param name="date">To Date - op., if there is no date => take the current one.</param>
        /// <returns></returns>
        internal decimal GetSma(string symbol, int count, string period, DateOnly? date)
        {
            var dt = date == null ? DateOnly.FromDateTime(DateTime.Now)
                                  : date;
            var dtStartStamp = new DateTimeOffset(dt.Value.Year, dt.Value.Month, dt.Value.Day, 0, 0, 0, TimeSpan.Zero)
                                       .ToUnixTimeMilliseconds();
            var andDate = date == null ? "AND [c].[CloseTime] <= @dtStartStamp "
                                       : "AND [c].[CloseTime] >  @dtStartStamp ";
            _sb.Clear();

            _sb.AppendLine($"SELECT TOP {count} [c].[LastPrice] ");
            _sb.AppendLine("FROM [CryptoPrices] AS [c] ");
            _sb.AppendLine("WHERE [c].[Symbol] = @symbol ");
            _sb.AppendLine(andDate );
            _sb.AppendLine("AND [c].[Interval] = @period ");
            _sb.AppendLine("AND [c].[IdAvg] IN ");
            _sb.AppendLine("  ( SELECT DISTINCT MAX([c0].[IdAvg]) ");
            _sb.AppendLine("    FROM [CryptoPrices] AS [c0] ");
            _sb.AppendLine("    WHERE [c0].[Symbol] = @symbol ");
            _sb.AppendLine(     andDate );
            _sb.AppendLine("    AND [c0].[Interval] = @period ");
            _sb.AppendLine("    GROUP BY [c0].[Symbol], [c0].[Interval], [c0].[CloseTime] ) ");
            _sb.AppendLine("ORDER BY [c].[CloseTime] DESC ");

            var sql = _sb.ToString();
            var prms = new DynamicParameters();
            prms.Add("@symbol", symbol, DbType.String, ParameterDirection.Input);
            prms.Add("@period", period, DbType.String, ParameterDirection.Input);
            prms.Add("@dtStartStamp", dtStartStamp, DbType.Int64, ParameterDirection.Input);

            return GetQueryResult(sql, prms).Average();
        }
    }
}
