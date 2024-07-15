using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Vsg.Console;
using Vsg.Services;

class Program
{

    /// <summary>
    /// Console application, which can execute the following commands:
    /// 24h: {symbol}-Same as the / api /{ symbol}/ 24hAvgPrice endpoint
    /// SMA: {symbol} {count-n} {period-p} {to-date-s} - Same as the / api /{ symbol}/ SimpleMovingAverage endpoint
    /// </summary>
    /// <param name="args"></param>
    /// <returns></returns>
    static async Task Main(string[] args)
    {
        var host = CreateHostBuilder(args).Build();
        using (var scope = host.Services.CreateScope())
        {
            var priceService = scope.ServiceProvider.GetRequiredService<ICryptoService>();
            var serviceProvider = scope.ServiceProvider
                      .GetServices<IHostedService>()
                      .OfType<CryptoClientService>()
                      .Single();

            var srv = new CryptoConsoleExec(priceService, serviceProvider);
            await srv.ExecCrypto(); 
        }
    }

    /// <summary>
    /// Configuration and services' registration.
    /// </summary>
    /// <param name="args"></param>
    /// <returns></returns>
    private static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureAppConfiguration((context, config) =>
            {
                config.SetBasePath(AppContext.BaseDirectory);
                config.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
                config.AddEnvironmentVariables();
            })
            .ConfigureServices((context, services) =>
            {
                var sc = services.AddScoped<ICryptoService, CryptoService>();
                sc.AddMemoryCache();

                services.AddScoped<ILogger, Logger<CryptoService>>();
                services.AddScoped(typeof(IRepositoryService<>), typeof(RepositoryService<>));

                services.AddHostedService<CryptoClientService>();

                var connectionString = context.Configuration.GetConnectionString("DefaultConnection");
                services.AddDbContext<CryptoDbContextService>(options =>
                    options.UseSqlServer(connectionString));
            });

}


