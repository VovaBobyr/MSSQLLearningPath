
-- HAVING Examples

-- This query includes all LineTotal amounts
-- grouped by ProductID
select ProductID, SUM(LineTotal) 
from sales.salesorderdetail
group by ProductID
order by ProductID


-- This creates LineTotals grouped by ProductID
-- but only includes individual LineTotals over 2,000
select ProductID, SUM(LineTotal) 
from sales.salesorderdetail
where LineTotal > 2000
group by ProductID
order by ProductID

-- This creates LineTotals grouped by ProductID
-- but only inludes LineTotals over 2,000 in the groups
-- and only includes ProductID groups that total over 25,000 
select ProductID, SUM(LineTotal) 
from sales.salesorderdetail
where LineTotal > 2000
group by ProductID
having SUM(LineTotal)>25000
order by ProductID