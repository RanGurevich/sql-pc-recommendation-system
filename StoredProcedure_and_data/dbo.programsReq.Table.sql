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
/****** Object:  Table [dbo].[programsReq]    Script Date: 02/05/2018 13:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programsReq](
	[programNum] [int] IDENTITY(1,1) NOT NULL,
	[programName] [varchar](30) NULL,
	[ram] [int] NULL,
	[diskSpace] [int] NULL,
	[GraphicCardSize] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[programNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
