select Name, ListPrice - (select AVG(ListPrice) from Production.Product) as Diff
from Production.Product

-- Show list price compared to the averange for that subcategory
select p.Name,
       ListPrice - ap.AverangeListPrice as Diff
FROM Production.Product p
INNER JOIN (select ProductSubcategoryId, AVG(ListPrice) as AverangeListPrice from Production.Product
			group by ProductSubcategoryId) as ap
		on p.ProductSubcategoryID = ap.ProductSubcategoryID

-- All customers who have placed an order
-- IN statement
select c.FirstName, c.LastName, c.EmailPromotion
from Person.Person as c
where c.BusinessEntityID in (select soh.CustomerID from sales.SalesOrderHeader as soh)

-- EXISTs statement
select p.FirstName,
	   p.LastName,
	   p.EmailPromotion
from Person.Person as p
where exists (select soh.CustomerID from sales.SalesOrderHeader as soh
			  where soh.CustomerID = p.BusinessEntityID)

----------- UNION -------------
-- Retrieve all names and email address from Contact and ProductReview
select p.FirstName + ' ' + p.LastName as 'FullName', e.EmailAddress
from Person.Person as p
join Person.EmailAddress e
on p.EmailPromotion = e.EmailAddressID
UNION -- By default this is distict
select pr.ReviewerName, pr.EmailAddress
from Production.ProductReview as pr

select * from Person.Person as p
select * from person.EmailAddress
