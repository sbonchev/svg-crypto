using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using Vsg.DataModels;

namespace Vsg.Services
{
    /// <summary>
    /// Generic repository service.
    /// </summary>
    /// <typeparam name="T">CryptoPrices</typeparam>
    public class RepositoryService<T> : IRepositoryService<T> where T : CryptoPrices
    {
        protected readonly DbSet<T> _entities;
        private readonly CryptoDbContextService _context;

        public RepositoryService(CryptoDbContextService context)
        {
            _context = context;
            _entities = context.Set<T>();
        }

        /// <summary>
        /// Get first or default(null) using filter.
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        public T? FirstOrDefault(Expression<Func<T, bool>> filter)
        {
            return _entities.FirstOrDefault<T>(filter);
        }

        /// <summary>
        /// Get last avg id.
        /// </summary>
        public int GetMaxAvgId
        {
            get
            {
                var id = _entities.Any()
                               ? _entities.Max(p => p.IdAvg)
                               : 0;

                return id++;
            }
        }

        /// <summary>
        /// Get a entity list by selected filter.
        /// </summary>
        /// <param name="filter">Expression filter.</param>
        /// <returns></returns>
        public Task<List<T>>GetAllAsync(Expression<Func<T, bool>>? filter = null)
        {
            return filter == null
                ?  _entities.ToListAsync()
                :  _entities.Where(filter).ToListAsync();
        }

        public decimal Get24hAvgPriceAsync(string symbol)
        {                                          
            var maxAvgIds = _entities
                .GroupBy(g => new { g.Symbol, g.Interval, g.CloseTime })
                .Where(crp => crp.Key.Symbol == symbol
                              && crp.Key.Interval == $"1{TimeIntervals.h}")
                .Select(grp => grp.Max(m => m.IdAvg))
                .Distinct();

            var avgPrices = _entities.Where(dp => maxAvgIds.Contains(dp.IdAvg) 
                                                && dp.Symbol == symbol
                                                && dp.Interval == $"1{TimeIntervals.h}")
                                     .OrderBy(t => t.CloseTime)
                                     .Select(p => p.LastPrice);
            int hDatePointCount = avgPrices.Count();
            if (hDatePointCount < 1)
                throw new ArgumentException($"Not sufficient date-points for crypto currency: {symbol}!");
            // --- By the task requirement: "average price for the last 24h of data in the database (or the oldest available, if 24h of data is not available )"
            int dtPoints = hDatePointCount > 24 ? 24 : hDatePointCount;
            var avgPrice = avgPrices.ToList()
                                    .TakeLast(dtPoints)
                                    .Average();

            return avgPrice;
        }

        public decimal GetSimpleMovingAvgAsync(string symbol, int count, string period, long dtStartStamp, bool isStartFromNow)
        {
                var dataPoints = _entities.Where(crp => crp.Symbol == symbol
                                                && (isStartFromNow
                                                ? crp.CloseTime <= dtStartStamp
                                                : crp.CloseTime >= dtStartStamp)
                                                && crp.Interval == period);

                var maxAvgId = dataPoints.GroupBy(g => new { g.Symbol, g.Interval, g.CloseTime })
                                         .Select(grp => grp.Max(m => m.IdAvg));

                var avgPrices = dataPoints.Where(dp => maxAvgId.Contains(dp.IdAvg))
                                          .OrderBy(t => t.CloseTime)
                                          .Select(p => p.LastPrice);

                if (avgPrices.Count() < count)
                    throw new ArgumentException($"Not sufficient date-points for crypto currency crypto-symbol: {symbol}, period: {period}, count: {count}!");

               return avgPrices.ToList()
                               .TakeLast(count)
                               .Average();
        }


        /// <summary>
        /// Update or add the selected entity.
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="isUpdate">to be updated</param>
        /// <returns></returns>
        public async Task UpdInertAsync(T entity, bool isUpdate = false)
        {
            if (isUpdate)
                _entities.Update(entity);
            else
            {
                await _entities.AddAsync(entity); 
            }

            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(T entity)
        {
            _entities.Remove(entity);
            await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
