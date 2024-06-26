USE [master]
GO
/****** Object:  Database [Pccreator]    Script Date: 27/05/2018 20:19:13 ******/
CREATE DATABASE [Pccreator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pccreator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pccreator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pccreator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pccreator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pccreator] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pccreator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pccreator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pccreator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pccreator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pccreator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pccreator] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pccreator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pccreator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pccreator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pccreator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pccreator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pccreator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pccreator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pccreator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pccreator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pccreator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pccreator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pccreator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pccreator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pccreator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pccreator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pccreator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pccreator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pccreator] SET RECOVERY FULL 
GO
ALTER DATABASE [Pccreator] SET  MULTI_USER 
GO
ALTER DATABASE [Pccreator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pccreator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pccreator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pccreator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pccreator] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pccreator', N'ON'
GO
ALTER DATABASE [Pccreator] SET QUERY_STORE = OFF
GO
USE [Pccreator]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Pccreator]
GO
/****** Object:  Table [dbo].[pcCreated]    Script Date: 27/05/2018 20:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pcCreated](
	[pcId] [int] IDENTITY(1,1) NOT NULL,
	[cpuId] [int] NULL,
	[coolingSystemId] [int] NULL,
	[hardDiskId] [int] NULL,
	[ramId] [int] NULL,
	[dateCreated] [date] NULL,
	[price] [decimal](6, 2) NULL,
	[graphicsCardNum] [int] NULL,
	[providerNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[incomesByMonth]    Script Date: 27/05/2018 20:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view  [dbo].[incomesByMonth] as
SELECT  MONTH(dateCreated) AS monthNum, SUM(price) AS incomes
FROM dbo.pcCreated
where year(dateCreated) = year(getdate())
GROUP BY MONTH(dateCreated)
GO
/****** Object:  Table [dbo].[coolingSystem]    Script Date: 27/05/2018 20:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coolingSystem](
	[coolingSystemId] [int] IDENTITY(1,1) NOT NULL,
	[Coolingname] [varchar](20) NULL,
	[manufacturerNum] [int] NULL,
	[coolingLevel] [int] NULL,
	[price] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[coolingSystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cpu]    Script Date: 27/05/2018 20:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cpuName] [varchar](200) NULL,
	[manufacturerId] [int] NULL,
	[cpuSpeed] [decimal](10, 2) NULL,
	[numberOfCores] [int] NULL,
	[requiredVat] [int] NULL,
	[coldRankRequired] [int] NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[graphicsCard]    Script Date: 27/05/2018 20:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[graphicsCard](
	[GraphicsCardId] [int] IDENTITY(1,1) NOT NULL,
	[graphicsName] [varchar](200) NULL,
	[manufacturerNum] [int] NULL,
	[size] [decimal](10, 2) NULL,
	[speed] [decimal](10, 2) NULL,
	[reqElectricity] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[coolingLevel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GraphicsCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hardDrive]    Script Date: 27/05/2018 20:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hardDrive](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hardDiskName] [varchar](200) NULL,
	[manufacturerId] [int] NULL,
	[isSSD] [bit] NULL,
	[hardDriveSpeed] [decimal](10, 2) NULL,
	[hardDiskSizeInGB] [int] NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[providers](
	[providerId] [int] IDENTITY(1,1) NOT NULL,
	[proName] [varchar](20) NULL,
	[elecrisityPower] [int] NULL,
	[manufacturerNum] [int] NULL,
	[price] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ram]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ram](
	[idRam] [int] IDENTITY(1,1) NOT NULL,
	[ramName] [varchar](200) NULL,
	[manufacturerNum] [int] NULL,
	[memorySize] [decimal](10, 2) NULL,
	[speed] [decimal](10, 2) NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[pcTranslatedCreated]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[pcTranslatedCreated] as
select [cpuId], (select cpuName from cpu where id = pcCreated.cpuId) as cpuName,
[coolingSystemId], (select [Coolingname] from [dbo].[coolingSystem] where [coolingSystemId] = pcCreated.coolingSystemId) as coolingSystemName,
[hardDiskId],(select [hardDiskName] from [dbo].[hardDrive] where [id] = pcCreated.hardDiskId) as hardDiskName,
[ramId], (select [idRam] from [dbo].[ram] where [idRam] = pcCreated.ramId) as ramName,
[graphicsCardNum], (select [graphicsName] from [dbo].[graphicsCard] where [GraphicsCardId] = pcCreated.graphicsCardNum) as GraphicsCardName,
[providerNum], (select [proName] from [dbo].[providers] where [providerId] = pcCreated.providerNum) as providerName,
[price],[dateCreated]
from pcCreated
GO
/****** Object:  View [dbo].[AvgPricePerMonth]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AvgPricePerMonth] as
SELECT  MONTH(dateCreated) AS monthNum, AVG(price) as avgPrice
FROM dbo.pcCreated
where year(dateCreated) = year(getdate())
GROUP BY MONTH(dateCreated)
GO
/****** Object:  View [dbo].[PcCreatedPerMonth]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[PcCreatedPerMonth] as
SELECT  MONTH(dateCreated) AS monthNum, count(*) as amount
FROM dbo.pcCreated
where year(dateCreated) = year(getdate())
GROUP BY MONTH(dateCreated)
GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturer](
	[manufacturerName] [varchar](45) NULL,
	[phoneNumber] [varchar](15) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programsReq]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programsReq](
	[programNum] [int] IDENTITY(1,1) NOT NULL,
	[programName] [varchar](30) NULL,
	[ram] [int] NULL,
	[diskSpace] [int] NULL,
	[GraphicCardSize] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[programNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[coolingSystem] ON 

INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (1, N'Arctic Alpine 11 GT', 12, 1, CAST(40.00 AS Decimal(5, 2)))
INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (2, N'Antec A30', 8, 1, CAST(70.00 AS Decimal(5, 2)))
INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (3, N'Corsair Hydro H45', 7, 2, CAST(260.00 AS Decimal(5, 2)))
INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (9, N'Corsair Hydro H150', 7, 3, CAST(795.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[coolingSystem] OFF
SET IDENTITY_INSERT [dbo].[cpu] ON 

INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (1, N'Intel Pentium G4400', 1, CAST(3.30 AS Decimal(10, 2)), 2, 54, 1, CAST(205.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (2, N'Intel Core i5 8500 3.0Ghz', 1, CAST(3.00 AS Decimal(10, 2)), 6, 65, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (3, N'Intel Core i7 7740X', 1, CAST(4.30 AS Decimal(10, 2)), 4, 112, 2, CAST(1380.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (4, N'Intel Core i9 7980XE', 1, CAST(2.60 AS Decimal(10, 2)), 18, 165, 3, CAST(8870.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (5, N'AMD A4-4000 Dual', 5, CAST(3.00 AS Decimal(10, 2)), 2, 65, 1, CAST(145.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (6, N'AMD Ryzen 5 1600 3.2GHz', 5, CAST(3.20 AS Decimal(10, 2)), 6, 65, 2, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (7, N'AMD Ryzen 7 1800X 3.6GHz ', 5, CAST(3.60 AS Decimal(10, 2)), 8, 1590, 3, CAST(1590.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[cpu] OFF
SET IDENTITY_INSERT [dbo].[graphicsCard] ON 

INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (9, N'MSI GT710 Silent 1GB', 4, CAST(1.00 AS Decimal(10, 2)), CAST(954.00 AS Decimal(10, 2)), 19, CAST(175.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (10, N'Asus GTX 1080 Ti ROG ', 3, CAST(11.00 AS Decimal(10, 2)), CAST(111000.00 AS Decimal(10, 2)), 500, CAST(4890.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (11, N'MSI GTX 1080 GAMING X ', 4, CAST(8.00 AS Decimal(10, 2)), CAST(8192.00 AS Decimal(10, 2)), 500, CAST(3520.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (12, N'MSI GTX 1070 AERO ITX 8GB', 4, CAST(8.00 AS Decimal(10, 2)), CAST(1531.00 AS Decimal(10, 2)), 500, CAST(2410.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (13, N'Gigabyte GTX 1050 Ti ', 2, CAST(4.00 AS Decimal(10, 2)), CAST(1506.00 AS Decimal(10, 2)), 300, CAST(1150.00 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[graphicsCard] OFF
SET IDENTITY_INSERT [dbo].[hardDrive] ON 

INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (2, N' Western Digital Caviar Blue 1TB Sata III ', 10, 0, CAST(7200.00 AS Decimal(10, 2)), 1000, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (4, N'Western Digital Caviar Blue 3TB 64MB ', 10, 0, CAST(5400.00 AS Decimal(10, 2)), 3000, CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (8, N'Western Digital Red 10TB 256MB Sata III', 10, 0, CAST(10000.00 AS Decimal(10, 2)), 100000, CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (9, N'Kingston UV500 2.5 ', 6, 1, CAST(79000.00 AS Decimal(10, 2)), 240, CAST(365.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (10, N' SUV500/960G 960GB ', 6, 1, CAST(79000.00 AS Decimal(10, 2)), 960, CAST(1380.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (11, N'Kingston A400 SA400S37', 6, 1, CAST(79000.00 AS Decimal(10, 2)), 480, CAST(575.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[hardDrive] OFF
SET IDENTITY_INSERT [dbo].[manufacturer] ON 

INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'intel', N'0525753030', 1)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'gigabyte', N'0502665678', 2)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'asus', N'03914587', 3)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'msi', N'048632187', 4)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'amd', N'0507416578', 5)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'kingstone', N'0495234895', 6)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'corsair', N'050486296', 7)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'antec', N'048512967', 8)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'Western Digital', N'087451935', 10)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'heyperx', N'039416874', 11)
INSERT [dbo].[manufacturer] ([manufacturerName], [phoneNumber], [id]) VALUES (N'artic cooling', N'0547126898', 12)
SET IDENTITY_INSERT [dbo].[manufacturer] OFF
SET IDENTITY_INSERT [dbo].[pcCreated] ON 

INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (9, 5, 1, 2, 3, CAST(N'2018-05-24' AS Date), CAST(995.00 AS Decimal(6, 2)), 9, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (10, 5, 3, 4, 4, CAST(N'2018-05-24' AS Date), CAST(2815.00 AS Decimal(6, 2)), 13, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (11, 5, 3, 4, 1, CAST(N'2018-03-26' AS Date), CAST(3555.00 AS Decimal(6, 2)), 13, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (12, 5, 3, 8, 4, CAST(N'2018-05-26' AS Date), CAST(3955.00 AS Decimal(6, 2)), 13, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (20, 5, 3, 8, 3, CAST(N'2018-05-27' AS Date), CAST(3880.00 AS Decimal(6, 2)), 13, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (21, 5, 3, 4, 3, CAST(N'2018-02-27' AS Date), CAST(2740.00 AS Decimal(6, 2)), 13, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (22, 5, 1, 4, 3, CAST(N'2018-02-27' AS Date), CAST(1545.00 AS Decimal(6, 2)), 9, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (23, 3, 3, 4, 3, CAST(N'2018-04-27' AS Date), CAST(3000.00 AS Decimal(6, 2)), 9, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (24, 3, 9, 4, 1, CAST(N'2018-05-27' AS Date), CAST(6635.00 AS Decimal(6, 2)), 12, 2)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (25, 3, 3, 4, 4, CAST(N'2018-03-27' AS Date), CAST(3075.00 AS Decimal(6, 2)), 9, 4)
INSERT [dbo].[pcCreated] ([pcId], [cpuId], [coolingSystemId], [hardDiskId], [ramId], [dateCreated], [price], [graphicsCardNum], [providerNum]) VALUES (26, 5, 3, 2, 1, CAST(N'2018-05-27' AS Date), CAST(3005.00 AS Decimal(6, 2)), 13, 4)
SET IDENTITY_INSERT [dbo].[pcCreated] OFF
SET IDENTITY_INSERT [dbo].[programsReq] ON 

INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (1, N'Battlefield 1', 16, 50, CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (2, N'word', 2, 10, CAST(1.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (3, N'fortnite', 8, 30, CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (4, N'sims 4', 4, 10, CAST(3.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (5, N'PC for Gamers', 16, 3000, CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (6, N'Most cheap option', 1, 1, CAST(1.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (7, N'computer for office', 8, 1000, CAST(2.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (8, N'computer for family', 8, 4000, CAST(3.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (9, N'computer for school', 4, 5000, CAST(1.00 AS Decimal(6, 2)))
INSERT [dbo].[programsReq] ([programNum], [programName], [ram], [diskSpace], [GraphicCardSize]) VALUES (10, N'computer for teens', 8, 2000, CAST(3.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[programsReq] OFF
SET IDENTITY_INSERT [dbo].[providers] ON 

INSERT [dbo].[providers] ([providerId], [proName], [elecrisityPower], [manufacturerNum], [price]) VALUES (2, N'Corsair 550W ', 550, 7, CAST(250.00 AS Decimal(8, 2)))
INSERT [dbo].[providers] ([providerId], [proName], [elecrisityPower], [manufacturerNum], [price]) VALUES (4, N'Corsair 450W ', 450, 7, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[providers] ([providerId], [proName], [elecrisityPower], [manufacturerNum], [price]) VALUES (13, N'antec 1000W', 1000, 8, CAST(1090.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[providers] OFF
SET IDENTITY_INSERT [dbo].[ram] ON 

INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (1, N'Corsair Vengeance RGB 2X8', 7, CAST(16.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(1050.00 AS Decimal(10, 2)))
INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (2, N'Kingston ValueRAM 8', 6, CAST(8.00 AS Decimal(10, 2)), CAST(2133.00 AS Decimal(10, 2)), CAST(385.00 AS Decimal(10, 2)))
INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (3, N'HyperX FURY ', 11, CAST(4.00 AS Decimal(10, 2)), CAST(2133.00 AS Decimal(10, 2)), CAST(235.00 AS Decimal(10, 2)))
INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (4, N'HyperX FURY 8GB', 11, CAST(8.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(310.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ram] OFF
ALTER TABLE [dbo].[coolingSystem]  WITH CHECK ADD  CONSTRAINT [fk7] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[coolingSystem] CHECK CONSTRAINT [fk7]
GO
ALTER TABLE [dbo].[cpu]  WITH CHECK ADD  CONSTRAINT [fkCpu] FOREIGN KEY([manufacturerId])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[cpu] CHECK CONSTRAINT [fkCpu]
GO
ALTER TABLE [dbo].[graphicsCard]  WITH CHECK ADD  CONSTRAINT [fk6] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[graphicsCard] CHECK CONSTRAINT [fk6]
GO
ALTER TABLE [dbo].[hardDrive]  WITH CHECK ADD  CONSTRAINT [fkHardDrive] FOREIGN KEY([manufacturerId])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[hardDrive] CHECK CONSTRAINT [fkHardDrive]
GO
ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [ddf] FOREIGN KEY([providerNum])
REFERENCES [dbo].[providers] ([providerId])
GO
ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [ddf]
GO
ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [fk10] FOREIGN KEY([coolingSystemId])
REFERENCES [dbo].[coolingSystem] ([coolingSystemId])
GO
ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [fk10]
GO
ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [fk11] FOREIGN KEY([hardDiskId])
REFERENCES [dbo].[hardDrive] ([id])
GO
ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [fk11]
GO
ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [fk12] FOREIGN KEY([ramId])
REFERENCES [dbo].[ram] ([idRam])
GO
ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [fk12]
GO
ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [fk21] FOREIGN KEY([graphicsCardNum])
REFERENCES [dbo].[graphicsCard] ([GraphicsCardId])
GO
ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [fk21]
GO
ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [fk9] FOREIGN KEY([cpuId])
REFERENCES [dbo].[cpu] ([id])
GO
ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [fk9]
GO
ALTER TABLE [dbo].[providers]  WITH CHECK ADD  CONSTRAINT [fk8] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[providers] CHECK CONSTRAINT [fk8]
GO
ALTER TABLE [dbo].[ram]  WITH CHECK ADD  CONSTRAINT [fk5] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[ram] CHECK CONSTRAINT [fk5]
GO
/****** Object:  StoredProcedure [dbo].[createMostCheapest]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[createMostCheapest](@cpuSpeed decimal(4,2), @hardDiskMemorySize decimal(6,2),
@ramMemorySize decimal(4,2), @graphicsMemorySize decimal(4,2))
as
declare @cpuId int,
@graphicsCardId int,
@hardDiskId int,
@CoolingSystemId int,
@providerId int,
@ramId int,
@maxCoolingLevel int,
@maxVolt int
set @cpuId = (select top 1 id from cpu where @cpuSpeed <= cpuSpeed order by price)
set @graphicsCardId = (select top 1 [GraphicsCardId] from graphicsCard where @graphicsMemorySize <= [size] order by price)
set @ramId = (select top 1 idRam from ram where @ramMemorySize <= memorySize order by price)
set @hardDiskId = (select top 1 id from [dbo].[hardDrive] where @hardDiskMemorySize <= [hardDiskSizeInGB] order by price)
if((select coolingLevel from graphicsCard where graphicsCardId = @graphicsCardId) >=
(select [coldRankRequired] from [dbo].[cpu] where id = @cpuId))
set @maxCoolingLevel = (select coolingLevel from graphicsCard where graphicsCardId = @graphicsCardId)
else
set @maxCoolingLevel = (select [coldRankRequired] from [dbo].[cpu] where id = @cpuId)
set @CoolingSystemId = (select top 1 [coolingSystemId] from [dbo].[coolingSystem] where @maxCoolingLevel <= coolingLevel order by price)

if((select reqElectricity from graphicsCard where graphicsCardId = @graphicsCardId) >=
(select requiredVat from [dbo].[cpu] where id = @cpuId))
set @maxVolt = (select reqElectricity from graphicsCard where graphicsCardId = @graphicsCardId)
else
set @maxVolt =(select requiredVat from [dbo].[cpu] where id = @cpuId)
set @providerId = (select top 1 [providerId]   from [dbo].[providers] where @maxVolt <= [elecrisityPower] order by price)
exec createPcByMyself @cpuId, @CoolingSystemId, @providerId, @hardDiskId, @ramId, @graphicsCardId

  
 
GO
/****** Object:  StoredProcedure [dbo].[createPcByMyself]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[createPcByMyself] (@cpuId int, @CoolingSystem int, @providerId int,@hardDiskId int, @ramId int, @graphicsId int)
 as 
 declare @finalprice decimal(6,2)
 set @finalprice = 0
 set @finalprice = @finalprice + (select price from CoolingSystem where @CoolingSystem = coolingSystemId)
 set @finalprice = @finalprice + (select price from cpu where @cpuId = id)
 set @finalprice = @finalprice + (select price from providers where @providerId = providerId)
 set @finalprice = @finalprice + (select price from hardDrive where @hardDiskId = id)
 set @finalprice = @finalprice + (select price from ram where  idRam= @ramId)
 set @finalprice = @finalprice + (select price from graphicsCard where  [GraphicsCardId]= @graphicsId)
insert into [dbo].[pcCreated]  values (@cpuId,@CoolingSystem,@hardDiskId,@ramId, GETDATE(),@finalprice, @graphicsId,@providerId)
GO
/****** Object:  StoredProcedure [dbo].[pcForProgram]    Script Date: 27/05/2018 20:19:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[pcForProgram](@programNumber int) as
declare @ramNeeded int,
@diskSpaceNeeded int,
@GraphicCardSizeNeeded decimal(6,2),
@cpuNumId int,
@hardDriveNumId int,
@ramNumId int,
@GraphicCardId int,
@CoolingSystemNumId int,
@providerNumId int,
@maxCoolingLevel int,
@maxVat int
set @ramNeeded = (select ram from programsReq where programNum =@programNumber)
set @diskSpaceNeeded = (select diskSpace from programsReq where programNum =@programNumber)
set @GraphicCardSizeNeeded = (select GraphicCardSize from programsReq where programNum =@programNumber)
set @ramNumId = (select top 1 idRam from ram where @ramNeeded <= memorySize order by price)
set @hardDriveNumId = (select top 1 id from [dbo].[hardDrive] where @diskSpaceNeeded <= [hardDiskSizeInGB] order by price)
set @GraphicCardId = (select top 1 [GraphicsCardId] from graphicsCard where @GraphicCardSizeNeeded <= [size] order by price)
set @cpuNumId = (select top 1 id from cpu order by price)
if((select coolingLevel from graphicsCard where graphicsCardId = @GraphicCardId) >=
(select [coldRankRequired] from [dbo].[cpu] where id = @cpuNumId))
set @maxCoolingLevel = (select coolingLevel from graphicsCard where graphicsCardId = @GraphicCardId)
else
set @maxCoolingLevel = (select [coldRankRequired] from [dbo].[cpu] where id = @cpuNumId)
set @CoolingSystemNumId = (select top 1 [coolingSystemId] from [dbo].[coolingSystem] where @maxCoolingLevel <= coolingLevel order by price)

if((select [reqElectricity] from graphicsCard where graphicsCardId = @GraphicCardId) >=
(select [requiredVat] from [dbo].[cpu] where id = @cpuNumId))
set @maxVat = (select [reqElectricity] from graphicsCard where graphicsCardId = @GraphicCardId)
else
set @maxVat = (select [requiredVat] from [dbo].[cpu] where id = @cpuNumId)
set @providerNumId = (select top 1 [providerId] from [dbo].[providers] where @maxVat <= [elecrisityPower] order by price)

exec createPcByMyself @cpuNumId, @CoolingSystemNumId, @providerNumId, @hardDriveNumId, @ramNumId, @GraphicCardId
GO
USE [master]
GO
ALTER DATABASE [Pccreator] SET  READ_WRITE 
GO
