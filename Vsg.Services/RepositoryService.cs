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
            // --- Get all data points filter candidates:
            var dataPoints = _entities.Where(dp => dp.Symbol == symbol
                                                && dp.Interval == $"1{TimeIntervals.h}");
            // --- Get all unique max IdAvg values:
            var maxAvgIds = dataPoints.GroupBy(g => new { g.Symbol, g.Interval, g.CloseTime })
                                      .Select(grp => grp.Max(m => m.IdAvg))
                                      .Distinct(); 
            // --- Get LastPrice coresponding to {all unique max IdAvg values} order by desc:
            var avgPrices = dataPoints.Where(dp => maxAvgIds.Contains(dp.IdAvg))
                                      .OrderByDescending(t => t.CloseTime)
                                      .Select(p => p.LastPrice); 
            // --- By the task requirement: "average price for the last 24h of data in the database (or the oldest available, if 24h of data is not available )"
            var avgPrice = avgPrices.Take(24) // --- for the last 24h
                                    .ToList();
            if (avgPrice.Count < 1)
                throw new ArgumentException($"Not sufficient date-points for crypto currency: {symbol}!");

            return avgPrice.Average();
        }

        public decimal GetSimpleMovingAvgAsync(string symbol, int count, string period, long dtStartStamp, bool isStartFromNow)
        {
            // --- Get all dataPoints candidates:
            var dataPoints = _entities.Where(crp => crp.Symbol == symbol
                                                && (isStartFromNow
                                                ? crp.CloseTime <= dtStartStamp
                                                : crp.CloseTime >= dtStartStamp)
                                                && crp.Interval == period);
            // --- Get all unique max IdAvg values among the selected dataPoints:
            var maxAvgId = dataPoints.GroupBy(g => new { g.Symbol, g.Interval, g.CloseTime })
                                     .Select(grp => grp.Max(m => m.IdAvg))
                                     .Distinct();
            // --- Get all LastPrice in desk order coresponding to {all unique max IdAvg values}
            var avgPrices = dataPoints.Where(dp => maxAvgId.Contains(dp.IdAvg))
                                      .OrderByDescending(t => t.CloseTime)
                                      .Select(p => p.LastPrice)
                                      .Take(count)
                                      .ToList();

           if (avgPrices.Count() < 1)
                    throw new ArgumentException("Not sufficient date-points for crypto currency \n" +
                                                $"crypto-symbol: {symbol}, period: {period}, count: {count} and date time stamp: [{dtStartStamp}]!");

           return avgPrices.Average();
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
