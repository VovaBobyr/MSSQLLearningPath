-- OFFSET and FETCH Examples

-- This query returns over 500 rows
SELECT productid, Name, ProductNumber, ListPrice
FROM Production.Product
ORDER BY Name ASC

-- We can use OFFSET and FETCH to return the
-- first 15 rows
SELECT productid, Name, ProductNumber, ListPrice
FROM Production.Product
ORDER BY Name ASC
OFFSET 0 ROWS FETCH NEXT 15 ROWS ONLY;

-- This query uses OFFSET and FETCH to skip the
-- first 15 rows and return the next 15 rows
SELECT productid, Name, ProductNumber, ListPrice
FROM Production.Product
ORDER BY Name ASC
OFFSET 15 ROWS FETCH NEXT 15 ROWS ONLY;


-- This query uses OFFSET and FETCH to skip the
-- first 30 rows and return the next 15 rows
SELECT productid, Name, ProductNumber, ListPrice
FROM Production.Product
ORDER BY Name ASC
OFFSET 30 ROWS FETCH NEXT 15 ROWS ONLY;





