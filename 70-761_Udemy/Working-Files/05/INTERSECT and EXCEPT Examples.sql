

-- Here are all the products 
select productid
from production.product
order by productid

-- Here are the products that have work orders
select productid
from production.workorder

-- Here's records for rows that have the same productid in the tables
-- on the left and right of the INTERSECT operator
select productid
from production.product
INTERSECT
select productid
from production.workorder


-- We can use EXCEPT to return all values from the left side of
-- the INTERSECT operator that do not appear on the right side
select productid
from production.product
EXCEPT
select productid
from production.workorder
