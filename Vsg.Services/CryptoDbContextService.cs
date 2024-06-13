using Microsoft.EntityFrameworkCore;
using Vsg.DataModels;

namespace Vsg.Services
{
    public class CryptoDbContextService : DbContext
    {
        public DbSet<CryptoPrices> Prices { get; set; }

        public CryptoDbContextService(DbContextOptions<CryptoDbContextService> options)
            : base(options)
        {
            Prices = this.Set<CryptoPrices>();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<CryptoPrices>(entity =>
            {
                entity.Property(p => p.LastPrice).HasPrecision(18, 8);

                entity.HasIndex(p => p.Symbol);
                entity.HasIndex(p => p.LastPrice);
            });
        }
    }
}
