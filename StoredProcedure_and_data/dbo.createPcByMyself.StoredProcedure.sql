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
/****** Object:  StoredProcedure [dbo].[createPcByMyself]    Script Date: 02/05/2018 13:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[createPcByMyself] (@cpuId int, @CoolingSystem int, @providerId int,@hardDiskId int, @ramId int)
 as 
 declare @finalprice decimal(6,2)
 set @finalprice = 0
 set @finalprice = @finalprice + (select price from CoolingSystem where @CoolingSystem = coolingSystemId)
 set @finalprice = @finalprice + (select price from cpu where @cpuId = id)
 set @finalprice = @finalprice + (select price from providers where @providerId = providerId)
 set @finalprice = @finalprice + (select price from hardDrive where @hardDiskId = id)
 set @finalprice = @finalprice + (select price from ram where  idRam= @ramId)
insert into [dbo].[pcCreated]  values (@cpuId,@CoolingSystem,@hardDiskId,@ramId, GETDATE(),@finalprice)
GO
