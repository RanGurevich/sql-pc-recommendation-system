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

/****** Object:  Table [dbo].[providers]    Script Date: 21/03/2018 13:42:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[providers](
	[providerId] [int] IDENTITY(1,1) NOT NULL,
	[proName] [varchar](20) NULL,
	[elecrisityPower] [int] NULL,
	[manufacturerNum] [int] NULL,
	[price] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[providers]  WITH CHECK ADD  CONSTRAINT [fk8] FOREIGN KEY([manufacturerNum])
REFERENCES [dbo].[manufacturer] ([id])
GO

ALTER TABLE [dbo].[providers] CHECK CONSTRAINT [fk8]
GO

