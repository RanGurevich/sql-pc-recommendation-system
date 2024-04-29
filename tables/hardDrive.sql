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

/****** Object:  Table [dbo].[hardDrive]    Script Date: 21/03/2018 13:41:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hardDrive](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hardDiskName] [varchar](30) NULL,
	[manufacturerId] [int] NULL,
	[isSSD] [bit] NULL,
	[hardDriveSpeed] [decimal](4, 2) NULL,
	[hardDiskSizeInGB] [int] NULL,
	[requiredVat] [int] NULL,
	[price] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[hardDrive]  WITH CHECK ADD  CONSTRAINT [fkHardDrive] FOREIGN KEY([manufacturerId])
REFERENCES [dbo].[manufacturer] ([id])
GO

ALTER TABLE [dbo].[hardDrive] CHECK CONSTRAINT [fkHardDrive]
GO

