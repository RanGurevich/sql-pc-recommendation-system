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
/****** Object:  StoredProcedure [dbo].[pcForProgram]    Script Date: 02/05/2018 13:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pcForProgram](@programNumber int) as
declare @ramNeeded int,
@diskSpaceNeeded int,
@GraphicCardSizeNeeded decimal(6,2),
@cpuNumId int,
@hardDriveNumId int,
@ramNumId int,
@GraphicCardId int,
@CoolingSystemNumId int,
@providerNumId int,
@maxCoolingLevel int
set @ramNeeded = (select ram from programsReq where programNum =@programNumber)
set @diskSpaceNeeded = (select diskSpace from programsReq where programNum =@programNumber)
set @GraphicCardSizeNeeded = (select GraphicCardSize from programsReq where programNum =@programNumber)
set @ramNumId = (select top 1 idRam from ram where @ramNeeded <= memorySize order by price)
set @hardDriveNumId = (select top 1 id from [dbo].[hardDrive] where @diskSpaceNeeded <= [hardDiskSizeInGB] order by price)
set @GraphicCardId = (select top 1 [GraphicsCardId] from graphicsCard where @GraphicCardSizeNeeded <= [size] order by price)
set @cpuNumId = (select top 1 id from cpu order by price)

if((select coolingLevel from graphicsCard where graphicsCardId = @GraphicCardId) >=
(select [coldRankRequired] from [dbo].[cpu] where id = @cpuNumId))
set @maxCoolingLevel = (select coolingLevel from graphicsCard where graphicsCardId = @GraphicCardId)
else
set @maxCoolingLevel = (select [coldRankRequired] from [dbo].[cpu] where id = @cpuNumId)
set @CoolingSystemNumId = (select top 1 [coolingSystemId] from [dbo].[coolingSystem] where @maxCoolingLevel <= coolingLevel order by price)
exec createPcByMyself @cpuNumId, @CoolingSystemNumId, @hardDriveNumId, @ramNumId, getdate
GO
