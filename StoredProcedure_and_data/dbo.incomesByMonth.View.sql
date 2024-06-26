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
/****** Object:  View [dbo].[incomesByMonth]    Script Date: 02/05/2018 13:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view  [dbo].[incomesByMonth] as
SELECT  MONTH(dateCreated) AS monthNum, SUM(price) AS incomes
FROM dbo.pcCreated
where year(dateCreated) = year(getdate())
GROUP BY MONTH(dateCreated)
GO
