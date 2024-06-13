﻿using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vsg.DataModels;

namespace Vsg.Services
{
    public class CryptoService //:  IRepository<CryptoPrices>
    {
       
        private readonly IRepository<CryptoPrices> _priceRepository;
        private readonly IMemoryCache _cache;


        public CryptoService( IRepository<CryptoPrices> priceRepository, IMemoryCache cache)
        {
          
            _priceRepository = priceRepository;
            _cache = cache;
        }

        public async Task<decimal> Get24hAvgPriceAsync(string symbol)
        {
            var cacheKey = $"{symbol}_24hAvgPrice";
            if (_cache.TryGetValue(cacheKey, out decimal cachedPrice))
            {
                return cachedPrice;
            }

            try
            {
                var avgPrice = await _priceRepository.Get24hAvgPriceAsync(symbol);
                _cache.Set(cacheKey, avgPrice, TimeSpan.FromMinutes(10));
                return avgPrice;
            }
            catch (ExceptionHandler ex)
            {
                throw new ExceptionHandler($"Error in service: {ex.Message}", ex.ErrorCode, ex);
            }
        }

        public async Task<decimal> GetSimpleMovingAverageAsync(string symbol, int n, string p, DateTime? s)
        {
            TimeSpan timePeriod = p switch
            {
                "1w" => TimeSpan.FromDays(7),
                "1d" => TimeSpan.FromDays(1),
                "30m" => TimeSpan.FromMinutes(30),
                "5m" => TimeSpan.FromMinutes(5),
                "1m" => TimeSpan.FromMinutes(1),
                _ => throw new ArgumentException("Invalid time period."),
            };

            try
            {
                var sma = await _priceRepository.GetSimpleMovingAverageAsync(symbol, n, timePeriod, s);
                return sma;
            }
            catch (ExceptionHandler ex)
            {
                throw new ExceptionHandler($"Error in service: {ex.Message}", ex.ErrorCode, ex);
            }
        }
    }
}

    }
}
