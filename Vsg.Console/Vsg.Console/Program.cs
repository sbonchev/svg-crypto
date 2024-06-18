using Vsg.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Vsg.Console;

class Program
{
    /// <summary>
    /// Console application, which can execute the following commands:
    /// 24h {symbol}-Same as the / api /{ symbol}/ 24hAvgPrice endpoint
    /// SMA {symbol} { n}{ p}{ s}-Same as the / api /{ symbol}/ SimpleMovingAverage endpoint
    /// </summary>
    /// <param name="args"></param>
    /// <returns></returns>
    static async Task Main(string[] args)
    {
        var host = CreateHostBuilder(args).Build();
        var runHostTask = host.RunAsync();
        using var scope = host.Services.CreateScope();
        var priceService = scope.ServiceProvider.GetRequiredService<ICryptoService>();

        Console.WriteLine("Start Crypto Price Console App!");
        Console.WriteLine("  Write the <symbol> arg - Get 24h average price for a symbol");
        Console.WriteLine("  Write the <symbol> <n> <p> <s> args - Get Simple Moving Average for a symbol, <s> is optional");

        while (true)
        {
            Console.Write("\n Enter arguments: ");
            var input = Console.ReadLine();
            if (string.IsNullOrWhiteSpace(input))
            {
                continue;
            }

            var inputArgs = input.Split(' ');
            if (inputArgs.Length < 1)
            {
                Console.WriteLine("Invalid arguments!");
                continue;
            }

            var symbol = inputArgs[0];

            try
            {
                if (inputArgs.Length < 2) // -- 24h AveragePrice - only {symbol}
                {
                    var avgPrice = await priceService.Get24hAvgPriceAsync(symbol);
                    Console.WriteLine($"24h Average Price for {symbol}: {avgPrice}");
                }
                else if (inputArgs.Length > 1 && inputArgs.Length < 5) // -- SMA
                {
                    Console.WriteLine($"Usage: sma symbol<{symbol}> n<{inputArgs[1]}> p<{inputArgs[2]}> [<s>]");

                    int n = int.Parse(inputArgs[1]);
                    string p = inputArgs[2];
                    DateTime? s = inputArgs.Length == 4 ? DateTime.Parse(inputArgs[3]) : (DateTime?)null;
                    var sma = await priceService.GetSimpleMovingAvgAsync(symbol, n, p, s);
                    Console.WriteLine($"SMA for {symbol}: {sma}");
                }
                else
                      Console.WriteLine("Unknown command");

            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }

    }

    static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureAppConfiguration((context, config) =>
            {
                config.SetBasePath(AppContext.BaseDirectory);
                config.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
                config.AddEnvironmentVariables();
            })
            .ConfigureServices((context, services) =>
            {
                var connectionString = context.Configuration.GetConnectionString("DefaultConnection");

                services.AddScoped<ICryptoService, CryptoService>();
                services.AddScoped(typeof(IRepositoryService<>), typeof(RepositoryService<>));

                services.AddHostedService<CryptoClientService>();

                services.AddDbContext<CryptoDbContextService>(options =>
                    options.UseSqlServer(connectionString));

                services.AddMemoryCache();
            });

}
