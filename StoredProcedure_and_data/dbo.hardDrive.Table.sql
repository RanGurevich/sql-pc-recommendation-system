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
/****** Object:  Table [dbo].[hardDrive]    Script Date: 02/05/2018 13:36:44 ******/
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
SET IDENTITY_INSERT [dbo].[hardDrive] ON 

INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (2, N' Western Digital Caviar Blue 1TB Sata III ', 10, 0, CAST(7200.00 AS Decimal(10, 2)), 1000, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (4, N'Western Digital Caviar Blue 3TB 64MB ', 10, 0, CAST(5400.00 AS Decimal(10, 2)), 3000, CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (8, N'Western Digital Red 10TB 256MB Sata III', 10, 0, CAST(10000.00 AS Decimal(10, 2)), 100000, CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (9, N'Kingston UV500 2.5 ', 6, 1, CAST(79000.00 AS Decimal(10, 2)), 240, CAST(365.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (10, N' SUV500/960G 960GB ', 6, 1, CAST(79000.00 AS Decimal(10, 2)), 960, CAST(1380.00 AS Decimal(10, 2)))
INSERT [dbo].[hardDrive] ([id], [hardDiskName], [manufacturerId], [isSSD], [hardDriveSpeed], [hardDiskSizeInGB], [price]) VALUES (11, N'Kingston A400 SA400S37', 6, 1, CAST(79000.00 AS Decimal(10, 2)), 480, CAST(575.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[hardDrive] OFF
ALTER TABLE [dbo].[hardDrive]  WITH CHECK ADD  CONSTRAINT [fkHardDrive] FOREIGN KEY([manufacturerId])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[hardDrive] CHECK CONSTRAINT [fkHardDrive]
GO
