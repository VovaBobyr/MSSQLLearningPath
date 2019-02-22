	
-- Let's take a look at the two tables we will be using

SELECT * from Production.Product    -- There are 508 rows in this table

SELECT * from Production.ProductReview   -- There are 4 rows in this table



-- This query will perform an INNER JOIN
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p 
JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID


-- This query will perform a LEFT JOIN
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
LEFT OUTER JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID


-- This query will perform a RIGHT JOIN
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
RIGHT OUTER JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID


SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
CROSS JOIN Production.ProductReview pr

SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
FULL OUTER JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID
