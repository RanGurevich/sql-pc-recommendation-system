/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [PCcreator]
GO

/****** Object:  Table [dbo].[graphicsCard]    Script Date: 21/03/2018 13:41:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[graphicsCard](
	[GraphicsCardId] [int] IDENTITY(1,1) NOT NULL,
	[graphicsName] [varchar](20) NULL,
	[manufacturerNum] [int] NULL,
	[size] [decimal](4, 2) NULL,
	[speed] [decimal](4, 2) NULL,
	[reqElectricity] [int] NULL,
	[price] [decimal](5, 2) NULL,
	[coolingLevel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GraphicsCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[graphicsCard]  WITH CHECK ADD  CONSTRAINT [fk6] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO

ALTER TABLE [dbo].[graphicsCard] CHECK CONSTRAINT [fk6]
GO

