USE [master]
GO
/****** Object:  Database [CryptoService]    Script Date: 18/06/2024 11:33:11 ******/
CREATE DATABASE [CryptoService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CryptoService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CryptoService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CryptoService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CryptoService_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CryptoService] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CryptoService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CryptoService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CryptoService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CryptoService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CryptoService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CryptoService] SET ARITHABORT OFF 
GO
ALTER DATABASE [CryptoService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CryptoService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CryptoService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CryptoService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CryptoService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CryptoService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CryptoService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CryptoService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CryptoService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CryptoService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CryptoService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CryptoService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CryptoService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CryptoService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CryptoService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CryptoService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CryptoService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CryptoService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CryptoService] SET  MULTI_USER 
GO
ALTER DATABASE [CryptoService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CryptoService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CryptoService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CryptoService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CryptoService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CryptoService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CryptoService] SET QUERY_STORE = ON
GO
ALTER DATABASE [CryptoService] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [CryptoService]
GO
/****** Object:  Table [dbo].[CryptoPrices]    Script Date: 18/06/2024 11:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CryptoPrices](
	[LastPrice] [decimal](19, 4) NOT NULL,
	[Interval] [varchar](3) NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[CloseTime] [bigint] NOT NULL,
	[IdAvg] [int] NOT NULL,
 CONSTRAINT [PK_CryptoPrices] PRIMARY KEY CLUSTERED 
(
	[LastPrice] ASC,
	[Interval] ASC,
	[Symbol] ASC,
	[CloseTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 219)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 221)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699039999, 223)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 217)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 218)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 220)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3785 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699099999, 222)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 71)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 72)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'1m', N'adausdt', 1718698979999, 75)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699039999, 195)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 76)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 70)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 73)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3786 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699099999, 74)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 4)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 6)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'1m', N'adausdt', 1718698979999, 8)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699039999, 173)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 2)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 3)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 5)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3787 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699099999, 7)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 24)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 26)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'1m', N'adausdt', 1718698979999, 28)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699039999, 157)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 22)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 23)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 25)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3788 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699099999, 27)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 254)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 256)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699039999, 258)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 252)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 253)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 255)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3789 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699099999, 257)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 296)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 298)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699159999, 299)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699219999, 314)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 294)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 295)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 297)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3792 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699399999, 300)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 274)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 275)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699159999, 278)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699219999, 315)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 279)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 273)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 276)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3793 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699399999, 277)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 357)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 359)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699219999, 361)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699279999, 424)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699339999, 525)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 355)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 356)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 358)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3794 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699399999, 360)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 379)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 381)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699219999, 383)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699279999, 420)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699339999, 505)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 377)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 378)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 380)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3795 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699399999, 382)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 393)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 395)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699219999, 397)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699339999, 504)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 391)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 392)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 394)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3796 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699399999, 396)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'1d', N'adausdt', 1718755199999, 400)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'1h', N'adausdt', 1718701199999, 402)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'1m', N'adausdt', 1718699219999, 404)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'1m', N'adausdt', 1719791999999, 398)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'1w', N'adausdt', 1719187199999, 399)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'30m', N'adausdt', 1718699399999, 401)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(0.3797 AS Decimal(19, 4)), N'5m', N'adausdt', 1718699399999, 403)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 233)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 235)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 237)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 231)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 232)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 234)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3440.9900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 236)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 247)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 249)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 251)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 245)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 246)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 248)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.0900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 250)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 209)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 208)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 205)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 204)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 203)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 207)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 206)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 261)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 263)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 265)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 259)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 260)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 262)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.3900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 264)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 268)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 270)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 272)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 266)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 267)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 269)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.4000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 271)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 190)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 192)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 194)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 188)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 189)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 191)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 193)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 187)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 186)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 183)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 182)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 181)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 185)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3441.6100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 184)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 176)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 178)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 180)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 174)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 175)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 177)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.0400 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 179)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 52)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 54)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 56)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 50)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 51)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 53)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 55)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 65)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 67)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 69)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 63)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 64)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 66)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.2100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 68)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 17)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 19)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 21)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 15)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 16)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 18)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 20)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 31)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 33)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 35)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 29)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 30)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 32)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 34)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 80)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 82)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 84)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 78)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 79)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 81)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.4600 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 83)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 165)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 164)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 161)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 160)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 159)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 163)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 162)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.6500 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699039999, 155)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 87)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 89)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 91)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 85)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 86)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 88)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9500 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 90)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 98)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 97)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 94)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 93)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 92)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 96)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9600 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 95)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 151)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 153)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699159999, 310)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 316)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 149)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 150)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 152)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 154)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9800 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 311)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 144)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 146)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 148)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699159999, 308)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 312)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 142)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 143)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 145)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 147)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3442.9900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 309)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 282)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 284)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699159999, 285)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 362)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 423)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 516)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 280)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 281)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 283)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 286)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 347)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 346)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 341)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 421)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 524)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 343)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 342)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 345)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.0100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 344)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 107)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 109)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 111)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 514)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 105)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 106)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 108)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 110)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 326)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 333)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 332)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 327)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 507)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 329)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 328)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 331)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 330)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 376)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 375)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 372)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 371)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 370)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 374)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 373)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 365)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 367)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 369)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 419)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 363)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 364)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 366)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.2800 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 368)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 115)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 117)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 119)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 540)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 113)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 114)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 116)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 118)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 539)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 127)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 126)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718698979999, 123)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 122)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 121)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 125)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.3800 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699099999, 124)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 498)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 500)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 506)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 496)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 497)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 499)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.4900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 501)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 503)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 390)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 389)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 386)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 385)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 384)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 388)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 387)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 321)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 323)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 325)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 426)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 319)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 320)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 322)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5800 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 324)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.5900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699219999, 318)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 436)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 438)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 440)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 434)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 435)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 437)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.6200 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 439)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 450)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 452)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 454)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 448)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 449)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 451)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.7900 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 453)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 549)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 551)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699339999, 553)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 547)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 548)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 550)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3443.9300 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 552)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 485)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 487)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 489)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 483)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 484)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 486)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2000 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 488)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 475)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 472)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 465)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 463)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 462)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 470)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.2100 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 467)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'1d', N'ethusdt', 1718755199999, 457)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'1h', N'ethusdt', 1718701199999, 459)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1718699279999, 461)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'1m', N'ethusdt', 1719791999999, 455)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'1w', N'ethusdt', 1719187199999, 456)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'30m', N'ethusdt', 1718699399999, 458)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(3444.3700 AS Decimal(19, 4)), N'5m', N'ethusdt', 1718699399999, 460)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699339999, 515)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 519)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 521)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699339999, 523)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 517)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 518)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 520)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65601.7300 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 522)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8600 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 535)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8600 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 537)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 533)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8600 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 534)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8600 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 536)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8600 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 538)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 531)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 526)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699339999, 532)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 530)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 528)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 527)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65606.8700 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 529)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 492)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 494)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699339999, 502)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 490)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 491)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 493)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.1900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 495)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.2000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 510)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.2000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 512)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.2000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 508)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.2000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 509)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.2000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 511)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65610.2000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 513)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 558)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 560)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699339999, 555)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 556)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 557)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 559)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65613.9900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 561)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 543)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 545)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699339999, 554)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 541)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 542)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 544)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65614.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 546)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 478)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 480)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 482)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 476)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 477)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 479)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 481)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 473)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 464)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 474)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 471)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 468)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 466)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.0100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 469)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 407)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 409)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699219999, 411)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 422)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 405)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 406)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 408)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3500 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 410)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 414)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 416)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 418)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 412)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 413)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 415)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65626.3600 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 417)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65629.9800 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 425)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 446)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 441)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 433)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 445)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 443)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 442)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 444)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 429)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 431)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699279999, 447)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 427)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 428)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 430)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65635.8200 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 432)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 350)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 352)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699219999, 354)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 348)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 349)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 351)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0200 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 353)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 336)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 338)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699219999, 340)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 334)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 335)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 337)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65636.0300 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 339)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 240)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 242)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 244)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 238)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 239)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 241)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.0100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 243)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 46)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 48)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 43)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 44)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 45)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 47)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8200 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 49)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 59)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 61)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 77)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 57)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 58)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 60)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65638.8300 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 62)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 215)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 210)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 216)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 214)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 212)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 211)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 213)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 226)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 228)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 230)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 224)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 225)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 227)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65640.0200 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 229)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 39)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 41)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 36)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 37)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 38)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 40)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 42)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 11)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 13)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 1)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 9)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 10)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 12)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.0100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 14)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 303)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 305)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699159999, 306)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699219999, 317)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 301)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 302)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 304)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.4900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 307)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 289)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 291)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699159999, 292)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699219999, 313)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 287)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 288)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 290)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65642.5000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699399999, 293)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 101)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 103)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 112)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 99)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 100)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 102)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.3900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 104)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65645.4000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 120)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 201)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 196)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 202)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 200)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 198)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 197)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65646.5100 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 199)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 168)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 170)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 158)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 166)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 167)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 169)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3300 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 171)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.3400 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 172)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 130)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 132)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 134)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718699039999, 156)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 128)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 129)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 131)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65655.9900 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 133)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'1d', N'btcusdt', 1718755199999, 137)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'1h', N'btcusdt', 1718701199999, 139)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1718698979999, 141)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'1m', N'btcusdt', 1719791999999, 135)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'1w', N'btcusdt', 1719187199999, 136)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'30m', N'btcusdt', 1718699399999, 138)
GO
INSERT [dbo].[CryptoPrices] ([LastPrice], [Interval], [Symbol], [CloseTime], [IdAvg]) VALUES (CAST(65656.0000 AS Decimal(19, 4)), N'5m', N'btcusdt', 1718699099999, 140)
GO
USE [master]
GO
ALTER DATABASE [CryptoService] SET  READ_WRITE 
GO
