-- Example queries based on MS Training DB: AdventureWorks2010b
-- SORTING DATA

select FirstName, LastName, EmailPromotion from Person.Person
ORDER BY LastName DESC, FirstName DESC



select TOP 10 PERCENT FirstName, LastName, EmailPromotion from Person.Person
ORDER BY LastName DESC, FirstName DESC

--- Ranking functions
SELECT  Name,
		ListPrice,
		ROW_NUMBER() OVER (ORDER BY ListPrice DESC) as Row_Number
FROM Production.Product
ORDER BY ListPrice DESC


--- Ranking functions
SELECT  Name,
		ListPrice,
		ROW_NUMBER() OVER (ORDER BY ListPrice DESC) as Row_Number,
		ROW_NUMBER() OVER (PARTITION BY ListPrice ORDER BY ListPrice DESC) as RN_With_Part,
		RANK() OVER (ORDER BY ListPrice DESC) as 'Rank',
		DENSE_RANK() OVER (ORDER BY ListPrice DESC) as 'Dense_Rank',
		NTILE(4) OVER (ORDER BY ListPrice DESC) as 'NTile'
FROM Production.Product
ORDER BY ListPrice DESC

-- PAGING
-- Paging by 10, grabbin page 3
-- 21-30
SELECT ROW_NUMBER() OVER (ORDER BY Name) as 'RowNumber',
		Name,
		ListPrice
FROM Production.Product
ORDER BY Name
		OFFSET 20 ROWS
		FETCH NEXT 10 ROWS ONLY;

-- DISTINCT

SELECT DISTINCT c.FirstName,
		c.LastName
FROM Person.Person c
	INNER JOIN Sales.SalesOrderHeader soh ON c.BusinessEntityID=soh.CustomerID
--ORDER BY c.FirstName, c.LastName

select * from sales.SalesOrderHeader

select * from Person.Person


select * from sales.Customer c1
	inner join dbo.Customers as c2 on c1.CustomerID=c2.ID 

select * from Customers

SELECT  Name,
		ListPrice,
		ROW_NUMBER() OVER (ORDER BY ListPrice DESC) as Row_Number,
		ROW_NUMBER() OVER (PARTITION BY ListPrice ORDER BY ListPrice DESC) as RN_With_Part
FROM Production.Product
ORDER BY ListPrice DESC


