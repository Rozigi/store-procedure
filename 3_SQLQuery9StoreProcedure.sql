

-- =============================================
-- Author:			Rekiat Ozigi
-- Create date:		2024/08/06
-- Description:		LearningStoreProcedure
-- Version:			0.1, 0.2, 0.3
-- Revision Date:	2024/09/12, 2024/09/21, 2024/09/29, 2024/10/28
-- =============================================
/**
WHY STORE PROCEDURE

-Helps hide data, i.e encapsulate data
-To also make code  reuseable. you don't have to be rewriting codes everytime
-For performance, i.e helps improve performance of a code.
-Also if you automate a code you don't have to rewrite ur code from scratch
-For Security Purpose


--How To Create Store Procedure

Assignment For The Week
1- Create Store Procedures using these tables
-World, Games, CompanyInfo, EmployeeInfo and Business Table

2-Upload The Store Procedures In GitHub

3- Review The ERD Notes https://www.lucidchart.com/pages/er-diagrams

4- Create ERD Diagram In SQL Server with the Car Dealer assignment

5-Learn About Sharepoint Site and Confluence (Watch Youtube Video or Google It)

**/


SELECT *
FROM WorldoMeterData

---1- Create Store Procedures using these tables
CREATE PROC spPullworldometerData
AS 
BEGIN
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
  END

---Another Store Procedure Created
ALTER PROC spPullworldometerData
AS 
BEGIN
--How To Drop/Remove A Table/Store Precedure

DROP Proc IF EXISTS WorldoMeterData_BackUp


----Create Backup

SELECT * 
INTO WorldoMeterData_BackUp
FROM WorldoMeterData

---Adjust And Modify Records

UPDATE WorldoMeterData
SET TotalDeaths = 1500
WHERE TotalDeaths = 192804

---Check Records In Back up File

SELECT *
FROM WorldoMeterData_BackUp


SELECT [Country Region]
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
  END


  ----ASSIGNMENT 10/28/24
  ----Creating Store Procedure and paramatized store procedure
USE DEV
DROP Proc IF EXISTS [dbo].[spCustomer_ID]

--1
CREATE PROC [dbo].[spCustomer_ID]
@Customer_ID INT
AS
BEGIN
  SELECT [Order_ID]
      ,[Customer_ID]
      ,[Order_Date]
  FROM [SqlTraining].[dbo].[Orders]
  WHERE Customer_ID = @Customer_ID
  END
GO

EXEC [dbo].[spCustomer_ID] @Customer_ID =2
 
 ---2 Creating Store Procedure for Noble by Subject
  CREATE PROC spNobleBySubject
  @Subject Varchar (50)
  AS
  BEGIN
  SELECT
	[Year]
	,[Subject]
	,[Winner]
FROM [dbo].[Noble]
WHERE Subject = @Subject
END

EXEC spNobleBySubject @Subject = Chemistry

USE DEV

 ---2 Creating Store Procedure for EmadeHawb
CREATE PROC spEmadeHawb
@Revenue Decimal(12,2)
AS
BEGIN
SELECT [ID]
      ,[Hawb]
      ,[HawbDate]
      ,[ServiceCodeID]
      ,[DueDate]
      ,[PODDate]
      ,[AccountID]
      ,[ConsigneeID]
      ,[Revenue]
  FROM [DEV].[dbo].[EmadeHawb]
  WHERE Revenue = @Revenue
  END

  EXEC spEmadeHawb @Revenue = 21.00

   ---4 Creating Store Procedure for Emadeconsulting job

  CREATE PROC spEmadeconsultingJobData
  @Designation VARCHAR(20)
  AS 
  BEGIN
  SELECT [JOB_ID]
		,[DESIGNATION]
  FROM [DEV].[dbo].[EmadeconsultingJOB]
  WHERE Designation = @Designation
  END

  EXEC spEmadeconsultingJobData  @Designation = 'Sales person'

   ---5 Creating Store Procedure for EmadeconsultingEmployees
CREATE PROC spEmadeconsultingEmployeesData 
AS
BEGIN
  SELECT [name]
      ,[occupation]
      ,[working_date]
      ,[working_hours]
      ,[salary]
  FROM [DEV].[dbo].[EmadeConsultingEmployee]
  END

    ---5 Creating paramatized Store Procedure for EmadeconsultingEmployees

	ALTER PROC spEmadeconsultingEmployeesData 
	@Name VARCHAR (45) 
	AS
BEGIN
  SELECT [name]
      ,[occupation]
      ,[working_date]
      ,[working_hours]
      ,[salary]
  FROM [DEV].[dbo].[EmadeConsultingEmployee]
  WHERE Name = @Name
  END

  ----To Execute paramatized Store procedure 
  EXEC spEmadeconsultingEmployeesData @Name = 'Rose Huges'
