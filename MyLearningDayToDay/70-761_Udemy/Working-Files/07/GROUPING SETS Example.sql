
-- GROUPING SETS Example

-- NOTE! The CUBE and WITH ROLLUP functionalities will be
-- removed in future SQL Server versions
select ProductID,SUM(LineTotal) 'Totals'
from sales.SalesOrderDetail
GROUP BY productid WITH CUBE


-- This query uses the GROUPING SETS syntax
-- to create a group on the ProductID column
select ProductID, SUM(LineTotal) 'Totals'
from sales.SalesOrderDetail
GROUP BY
GROUPING SETS ((ProductID))



-- We can easily add a total aggregation
-- using the GROUPING SET syntax and add
-- a blank set of parenthesis to our grouping set
select ProductID, SUM(LineTotal) 'Totals'
from sales.SalesOrderDetail
GROUP BY
GROUPING SETS ((ProductID),())



-- Let's add another column to our query and see 
-- even more flexibility with GROUPING SETS
-- This syntax groups by ProductID and CarrierTrackingNumber
-- and provides a total aggregation
select ProductID, CarrierTrackingNumber, SUM(LineTotal) 'Totals'
from sales.SalesOrderDetail
GROUP BY
GROUPING SETS ((ProductID),(CarrierTrackingNumber),())



-- This syntax groups by ProductID AND CarrierTrackingNumber
select ProductID, CarrierTrackingNumber, SUM(LineTotal) 'Totals'
from sales.SalesOrderDetail
GROUP BY
GROUPING SETS ((ProductID,CarrierTrackingNumber),())
