using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Vsg.Services
{
    /// <summary>
    /// Generic repository service.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class RepositoryService<T> : IRepositoryService<T> where T : class 
    {
        protected readonly DbSet<T> _entities;
        private readonly CryptoDbContextService _context;

        public RepositoryService(CryptoDbContextService context)
        {
            _context = context;
            _entities = context.Set<T>();
        }

        /// <summary>
        /// Get a entity list by selected filter.
        /// </summary>
        /// <param name="filter">Expression filter.</param>
        /// <returns></returns>
        public async Task<List<T>> GetAllAsync(Expression<Func<T, bool>> filter = null)
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
                if(_entities.FirstOrDefault(e => e == entity) == null) //-- checks if the row has been already inserted
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
