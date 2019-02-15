WITH SalesData (TotalSold, OrderYear, TerritoryName)
AS (
	select  SUM(soh.totaldue) as 'TotalSold',
			YEAR(soh.OrderDate) as 'OrderYear',
			st.Name as 'TerritoryName'
	from sales.SalesOrderHeader as soh
		inner join sales.SalesTerritory st on soh.TerritoryID = st.TerritoryID
	GROUP BY YEAR(soh.OrderDate), st.Name
)
select * from SalesData;

---- PIVOT -------------------------
WITH SalesData (TotalSold, OrderYear, TerritoryName)
AS (
	select  SUM(soh.totaldue) as 'TotalSold',
			YEAR(soh.OrderDate) as 'OrderYear',
			st.Name as 'TerritoryName'
	from sales.SalesOrderHeader as soh
		inner join sales.SalesTerritory st on soh.TerritoryID = st.TerritoryID
	GROUP BY YEAR(soh.OrderDate), st.Name
)
select * from SalesData 
		PIVOT (SUM(TotalSold)
			FOR OrderYear IN ([2011], [2012], [2013], [2014])) as pvt;

-- Retrieve all people who have placed an order
select CustomerID from Sales.Customer
INTERSECT
select CustomerID from Sales.SalesOrderHeader

-- Retrieve all people who have **NOT** placed an order
select CustomerID from Sales.Customer
EXCEPT
select CustomerID from Sales.SalesOrderHeader

-- But above is not all details about customers, to do this need to add some
WITH CustomerWithOrder 
AS (
	select CustomerID from Sales.Customer
	INTERSECT
	select CustomerID from Sales.SalesOrderHeader
	)
select * from Sales.Customer as c
	INNER JOIN CustomerWithOrder as cwo ON c.CustomerID = cwo.CustomerID

-- WITHOUT
WITH CustomerWithoutOrder 
AS (
	select CustomerID from Sales.Customer
	EXCEPT
	select CustomerID from Sales.SalesOrderHeader
	)
select * from Sales.Customer as c
	INNER JOIN CustomerWithoutOrder as cwo ON c.CustomerID = cwo.CustomerID

