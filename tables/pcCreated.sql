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

/****** Object:  Table [dbo].[pcCreated]    Script Date: 21/03/2018 13:41:48 ******/
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
PRIMARY KEY CLUSTERED 
(
	[pcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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

ALTER TABLE [dbo].[pcCreated]  WITH CHECK ADD  CONSTRAINT [fk9] FOREIGN KEY([cpuId])
REFERENCES [dbo].[cpu] ([id])
GO

ALTER TABLE [dbo].[pcCreated] CHECK CONSTRAINT [fk9]
GO

