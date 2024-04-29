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

/****** Object:  Table [dbo].[coolingSystem]    Script Date: 21/03/2018 13:40:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[coolingSystem](
	[coolingSystemId] [int] IDENTITY(1,1) NOT NULL,
	[Coolingname] [varchar](20) NULL,
	[manufacturerNum] [int] NULL,
	[coolingLevel] [int] NULL,
	[reqElectricity] [int] NULL,
	[price] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[coolingSystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[coolingSystem]  WITH CHECK ADD  CONSTRAINT [fk7] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO

ALTER TABLE [dbo].[coolingSystem] CHECK CONSTRAINT [fk7]
GO

