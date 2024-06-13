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
            //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            modelBuilder.Entity<CryptoPrices>(entity =>
            {
                entity.Property(p => p.LastPrice).HasPrecision(19, 4);
                entity.HasKey(p => p.Symbol);
                entity.HasKey(p => p.LastPrice);
                entity.HasKey(p => p.Interval);
                entity.HasKey(p => p.CloseTime);
            });
        }
    }
}
