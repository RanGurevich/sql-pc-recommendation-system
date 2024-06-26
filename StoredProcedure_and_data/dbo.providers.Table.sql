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
/****** Object:  Table [dbo].[providers]    Script Date: 02/05/2018 13:36:44 ******/
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
SET IDENTITY_INSERT [dbo].[providers] ON 

INSERT [dbo].[providers] ([providerId], [proName], [elecrisityPower], [manufacturerNum], [price]) VALUES (2, N'Corsair 550W ', 550, 7, CAST(250.00 AS Decimal(8, 2)))
INSERT [dbo].[providers] ([providerId], [proName], [elecrisityPower], [manufacturerNum], [price]) VALUES (4, N'Corsair 450W ', 450, 7, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[providers] ([providerId], [proName], [elecrisityPower], [manufacturerNum], [price]) VALUES (13, N'antec 1000W', 1000, 8, CAST(1090.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[providers] OFF
ALTER TABLE [dbo].[providers]  WITH CHECK ADD  CONSTRAINT [fk8] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[providers] CHECK CONSTRAINT [fk8]
GO
