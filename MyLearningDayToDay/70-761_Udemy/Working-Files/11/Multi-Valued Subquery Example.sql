-- Multi-vaued query examples

-- Let's start off with a simple multi-valued query
-- that returns a list of values
-- We need a list of employees who were born after 1972
-- Here' where we can get the data...
SELECT TOP 1 * from Person.Person
SELECT TOP 1 * from HumanResources.Employee

-- We can use a subquery to pull the list of BusinesEntityID's
-- for every BirthDate greater than 1972 in the Employee table
-- and use that list with the IN keyword to get the Employee names
-- from the Person table

SELECT Firstname + ' ' + Lastname Employee
FROM Person.Person
WHERE Person.BusinessEntityID IN
	(SELECT BusinessEntityID
	 FROM HumanResources.Employee
	 WHERE Year(BirthDate)>1972)
ORDER BY LastName, FirstName


-- Now, let's use a table-value subquery...also known as a table expression
-- to find the last SalesOrderID for each year
SELECT OrderYear, MAX(SalesOrderID) LastOrderID
FROM
	(SELECT SalesOrderID, Year(OrderDate) OrderYear -- Run this inner query separately 
	 FROM Sales.SalesOrderHeader)as D               -- to see the table being returned
GROUP BY OrderYear 
ORDER BY OrderYear



