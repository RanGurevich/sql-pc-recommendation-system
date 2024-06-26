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
/****** Object:  Table [dbo].[manufacturer]    Script Date: 02/05/2018 13:36:44 ******/
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
