-- Built-in Functions

-- Let's take a look at the Sales.SalesOrderDetail table
select * from sales.salesorderdetail

-- Let's look at the LineTotal numbers
select LineTotal 
from sales.SalesOrderDetail

-- We can use the SUM built-in function to generate
-- the total of all the LineTotal amounts in the table
select sum(LineTotal) 'Line Totals'
from sales.SalesOrderDetail

-- We can use a WHERE clause to only sum the LineTotals
-- that are greater than 25000
select sum(LineTotal) 'Line Totals over 25000'
from sales.SalesOrderDetail
where LineTotal>25000

-- We can use the COUNT function to count how many LineTotals
-- are over 25000
select count(LineTotal) '# Line Totals over 25000'
from sales.SalesOrderDetail
where LineTotal>25000


-- We can use the MAX function to get the largest LineTotal
-- that is over 25000
select max(LineTotal) 'Line Totals'
from sales.SalesOrderDetail
where LineTotal>25000

-- The MIN function will return the smallest value over 25000
select min(LineTotal) 'Line Totals'
from sales.SalesOrderDetail
where LineTotal>25000

-- The AVG function will return the average of all values over 25000
select avg(LineTotal) 'Line Totals'
from sales.SalesOrderDetail
where LineTotal>25000

-- The AVG function can also return the average LineTotal of all products
select avg(LineTotal) 'Line Totals'
from sales.SalesOrderDetail