using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Vsg.Services
{
    public class Repository<T> : IRepository<T> where T : class 
    {
        protected readonly DbSet<T> _entities;
        private readonly CryptoDbContextService _context;

        public Repository(CryptoDbContextService context)
        {
            _context = context;
            _entities = context.Set<T>();
        }

        public async Task<T> GetByIdAsync(int id)
        {
            return await _entities.FindAsync(id);
        }

        public async Task<List<T>> GetAllAsync(Expression<Func<T, bool>> filter = null)
        {
            return filter == null
                ? await _entities.ToListAsync()
                : await _entities.Where(filter).ToListAsync();
        }

        public async Task<T> GetFirstOrDefaultAsync(Expression<Func<T, bool>> where)
        {
            return await _entities.FirstOrDefaultAsync(where);
        }

        public async Task AddAsync(T entity)
        {
            await _entities.AddAsync(entity);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(T entity)
        {
            _entities.Update(entity);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(T entity)
        {
            _entities.Remove(entity);
            await _context.SaveChangesAsync();
        }
    }
}
