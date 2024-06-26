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
/****** Object:  StoredProcedure [dbo].[createMostCheapest]    Script Date: 02/05/2018 13:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[createMostCheapest](@cpuSpeed decimal(4,2), @hardDiskMemorySize decimal(6,2),
@ramMemorySize decimal(4,2), @graphicsMemorySize decimal(4,2))
as
declare @cpuId int,
@graphicsCardId int,
@hardDiskId int,
@CoolingSystemId int,
@providerId int,
@ramId int,
@maxCoolingLevel int,
@maxVolt int
set @cpuId = (select top 1 id from cpu where @cpuSpeed <= cpuSpeed order by price)
set @graphicsCardId = (select top 1 [GraphicsCardId] from graphicsCard where @graphicsMemorySize <= [size] order by price)
set @ramId = (select top 1 idRam from ram where @ramMemorySize <= memorySize order by price)
set @hardDiskId = (select top 1 id from [dbo].[hardDrive] where @hardDiskMemorySize <= [hardDiskSizeInGB] order by price)
if((select coolingLevel from graphicsCard where graphicsCardId = @graphicsCardId) >=
(select [coldRankRequired] from [dbo].[cpu] where id = @cpuId))
set @maxCoolingLevel = (select coolingLevel from graphicsCard where graphicsCardId = @graphicsCardId)
else
set @maxCoolingLevel = (select [coldRankRequired] from [dbo].[cpu] where id = @cpuId)
set @CoolingSystemId = (select top 1 [coolingSystemId] from [dbo].[coolingSystem] where @maxCoolingLevel <= coolingLevel order by price)

if((select reqElectricity from graphicsCard where graphicsCardId = @graphicsCardId) >=
(select requiredVat from [dbo].[cpu] where id = @cpuId))
set @maxVolt = (select reqElectricity from graphicsCard where graphicsCardId = @graphicsCardId)
else
set @maxVolt =(select requiredVat from [dbo].[cpu] where id = @cpuId)
set @providerId = (select top 1 [providerId]   from [dbo].[providers] where @maxVolt <= [elecrisityPower] order by price)
exec createPcByMyself @cpuId, @CoolingSystemId, @hardDiskId, @ramId, getdate

  
 
GO
