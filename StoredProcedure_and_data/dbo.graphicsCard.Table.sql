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
/****** Object:  Table [dbo].[graphicsCard]    Script Date: 02/05/2018 13:36:44 ******/
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
SET IDENTITY_INSERT [dbo].[graphicsCard] ON 

INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (9, N'MSI GT710 Silent 1GB', 4, CAST(1.00 AS Decimal(10, 2)), CAST(954.00 AS Decimal(10, 2)), 19, CAST(175.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (10, N'Asus GTX 1080 Ti ROG ', 3, CAST(11.00 AS Decimal(10, 2)), CAST(111000.00 AS Decimal(10, 2)), 500, CAST(4890.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (11, N'MSI GTX 1080 GAMING X ', 4, CAST(8.00 AS Decimal(10, 2)), CAST(8192.00 AS Decimal(10, 2)), 500, CAST(3520.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (12, N'MSI GTX 1070 AERO ITX 8GB', 4, CAST(8.00 AS Decimal(10, 2)), CAST(1531.00 AS Decimal(10, 2)), 500, CAST(2410.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[graphicsCard] ([GraphicsCardId], [graphicsName], [manufacturerNum], [size], [speed], [reqElectricity], [price], [coolingLevel]) VALUES (13, N'Gigabyte GTX 1050 Ti ', 2, CAST(4.00 AS Decimal(10, 2)), CAST(1506.00 AS Decimal(10, 2)), 300, CAST(1150.00 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[graphicsCard] OFF
ALTER TABLE [dbo].[graphicsCard]  WITH CHECK ADD  CONSTRAINT [fk6] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[graphicsCard] CHECK CONSTRAINT [fk6]
GO
