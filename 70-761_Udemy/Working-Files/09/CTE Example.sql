
-- Common Table Expressions (CTEs)

-- Here's a simple CTE
-- Retrieves the number of Orders per year from the SalesOrderHeader table
WITH C AS
(
  SELECT YEAR(OrderDate) AS OrderYear, SalesOrderID
  FROM Sales.SalesOrderHeader
)
SELECT OrderYear, COUNT(DISTINCT SalesOrderID) AS NbrCustomers
FROM C
GROUP BY orderyear
ORDER BY orderyear;


-- Multiple CTEs can be 'chained' together
-- Each CTE can refer to the previous CTE

WITH C1 AS
(
 SELECT YEAR(OrderDate) OrderYear, SalesOrderID
 FROM Sales.SalesOrderHeader
),
C2 AS
(
 SELECT OrderYear, COUNT(DISTINCT SalesOrderID) NbrCustomers
 FROM C1
 GROUP BY OrderYear
)
SELECT OrderYear, NbrCustomers
FROM C2
WHERE NbrCustomers>50
ORDER BY OrderYear