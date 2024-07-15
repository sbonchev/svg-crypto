using Cnl = System.Console;
using Vsg.Services;

namespace Vsg.Console
{
    internal class CryptoConsoleExec
    {
        private readonly ICryptoService _priceService;
        private readonly CryptoClientService _bgs;

        internal CryptoConsoleExec(ICryptoService priceService, CryptoClientService bgs)
        {
            _priceService = priceService;
            _bgs = bgs;
        }

        internal async Task ExecCrypto()
        {
            Cnl.BackgroundColor = ConsoleColor.Blue;
            Cnl.WriteLine(" Start Crypto Price Console App!");
            Cnl.WriteLine(" 1. Write the <symbol> arg - Get 24h average price for a symbol \n OR");
            Cnl.WriteLine(" 2. Write the <symbol> <n> <p> <s> args - Get Simple Moving Average for a symbol, <s> is optional");
            Cnl.WriteLine(" ---------------------------------------------------------------------- ");
            Cnl.WriteLine(" To Start The Crypto Background Service Enter: run");
            Cnl.WriteLine(" To Stop The Crypto Background Service Enter: cancel");
            Cnl.WriteLine(" To Stop The Crypto Console Db App Enter: xxxxx");
            Cnl.ResetColor();

            while (true)
            {
                Cnl.Write("\n Enter arguments: ");
                var input = Cnl.ReadLine();
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
                        Cnl.WriteLine(await _bgs.ToBeRun());
                        continue;
                    }

                    if (input == "cancel") // --- Stop the BGS
                    {
                        Cnl.WriteLine(_bgs.ToBeStopped());
                        continue;
                    }

                    var inputArgs = input.Split(' ');
                    if (inputArgs.Length < 1)
                    {
                        Cnl.WriteLine("Invalid arguments!");
                        continue;
                    }

                    var symbol = inputArgs[0];

                    if (inputArgs.Length == 1) // -- 24h AveragePrice - only {symbol}
                    {
                        var avgPrice = _priceService.Get24hAvgPriceAsync(symbol);
                        Cnl.WriteLine($"24h Average Price For {symbol.ToUpper()}: {avgPrice}");
                    }
                    else if (inputArgs.Length > 2 && inputArgs.Length < 5) // -- SMA
                    {
                        int n = int.Parse(inputArgs[1]);
                        string p = inputArgs[2];
                        DateTime? s = inputArgs.Length == 4 ? DateTime.Parse(inputArgs[3]) : null;
                        Cnl.WriteLine($"Usage: SMA symbol<{symbol}> count<{inputArgs[1]}> period<{inputArgs[2]}> [<Up-Date-Optional>{s}]");
                        var sma = _priceService.GetSimpleMovingAvgAsync(symbol, n, p, s);
                        Cnl.WriteLine($"SMA For {symbol.ToUpper()}: {sma}");
                    }
                    else
                        Cnl.WriteLine("Unknown command");

                }
                catch (Exception ex)
                {
                    Cnl.WriteLine($"An error occurred: {ex.Message}");
                }
            }
        }
    }
}
