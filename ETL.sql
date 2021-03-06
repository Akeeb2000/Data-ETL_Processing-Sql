USE [DS Training]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_VehicleData_20220317]    Script Date: 6/14/2022 6:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC[dbo].[BLD_WRK_VehicleData_20220317]
-- =============================================
-- Author:		Aliu Akeeb
-- Create date:  MARCH 27
-- Description:	<RAW-> WRK
-- =============================================

AS
BEGIN

-- =============================================
-- Drop Table Block
-- =============================================
if OBJECT_ID('WRK_VehicleData_20220317') is not null
drop table  [WRK_VehicleData_20220317]

-- =============================================
-- Create Table Block
-- =============================================


Create table [WRK_VehicleData_20220317]
(
	[RowNumber]      INT IDENTITY (1,1)
	,[CustomerID]     INT
      ,[CustomerSince]  DATE
      ,[Vehicle]        VARCHAR (1000)
      ,[2014]			FLOAT
      ,[2015]			FLOAT
      ,[2016E]			FLOAT
)	

-- =============================================
-- Truncate Table Block
-- =============================================
truncate table [WRK_VehicleData_20220317]

-- =============================================
-- Insert Table Block
-- =============================================
insert into WRK_VehicleData_20220317
(

      [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
     
)	
select
	[CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]

FROM
[Raw_VehicleData_20220317]
WHERE ISNUMERIC ([2015]) = 1
OR [2015] = ''
--( 1 rows affected) totalnumber of row = 1049998

END
/*
SELECT * FROM  [WRK_VehicleData_20220317]
SELECT * FROM [dbo].[Raw_VehicleData_20220317]

SELECT *
  FROM [DS Training].[dbo].[RAW_VehicleData_20220317]
  WHERE ISNUMERIC ([2015]) = 0
*/

/*
select [CustomerID],count (*)
from [WRK_VehicleData_20220317]
GROUP BY [CustomerID]
HAVING COUNT(*) > 1

SELECT * FROM [WRK_VehicleData_20220317]
WHERE [CustomerID] like '3490750'



select * from [WRK_VechicleData_20220317]
where customersince < '1965-01-01'


*/