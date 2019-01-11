--вывести ‘» сотрудников, у которых продажи в прошлом году 
--( поле SalesLastYear) были нулевые
select p.FirstName + ' ' + p.LastName as Surname
from [Person].[Person] p
where p.BusinessEntityID in (select s.BusinessEntityID
                             from [Sales].[SalesPerson] s
							 where s.SalesLastYear = 0)

--¬ывести ‘» сотрудниц той же должности, что и сотрудник с логином adventure-works\mark1
select p.LastName + ' ' + p.FirstName as Surname
       ,e.JobTitle
from Person.Person p, HumanResources.Employee e
where p.BusinessEntityID = e.BusinessEntityID   --соединение таблиц
      and e.Gender = 'F'                        --сотрудница
	  and e.JobTitle in (select JobTitle
	                     from HumanResources.Employee
						 where LoginID = 'adventure-works\mark1');

--поиск товаров, не принадлежащих категори€м велосипедов
SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID NOT IN  (SELECT ProductSubcategoryID
									FROM Production.ProductSubcategory
									WHERE Name = 'Mountain Bikes' 
										  OR Name = 'Road Bikes'
										  OR Name = 'Touring Bikes')


--поиск всех наименований товаров, относ€щихс€ к подкатегории Wheels
SELECT Name
FROM Production.Product p
WHERE EXISTS  (SELECT * 
			   FROM Production.ProductSubcategory ps
               WHERE ps.ProductSubcategoryID = p.ProductSubcategoryID
                     AND Name = 'Wheels')
order by Name

--все продукты, цены на которые больше или равны максимальной цене в любой подкатегории продуктов
SELECT Name
FROM Production.Product
WHERE ListPrice >= ANY  ( --максимальна€ цена в каждой категории
                         SELECT MAX (ListPrice)   
                         FROM Production.Product
                         GROUP BY ProductSubcategoryID) ;


--число сотрудников в каждом департаменте
  -- внешнее соединение
select d.Name, count(ed.DepartmentID) as qty
from [HumanResources].[Department] d left join [HumanResources].[EmployeeDepartmentHistory] ed
     on d.DepartmentID = ed.DepartmentID
group by d.DepartmentID, d.Name
order by qty desc
  
  -- подзапрос в FROM
select d.Name, edh.qty
from HumanResources.Department d left join 
     (select DepartmentID, count(*) as qty
	  from HumanResources.EmployeeDepartmentHistory 
	  group by DepartmentID ) edh
	  on d.DepartmentID = edh.DepartmentID
order by qty desc

  -- коррелированный подзапрос в select
select d.Name
       ,(select count(*) 
	     from [HumanResources].[EmployeeDepartmentHistory]
		 where DepartmentID = d.DepartmentID) as qty
from [HumanResources].[Department] d
order by qty desc

--Ќайти отделы с максимальным числом сотрудников
 
 -- подзапрос с отсечением в HAVING
select d.Name, count(ed.DepartmentID) as qty
from [HumanResources].[EmployeeDepartmentHistory] ed,[HumanResources].[Department] d
where ed.DepartmentID = d.DepartmentID
      and ed.EndDate is null -- ещЄ работают в этом  отделе
group by d.DepartmentID, d.Name
--размер отдела = найденому максимуму
having count(ed.DepartmentID) = (--величина самого большого отдела
                                 select max(qty)
                                 from ( --число людей в каждом отделе
								        select count(*) as qty
                                        from [HumanResources].[EmployeeDepartmentHistory]
								        where EndDate is null
								        group by DepartmentID
									   ) as DepQty
							    )

--подзапрос с оператором WITH
  with t as 
   (select d.Name, count(*) as qty
    from HumanResources.Department d, HumanResources.EmployeeDepartmentHistory edh
	where edh.DepartmentID = d.DepartmentID
	      and edh.EndDate is null -- ещЄ работают в этом  отделе
	group by d.DepartmentID, d.Name)
  select Name, qty
  from t
  where qty = (select max(qty) from t)
  
--TOP
 -- вывести 5 сотрудников с максимальными продажами за прошлый год
select TOP (5) BusinessEntityID,SalesLastYear
from Sales.SalesPerson s
order by SalesLastYear desc
 -- вывести 20% сотрудников с максимальными продажами за прошлый год
select TOP (20) Percent BusinessEntityID,SalesLastYear
from Sales.SalesPerson s
order by SalesLastYear desc
