 CREATE PROC sp Pull 
 SELECT TOP (1000) [Country Region]
      ,[Continent]
      ,[Population]
      ,[TotalCases]
      ,[NewCases]
      ,[TotalDeaths]
      ,[NewDeaths]
      ,[TotalRecovered]
      ,[NewRecovered]
      ,[ActiveCases]
      ,["Serious]
      ,[Critical"]
      ,[Tot Cases 1M pop]
      ,[Deaths 1M pop]
      ,[TotalTests]
      ,[Tests 1M pop]
      ,[WHO Region]
  FROM [SqlTraining].[dbo].[ODE_WorldometerData]