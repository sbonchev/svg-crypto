using Vsg.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Vsg.Console;
using Microsoft.Extensions.Logging;

class Program
{

    /// <summary>
    /// Console application, which can execute the following commands:
    /// 24h: {symbol}-Same as the / api /{ symbol}/ 24hAvgPrice endpoint
    /// SMA: {symbol} {n} {p} {s} - Same as the / api /{ symbol}/ SimpleMovingAverage endpoint
    /// </summary>
    /// <param name="args"></param>
    /// <returns></returns>
    static async Task Main(string[] args)
    {
        var host = CreateHostBuilder(args).Build(); 
        using (var scope = host.Services.CreateScope())
        {
            var priceService = scope.ServiceProvider.GetRequiredService<ICryptoService>();
            await Task.Run(async () =>
            {
                await ExecCrypto(priceService, scope);
            });
        }
    }

    /// <summary>
    /// Configuration and service registration.
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

    /// <summary>
    /// Get an instance of CryptoClientService.
    /// </summary>
    /// <param name="scope"></param>
    /// <returns></returns>
    static private CryptoClientService GetBackgroundService(IServiceScope scope) => scope
                                                                                 .ServiceProvider
                                                                                 .GetServices<IHostedService>()
                                                                                 .OfType<CryptoClientService>()
                                                                                 .Single();

    static private async Task ExecCrypto(ICryptoService priceService, IServiceScope scope)
    {
        Console.BackgroundColor = ConsoleColor.Blue;
        Console.WriteLine(" Start Crypto Price Console App!");
        Console.WriteLine(" 1. Write the <symbol> arg - Get 24h average price for a symbol \n OR");
        Console.WriteLine(" 2. Write the <symbol> <n> <p> <s> args - Get Simple Moving Average for a symbol, <s> is optional");
        Console.WriteLine(" ---------------------------------------------------------------------- ");
        Console.WriteLine(" To Start The Crypto Background Service Enter: run");
        Console.WriteLine(" To Stop The Crypto Background Service Enter: cancel");
        Console.WriteLine(" To Stop The Crypto Console Db App Enter: xxxxx");
        Console.ResetColor();

        while (true)
        {
            Console.Write("\n Enter arguments: ");
            var input = Console.ReadLine();

            try
            {

                if (string.IsNullOrWhiteSpace(input))
                {
                    continue;
                }

                if (input == "xxxxx")
                {
                    Environment.Exit(0);
                    break;
                }

                if (input == "run") // --- Run the BGS
                {
                    var bgs = GetBackgroundService(scope);
                    if (!bgs.IsRunning)
                        await bgs.StartAsync(bgs.CancellationTS.Token);
                    else
                        Console.WriteLine("BackgroundService has already been run!");

                    continue;
                }

                if (input == "cancel") // --- Stop the BGS
                {
                    var bgs = GetBackgroundService(scope);
                    if (bgs.IsRunning)
                        bgs.CancellationTS.Cancel();
                    else
                        Console.WriteLine("BackgroundService cannot be canceled because is not run!");

                    continue;
                }

                var inputArgs = input.Split(' ');
                if (inputArgs.Length < 1)
                {
                    Console.WriteLine("Invalid arguments!");
                    continue;
                }

                var symbol = inputArgs[0];

                if (inputArgs.Length == 1) // -- 24h AveragePrice - only {symbol}
                {
                    var avgPrice = await priceService.Get24hAvgPriceAsync(symbol); 
                    
                    Console.WriteLine($"24h Average Price For {symbol.ToUpper()}: {avgPrice}");
                }
                else if (inputArgs.Length > 2 && inputArgs.Length < 5) // -- SMA
                {
                    Console.WriteLine($"Usage: sma symbol<{symbol}> n<{inputArgs[1]}> p<{inputArgs[2]}> [<s>]");

                    int n = int.Parse(inputArgs[1]);
                    string p = inputArgs[2];
                    DateTime? s = inputArgs.Length == 4 ? DateTime.Parse(inputArgs[3]) : null;
                    var sma = await priceService.GetSimpleMovingAvgAsync(symbol, n, p, s);
                    Console.WriteLine($"SMA For {symbol.ToUpper()}: {sma}");
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


}
