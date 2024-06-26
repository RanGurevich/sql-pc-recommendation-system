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
/****** Object:  Table [dbo].[coolingSystem]    Script Date: 02/05/2018 13:36:44 ******/
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
SET IDENTITY_INSERT [dbo].[coolingSystem] ON 

INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (1, N'Arctic Alpine 11 GT', 12, 1, CAST(40.00 AS Decimal(5, 2)))
INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (2, N'Antec A30', 8, 1, CAST(70.00 AS Decimal(5, 2)))
INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (3, N'Corsair Hydro H45', 7, 2, CAST(260.00 AS Decimal(5, 2)))
INSERT [dbo].[coolingSystem] ([coolingSystemId], [Coolingname], [manufacturerNum], [coolingLevel], [price]) VALUES (9, N'Corsair Hydro H150', 7, 3, CAST(795.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[coolingSystem] OFF
ALTER TABLE [dbo].[coolingSystem]  WITH CHECK ADD  CONSTRAINT [fk7] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[coolingSystem] CHECK CONSTRAINT [fk7]
GO
