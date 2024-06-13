
namespace Vsg.Services
{
    public interface ICryptoService
    {
        Task<decimal> Get24hAvgPriceAsync(string symbol);
        Task<decimal> GetSimpleMovingAvgAsync(string symbol, int n, string p, DateTime? s);
    }
}