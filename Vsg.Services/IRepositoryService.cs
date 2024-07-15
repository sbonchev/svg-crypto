using System.Linq.Expressions;
using Vsg.DataModels;

namespace Vsg.Services
{
    /// <summary>
    /// Generic repository service interface.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IRepositoryService<T> where T : CryptoBase
    {
        T? FirstOrDefault(Expression<Func<T, bool>> filter);

        /// <summary>
        /// Get last avg id.
        /// </summary>
        int GetMaxAvgId { get; }

        /// <summary>
        /// Get a entity list by selected filter.
        /// </summary>
        /// <param name="filter">Expression filter.</param>
        /// <returns></returns>
        Task<List<T>> GetAllAsync(Expression<Func<T, bool>>? filter = null);

        /// <summary>
        /// Update or add the selected entity.
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="isUpdate">to be updated</param>
        /// <returns></returns>
        Task UpdInertAsync(T entity, bool isUpdate = false);

        /// <summary>
        /// Delete the selected entity.
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        Task DeleteAsync(T entity);

        decimal Get24hAvgPriceAsync(string symbol);

        decimal GetSimpleMovingAvgAsync(string symbol, int count, string period, long dtStartStamp, bool isStartFromNow);

        void Dispose();
    }
}