select *
from Production.Product
ORDER BY Name ASC
OFFSET 0 ROWS FETCH NEXT 15 ROWS ONLY

--- CASE Expressions
select * from Production.Product
select ProductID, Name, Availability=
	CASE DaysToManufacture
		WHEN '0' THEN 'Immediate'
		WHEN '1' THEN 'Two Business Days'
		WHEN '2' THEN 'Three Business Days'
		WHEN '3' THEN 'Four Business Days'
		Else 'Verify Availability'
	END
from Production.Product

select ProductID, Name, Availability=
	CASE 
		WHEN DaysToManufacture = '0' THEN 'Imediate'
		WHEN DaysToManufacture > 4 AND DaysToManufacture < 4 THEN 'Four Business Days'
		WHEN DaysToManufacture = 4 THEN 'Six Business Days'
		ELSE 'Verify Availability'
	END
from Production.Product


-- PIVOT Example:
CREATE TABLE dbo.PivotTest
(
	OrderID INT		not null,
	OrderData Date not null,
	SalesId 
)