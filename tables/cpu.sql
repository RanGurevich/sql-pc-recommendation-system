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

/****** Object:  Table [dbo].[cpu]    Script Date: 21/03/2018 13:40:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cpu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cpuName] [varchar](30) NULL,
	[manufacturerId] [int] NULL,
	[cpuSpeed] [decimal](4, 2) NULL,
	[numberOfCores] [int] NULL,
	[requiredVat] [int] NULL,
	[coldRankRequired] [int] NULL,
	[price] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[cpu]  WITH CHECK ADD  CONSTRAINT [fkCpu] FOREIGN KEY([manufacturerId])
REFERENCES [dbo].[manufacturer] ([id])
GO

ALTER TABLE [dbo].[cpu] CHECK CONSTRAINT [fkCpu]
GO

