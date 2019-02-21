select 
FirstName, LastName, 
ISNULL(MiddleName, 'Not Available') AS 'IsNullMiddleName',
COALESCE(MiddleName, 'Not Available') AS 'CoalesceMiddleName'
from Person.Person

--- DATEs
select YEAR(MAX(soh.OrderDate)) as 'MostRecentOrderYearFunction',
	DATEPART(year, MAX(soh.OrderDate)) as 'MostRecentOrderYearDatePart' 
from Sales.SalesOrderHeader as soh
inner join person.Person as c on soh.

select DATEDIFF(day, MAX(soh.OrderDate), GETDATE()) as 'DaySinceLastOder',
	soh.CustomerID
from Sales.SalesOrderHeader as soh
group by soh.CustomerID

-- Date functions
select EOMONTH(GETDATE());

-- Search in string
select CHARINDEX('speaker')
select PATINDEX('%speaker%')

-- Concatanation
select CONCAT(Name,  ' cost ', ListPrice) as 'Display'
from Production.Product

-- Convert
select Name + ' cost ' + CAST(ListPrice AS varchar) as 'Display',
 CONVERT(nvarchar, ListPrice) AS 'Display2'
from Production.Product

-- New convertion functions
select PARSE('1/100/2012' AS Date); -- fails
select TRY_PARSE('1/100/2012' AS Date); -- NULL result

-- New Logic Functions
SELECT CHOOSE(3, 'Item 1', 'Item 2', 'Item 3');

SELECT CHOOSE(3, FirstName, LastName, FirstName + ' ' + LastName) AS 'Name'
FROM Person.Contact

select IIF(ListPrice > 0, 'Normatl Product', 'Internal Product') AS ProductionInfo,
	Name, ListPrice
from Production.Product ORDER BY ListPrice DESC;

