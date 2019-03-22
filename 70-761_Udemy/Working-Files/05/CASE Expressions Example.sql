
select *
from Production.Product


-- Using a simple CASE expression
-- Adds a column to the result set that contains a 
-- conditional result
select ProductID, Name, Availability=
  CASE DaysToManufacture
	WHEN '0' THEN 'Immediate'
	WHEN '1' THEN 'Two Business Days'
	WHEN '2' THEN 'Three Business Days'
	WHEN '3' THEN 'Four Business Days'
	Else 'Verify Availability'
  END
from Production.Product


-- Using a searched CASE expression
-- Allows the use of comparison values in the CASE expression
select ProductID, Name, Availability=
  CASE 
	WHEN DaysToManufacture = '0' THEN 'Immediate'
	WHEN DaysToManufacture >0 AND DaysToManufacture < '4' THEN 'Four Business Days'
	WHEN DaysToManufacture = '4' THEN 'Six Business Days'
	ELSE 'Verify Availability'
  END
from Production.Product
