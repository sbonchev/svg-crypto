
namespace Vsg.Services
{
    /// <summary>
    /// ICryptoService for calculating 24h price & simple movment average.
    /// </summary>
    public interface ICryptoService
    {
        Task<decimal> Get24hAvgPriceAsync(string symbol);
        Task<decimal> GetSimpleMovingAvgAsync(string symbol, int n, string p, DateTime? s);
    }
}