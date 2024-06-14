# Vsg.CryptoBinanceApi

Vsg.CryptoBinanceApi is a extensible solution based on Binance Crypto-Socket for providing real-time and historical cryptocurrency price data. It comprises a web API (`Vsg.Web.Api`) for serving price data and also a console application (`Vsg.Console`) for command-line interactions including a background service for collecting historical crypto data. The application structure consists also class libraries for managing data logic and utility help services.

## Introduction
Vsg.CryptoBinanceApi is an implementation based on Binance web-socket-streams solution 
### endpoint: **wss://stream.binance.com:9443**
### Kline/Candlestick Streams for UTC
The Kline/Candlestick Stream push updates to the current klines/candlestick every second in `UTC+0` timezone
<a id="kline-intervals"></a>
**Kline/Candlestick chart intervals:**

s-> seconds; m -> minutes; h -> hours; d -> days; w -> weeks; M -> months
* 1s
* 1m
* 3m
* 5m
* 15m
* 30m
* 1h
* 2h
* 4h
* 6h
* 8h
* 12h
* 1d
* 3d
* 1w
* 1M
  
Example:
{"e":"kline","E":1718201531114,"s":"BTCUSDT",
  k":{"t":1717977600000,"T":1718582399999,"s":"BTCUSDT","i":"1w"
  ,"f":3629710335,"L":3633242371,"o":"69648.15000000",
  **"c":"69500.00000000"**,"h":"70195.94000000","l":"66051.00000000","v":"76008.67337000","n":3532037,
  "x":false,"q":"5177867643.67048580","V":"37564.83557000","Q":"2559282362.06050490","B":"0"}}  

**Stream Name:** \<symbol\>@kline_\<interval\>

**Update Speed:** 1000ms for `1s`, 2000ms for the other intervals
* Kline intervals open and close in the `UTC+8` timezone. For example the `1d` klines will open at the beginning of the `UTC+8` day, and close at the end of the `UTC+8` day.
* Note that `E` (event time), `t` (start time) and `T` (close time) in the payload are Unix timestamps, which are always interpreted in UTC.

**Stream Name:** \<symbol\>@kline_\<interval\>@+08:00
### Average price streams push changes in the average price over a fixed time interval based on close timestamp.
**Moving average (SMA) is an arithmetic moving average calculated by adding recent prices and then dividing that figure by the number of time periods in the calculation average. For example, one could add the closing price of a security for a number of time periods and then divide this total by that same number of periods. Short-term averages respond quickly to changes in the price of the underlying security, while long-term averages are slower to react.**
The formula for SMA is:
SMA = 𝐴1+𝐴2+...+𝐴𝑛/𝑛
where: 𝐴𝑛 = the price of an asset at period 
n=the number of total periods

## Vsg.CryptoBinanceApi solution projects:
### 1. Vsg.Models 
* CryptoKline and CryptoKlineDetails classes for processing the Biance CryptoPrices by JSON serialization (see the ex.)
* CryptoPrices class for collecting the historical crypto-artifact info to Crypto Kline DB table.
* TimeIntervals enum - VSG def. time intervals (there are subset of Kline's ones)
* Json serialization converters
  
### 2. Vsg.Services
* CryptoDbContextService is implementation of Db sets and settings  based on DbContext class
* RepositoryService<T> is generic represention of the base CRUD operations
* CryptoService implements the task required basic operations - Get24hAvgPriceAsync(string symbol) and GetSimpleAvgMovingAsync(string symbol, int n, string p, DateTime? s)

### 3.  Vsg.Console 
* CryptoClientService works as a BackgroundService for collecting the Biance-socket information for the required crypto currences ("btcusdt", "adausdt", "ethusdt") and related periods (1w, 1d, 30m, 5m, 1m):
- create Biance-Kline url: wss://stream.binance.com:9443/ws/btcusdt@kline_1M/adausdt@kline_1M/ethusdt@kline_1M/btcusdt@kline_1w/adausdt@kline_1w/ethusdt@kline_1w/btcusdt@kline_1h/adausdt@kline_1h/ethusdt@kline_1h/btcusdt@kline_1d/adausdt@kline_1d/ethusdt@kline_1d/btcusdt@kline_1m/btcusdt@kline_5m/btcusdt@kline_30m/adausdt@kline_1m/adausdt@kline_5m/adausdt@kline_30m/ethusdt@kline_1m/ethusdt@kline_5m/ethusdt@kline_30m
* Console application also provides execution the following commands:
24h {symbol} - Same as the /api/{symbol}/24hAvgPrice endpoint by Get24hAvgPrice
sma {symbol} {n} {p} {s} - Same as the /api/{symbol}/SimpleMovingAverage endpoint by GetSimpleMovingAvgAsync

### 4. Vsg.Web.Api HTTP API implemented in BianceCryptoController which can accept and return both XML and JSON ( depending on Content-Type Header ) with the following endpoints:
* GET /api/{symbol}/24hAvgPrice - Returns the average price for the last 24h of data in the database ( or the oldest available, if 24h of data is not available )
{symbol} - The symbol the average price is being calculated for
* GET /api/{symbol}/SimpleAvgMoving?n={numberOfDataPoints}&p={timePeriod}&s=[startDateTime] - Return the current Simple Moving average of the symbol's price ( More info: Investopedia)
{symbol} - The symbol the average price is being calculated for
n - The amount of data points
p - The time period represented by each data point. Acceptable values: 1w, 1d, 30m, 5m, 1m
s - The datetime from which to start the SMA calculation ( a date )

### 5. Vsg.CryptoBinanceApi application Setup 
* Use MSSQL (Express) Server
* Restore CryptoServiveDb.sql DB sript (creat DB and inserts historical data for testing) lacated in ./Vsg.DataModels
* Fix the connection string in appsettings.json with your own proper one.
   

