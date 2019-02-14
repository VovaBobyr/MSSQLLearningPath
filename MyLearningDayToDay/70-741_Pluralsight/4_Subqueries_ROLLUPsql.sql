create view sales.vsalesbycategory
as
select soh.TotalDue,
		pc.Name as 'Category',
		ps.Name as 'SubCategory',
		p.Name as 'Product'
from Sales.SalesOrderHeader as soh
inner join sales.SalesOrderDetail as sod on soh.SalesOrderID=sod.SalesOrderDetailID
inner join Production.product as p on sod.ProductID=p.ProductID
inner join Production.ProductSubcategory as ps on p.ProductSubcategoryID=ps.ProductCategoryID
inner join Production.ProductCategory as pc on ps.ProductCategoryID = pc.ProductCategoryID

---- ROLLUP using
select Category,
		SubCategory,
		Product,
		sum(TotalDue) as 'TotalSold'
from sales.vsalesbycategory
where Category='Clothing'
group by category,SubCategory,Product
with rollup
order by Category,SubCategory,Product

-- CUBR using
select Category,
		SubCategory,
		Product,
		sum(TotalDue) as 'TotalSold'
from sales.vsalesbycategory
where Category='Clothing'
group by category,SubCategory,Product
with cube
order by Category,SubCategory,Product

-- GROUPING SET
select Category,
		GROUPING(Category) as 'CategoryTotal',
		SubCategory,
		GROUPING(SubCategory) as 'SubCategoryTotal',
		Product,
		GROUPING(Product) as 'ProductTotal',
		sum(TotalDue) as 'TotalSold'
from sales.vsalesbycategory
where Category='Clothing'
group by category,SubCategory,Product
WITH CUBE
order by category,SubCategory,Product

-- GROUPING_ID
select  GROUPING_ID(Category, SubCategory, Product) as 'TotalBitmap',
		Category,
		SubCategory,
		Product,
		sum(TotalDue) as 'TotalSold'
from sales.vsalesbycategory
where Category='Clothing'
group by category,SubCategory,Product
with cube
order by Category,SubCategory,Product