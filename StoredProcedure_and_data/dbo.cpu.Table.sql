/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [PCCreator]
GO
/****** Object:  Table [dbo].[cpu]    Script Date: 02/05/2018 13:36:44 ******/
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
SET IDENTITY_INSERT [dbo].[cpu] ON 

INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (1, N'Intel Pentium G4400', 1, CAST(3.30 AS Decimal(10, 2)), 2, 54, 1, CAST(205.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (2, N'Intel Core i5 8500 3.0Ghz', 1, CAST(3.00 AS Decimal(10, 2)), 6, 65, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (3, N'Intel Core i7 7740X', 1, CAST(4.30 AS Decimal(10, 2)), 4, 112, 2, CAST(1380.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (4, N'Intel Core i9 7980XE', 1, CAST(2.60 AS Decimal(10, 2)), 18, 165, 3, CAST(8870.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (5, N'AMD A4-4000 Dual', 5, CAST(3.00 AS Decimal(10, 2)), 2, 65, 1, CAST(145.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (6, N'AMD Ryzen 5 1600 3.2GHz', 5, CAST(3.20 AS Decimal(10, 2)), 6, 65, 2, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[cpu] ([id], [cpuName], [manufacturerId], [cpuSpeed], [numberOfCores], [requiredVat], [coldRankRequired], [price]) VALUES (7, N'AMD Ryzen 7 1800X 3.6GHz ', 5, CAST(3.60 AS Decimal(10, 2)), 8, 1590, 3, CAST(1590.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[cpu] OFF
ALTER TABLE [dbo].[cpu]  WITH CHECK ADD  CONSTRAINT [fkCpu] FOREIGN KEY([manufacturerId])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[cpu] CHECK CONSTRAINT [fkCpu]
GO
