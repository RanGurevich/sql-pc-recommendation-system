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
/****** Object:  Table [dbo].[ram]    Script Date: 02/05/2018 13:36:44 ******/
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
SET IDENTITY_INSERT [dbo].[ram] ON 

INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (1, N'Corsair Vengeance RGB 2X8', 7, CAST(16.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(1050.00 AS Decimal(10, 2)))
INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (2, N'Kingston ValueRAM 8', 6, CAST(8.00 AS Decimal(10, 2)), CAST(2133.00 AS Decimal(10, 2)), CAST(385.00 AS Decimal(10, 2)))
INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (3, N'HyperX FURY ', 11, CAST(4.00 AS Decimal(10, 2)), CAST(2133.00 AS Decimal(10, 2)), CAST(235.00 AS Decimal(10, 2)))
INSERT [dbo].[ram] ([idRam], [ramName], [manufacturerNum], [memorySize], [speed], [price]) VALUES (4, N'HyperX FURY 8GB', 11, CAST(8.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(310.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ram] OFF
ALTER TABLE [dbo].[ram]  WITH CHECK ADD  CONSTRAINT [fk5] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[ram] CHECK CONSTRAINT [fk5]
GO
