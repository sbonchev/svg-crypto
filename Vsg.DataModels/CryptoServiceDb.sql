USE [CryptoService]
GO
/****** Object:  Table [dbo].[CryptoPrices]    Script Date: 14/06/2024 13:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CryptoPrices](
	[LastPrice] [decimal](19, 4) NOT NULL,
	[Interval] [varchar](3) NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[CloseTime] [bigint] NOT NULL,
 CONSTRAINT [PK_CryptoPrices] PRIMARY KEY CLUSTERED 
(
	[LastPrice] ASC,
	[Interval] ASC,
	[Symbol] ASC,
	[CloseTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'1d', N'adausdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'1h', N'adausdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'1m', N'adausdt', 1718321939999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'1w', N'adausdt', 1718582399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'30m', N'adausdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4221 AS Decimal(19, 4)), N'5m', N'adausdt', 1718321999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4223 AS Decimal(19, 4)), N'1m', N'adausdt', 1718349779999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4223 AS Decimal(19, 4)), N'5m', N'adausdt', 1718349899999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4224 AS Decimal(19, 4)), N'1m', N'adausdt', 1718359559999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4224 AS Decimal(19, 4)), N'5m', N'adausdt', 1718359799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4225 AS Decimal(19, 4)), N'1m', N'adausdt', 1718359379999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(0.4231 AS Decimal(19, 4)), N'1m', N'adausdt', 1718356439999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3466.8000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718324639999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3468.9700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718324459999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3468.9700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718324699999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3469.8000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718324519999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3469.8300 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718323859999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3469.8300 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718324099999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3472.0700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718323679999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3472.4300 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718323739999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.0800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718321939999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.2100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.2100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.2100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1718582399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.2100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.2100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718321999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9300 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718323619999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718321939999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'1w', N'ethusdt', 1718582399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3473.9400 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718321999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3475.3900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718323379999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3511.5600 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718359739999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3513.2700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718359919999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.1900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718359979999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718359859999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.2000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718360099999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.4200 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345459999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.4200 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718345699999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.4400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345519999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.9100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718360159999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3514.9100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718360399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718360039999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718360459999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.2100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718360699999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.5700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718350139999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.8200 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345159999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.8200 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718345399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3515.9700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345579999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.1900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345759999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.1900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718345999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.3800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345219999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.5200 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718350439999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.6000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718350079999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.6100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718355599999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.6100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718352059999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.6100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718353799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.6100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718352299999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3516.7900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718360219999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3517.4000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345279999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3517.6100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718345639999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3517.8000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718352419999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3517.8400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718356679999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3517.9600 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718360339999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3518.3800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718352179999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3519.4100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718349839999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3519.6000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718356859999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3519.6000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718357099999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.0000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718356259999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.0000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718356499999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.0700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718356559999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.0700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718356799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.1400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718349239999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.1500 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718350919999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.2200 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718356319999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.3100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718352539999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.6300 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718350859999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3520.6300 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718351099999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3521.8100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718356139999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3523.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718352659999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3523.9900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718352899999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3525.0700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718351639999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(3527.3000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718352839999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66685.3800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718324579999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66716.4300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718324279999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66717.4200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718324339999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66738.7600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718324159999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66738.7600 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718324399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66749.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718324219999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66778.4500 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718409599999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66778.4500 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718326799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66778.4500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323259999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66778.4500 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718324999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66778.4500 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718323499999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66785.2600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323919999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66792.1600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323139999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66808.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323319999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66816.3800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718324039999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66822.7200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323979999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718321939999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1718582399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718321999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66850.8000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359619999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718321939999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'1w', N'btcusdt', 1718582399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718323199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66857.0200 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718321999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66871.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323439999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66896.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718352239999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66897.9500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718323559999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66897.9500 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718323799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66903.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359679999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66904.5400 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718358239999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66910.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718352119999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66920.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718362799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66920.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359259999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66920.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718360999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66920.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718359499999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66924.8400 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359079999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66929.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350379999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66932.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718358359999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66932.9900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718358599999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66934.8600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351039999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66935.1100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718358419999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66939.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359139999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66940.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718358179999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66940.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359439999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66941.2800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350319999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66943.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718352359999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66943.0100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718352599999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66944.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350619999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66948.2700 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718359319999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66952.4000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350679999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66952.4000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350739999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66956.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350979999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66959.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350259999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66959.9900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718350499999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66960.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351159999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66960.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718351399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66961.2000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718349959999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66963.1500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718352479999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66963.4100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350019999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66966.3100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718350559999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66966.3100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718350799999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66968.2300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718360279999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66970.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718345339999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66975.9900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718348399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66975.9900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718346599999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66975.9900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718345099999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66979.5000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351219999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66986.4900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718358119999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66990.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351939999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(66994.7500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351339999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67000.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718358059999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67000.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718358299999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67000.4000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718349179999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67008.0200 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718357999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67013.3900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718351999999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67013.3900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718349119999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67013.3900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718350199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67013.3900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718349299999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67017.0800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351459999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67017.0800 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718351699999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67018.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351279999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67025.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351819999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67025.4800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351519999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67029.8600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351879999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67040.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718356619999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67061.3600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718356379999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67064.1600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351759999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67075.8800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718356079999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67080.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718356019999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67081.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718351579999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67100.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718352719999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67104.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718359199999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67104.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718355839999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67104.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718357399999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67104.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718355899999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67117.2900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718352779999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67126.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718355959999)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime]) VALUES (CAST(67126.0100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718356199999)
GO

--- test:
SELECT [LastPrice]
      ,[Interval]
      ,[Symbol]
      ,[CloseTime]
  FROM [CryptoService].[dbo].[CryptoPrices]
  where Interval = '5m' and Symbol = 'btcusdt'
  			and CloseTime >= 1718356199998
