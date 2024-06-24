using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using Vsg.DataModels;

namespace Vsg.Services
{
    /// <summary>
    /// Generic repository service.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class RepositoryService<T> : IRepositoryService<T> where T : CryptoBase
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
        public async Task<List<T>> GetAllAsync(Expression<Func<T, bool>>? filter = null)
        {
            return filter == null
                ? await _entities.ToListAsync()
                : await _entities.Where(filter).ToListAsync();
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
