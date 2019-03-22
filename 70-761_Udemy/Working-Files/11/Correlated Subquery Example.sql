--Correlated Subquery

--First let's look at a join query
SELECT DISTINCT p.BusinessEntityID, p.FirstName + ' ' + p.LastName Name
FROM
Person.Person p
JOIN
sales.SalesOrderHeader s
ON
p.BusinessEntityID=s.SalesPersonID
WHERE s.TotalDue>150000

--Now, let's write this as a correlated subquery
--NOTE that the inner query runs first and locates a matching record
--The outer query runs using the record found, then the inner query 
--runs again searching for another match...until all records are found
SELECT p.BusinessEntityID, FirstName + ' ' + LastName Salesperson FROM Person.Person p
WHERE
EXISTS
	(SELECT s.SalesPersonID FROM Sales.Salesorderheader s 
	 WHERE TotalDue>150000
	 and p.BusinessEntityID=s.SalesPersonID)




 
