INSERT INTO Production.ProductCategory
	(Name, rowguid, ModifiedDate)
VALUES('Widgets', 
	    NEWID(), -- creates new quid
		GETDATE()),
		('More Widgets', 
	    NEWID(), -- creates new quid
		GETDATE());
SELECT * FROM Production.ProductCategory;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
	, ModifiedDate = GETDATE()
FROM Production.Product as p
	INNER JOIN Production.ProductCategory ps
		ON p.ProductSubcategoryID = ps.ProductCategoryID
	WHERE ps.ProductCategoryID = 1;
-- going to be on the join portion, get bikes 

DELETE FROM Production.ProductCategory
WHERE ProductCategoryID > 4;
