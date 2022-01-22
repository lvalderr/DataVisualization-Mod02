--**********************************************************************************************************************************************************************************************************--
-- Title: Lesson 2 Assignment: SQL & Data Wrangling
-- Author: Luis Valderrama
-- Desc: Returns List of Employees with Job Titles, Research and Development
-- Change Log: When,Who,What
-- 2022-01-09,Luis Valderrama,Created File
--**********************************************************************************************************************************************************************************************************--

/*Lesson 2 assignment objective:
Write a SQL query that does all the following:

1. JOIN the three tables into 1 dataset 
2. Filters the data for Job Titles that start with the word Research 
3. The resulting dataset should have these columns: BusinessEntityID, LoginID, JobTitle, City

*/

USE AdventureWorks2016CTP3
GO

--Table Exploration
--SELECT * FROM HumanResources.Employee
--SELECT * FROM Person.BusinessEntityAddress
--SELECT * FROM Person.Address

--Attribute selection
SELECT 
 [BusinessEntityID] = E.BusinessEntityID
,[LoginID] = E.LoginID
,[JobTitle] = E.JobTitle
,[City] = A.City

--Joins and Tables
--HR.Employee table PK = BusinessEntityID (The AdvWorksOLTPSchemaVisio schema doc shows EmployeeID as PK??)
FROM HumanResources.Employee AS E

--Person.BusinessEntityAddress was not found in the dvWorksOLTPSchemaVisio schema doc. Assume the Foreign Key = BusinessEntityID
INNER JOIN Person.BusinessEntityAddress AS BEA
ON E.BusinessEntityID = BEA.BusinessEntityID

--Person.Address PK = AddressID
INNER JOIN Person.Address AS A
ON BEA.AddressID = A.AddressID

--Filtering data by Job Title starting with 'Research...'
WHERE E.JobTitle LIKE ('Research%')
ORDER BY E.JobTitle, A.City
;
