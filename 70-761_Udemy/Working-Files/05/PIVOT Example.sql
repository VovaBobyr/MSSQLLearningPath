--PIVOT Example

-- Let's create our example table
CREATE TABLE dbo.PivotTest
(
  OrderID   INT        NOT NULL,
  OrderDate DATE       NOT NULL,
  SalesID     INT        NOT NULL,
  CustID    VARCHAR(5) NOT NULL,
  Qty       INT        NOT NULL,
  CONSTRAINT PK_Orders PRIMARY KEY(OrderID)
);

-- Load the example table with test data
INSERT INTO dbo.PivotTest(OrderID, OrderDate, SalesID, CustID, Qty)
VALUES
  (30001, '20120601', 3, 'A', 9),
  (10001, '20121018', 2, 'A', 21),
  (10005, '20121018', 1, 'B', 15),
  (40001, '20130111', 3, 'A', 26),
  (10006, '20130107', 1, 'C', 8),
  (20001, '20130209', 2, 'B', 21),
  (40005, '20140209', 1, 'A', 15),
  (20002, '20140222', 1, 'C', 13),
  (30003, '20140417', 2, 'B', 8),
  (30004, '20120417', 3, 'C', 7),
  (30007, '20130922', 2, 'D', 22);

-- Take a look at the contents of the PivotTest example table
SELECT * FROM dbo.PivotTest;

-- Let's produce some summarized data using GROUP BY
SELECT SalesID, CustID, SUM(Qty) 'Total Qty'
FROM PivotTest
GROUP BY SalesID, CustID

-- We have a request to produce a pivoted report...
-- SalesID on the left, with CustID's across the page
-- We can accomplish this manually using the T-SQL 
-- CASE expression
SELECT SalesID,
  SUM(CASE WHEN CustID = 'A' THEN Qty END) as A,
  SUM(CASE WHEN CustID = 'B' THEN Qty END) as B,
  SUM(CASE WHEN CustID = 'C' THEN Qty END) as C,
  SUM(CASE WHEN CustID = 'D' THEN Qty END) as D
FROM PivotTest
GROUP BY SalesID

-- We can use the T-SQL PIVOT operator to achieve
-- the same result
SELECT SalesID, A, B, C, D
FROM 
  (SELECT SalesID, CustID, Qty		-- This inner query produces a derived table named dt in memory that is
   FROM PivotTest) as dt			-- used to create the pivot table based on the outer query derived table pv
PIVOT(SUM(Qty) FOR CustID IN (A,B,C,D)) as pv


--- My example
select [Header], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10]
FROM
(select 'UnitPrice For TerritoryID' as 'Header', soh.TerritoryID, sod.UnitPrice from Sales.SalesOrderDetail as sod
JOIN Sales.SalesOrderHeader as soh
on sod.SalesOrderID = soh.SalesOrderID) as s
PIVOT(sum(s.UnitPrice) FOR s.TerritoryID IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10])) as pv
select * from Sales.SalesOrderHeader
select * from Sales.SalesOrderDetail


