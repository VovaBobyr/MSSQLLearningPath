UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
OUTPUT INSERTED.Name
	, DELETED.ListPrice as 'OldListPrice'
	, INSERTED.ListPrice AS 'NewListPrice'
-- INTO Table
WHERE ProductSubcategoryID = 1;
