-- Scalar Subquery Example

-- We want to retrieve the largest order amount 
-- from the SalesOrderHeader table
SELECT * from Sales.SalesOrderHeader


-- Could we just use the MAX() function to find it?
SELECT MAX(TotalDue)
FROM Sales.SalesOrderHeader

-- MAX(TotalDue) gives us the largest order, but what is the
-- SalesOrderID?
-- This query will produce an error and we'll have to add group by
SELECT SalesOrderID,MAX(TotalDue)
FROM Sales.SalesOrderHeader

-- We can add GROUP BY, and use ORDER BY DESC to see the 
-- largest order but this returns too many results
SELECT SalesOrderID,MAX(TotalDue) MaxOrder
FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
ORDER BY MaxOrder DESC

-- A scalar subquery makes this much easier
SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue = (SELECT MAX(TotalDue) FROM Sales.SalesOrderHeader);


