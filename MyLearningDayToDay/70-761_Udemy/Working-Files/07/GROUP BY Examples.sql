-- GROUP BY Examples

-- Here's the table data we will use
select * from 
sales.SalesOrderDetail

-- Let's look at the productid's and unit price values
-- in the salesorderdetail table
select productid, unitprice
from sales.SalesOrderDetail
order by productid

-- We would liek to know the total of the unitprice values
-- for each productid
-- BUT, this query will return an error...
-- Productid returns many rows while sum(unitprice) returns a single row value
select productid, sum(unitprice)
from sales.SalesOrderDetail

-- We can use GROUP BY to get the summary values we want
-- Now, productid is grouped to provide a single row value, and 
-- sum(unitprice) returns a single row value
select productid, sum(unitprice) 'Totals'
from sales.SalesOrderDetail
GROUP BY productid
ORDER BY productid
