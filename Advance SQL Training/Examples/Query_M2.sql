--������� �� �����������, � ������� ������� � ������� ���� 
--( ���� SalesLastYear) ���� �������
select p.FirstName + ' ' + p.LastName as Surname
from [Person].[Person] p
where p.BusinessEntityID in (select s.BusinessEntityID
                             from [Sales].[SalesPerson] s
							 where s.SalesLastYear = 0)

--������� �� ��������� ��� �� ���������, ��� � ��������� � ������� adventure-works\mark1
select p.LastName + ' ' + p.FirstName as Surname
       ,e.JobTitle
from Person.Person p, HumanResources.Employee e
where p.BusinessEntityID = e.BusinessEntityID   --���������� ������
      and e.Gender = 'F'                        --����������
	  and e.JobTitle in (select JobTitle
	                     from HumanResources.Employee
						 where LoginID = 'adventure-works\mark1');

--����� �������, �� ������������� ���������� �����������
SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID NOT IN  (SELECT ProductSubcategoryID
									FROM Production.ProductSubcategory
									WHERE Name = 'Mountain Bikes' 
										  OR Name = 'Road Bikes'
										  OR Name = 'Touring Bikes')


--����� ���� ������������ �������, ����������� � ������������ Wheels
SELECT Name
FROM Production.Product p
WHERE EXISTS  (SELECT * 
			   FROM Production.ProductSubcategory ps
               WHERE ps.ProductSubcategoryID = p.ProductSubcategoryID
                     AND Name = 'Wheels')
order by Name

--��� ��������, ���� �� ������� ������ ��� ����� ������������ ���� � ����� ������������ ���������
SELECT Name
FROM Production.Product
WHERE ListPrice >= ANY  ( --������������ ���� � ������ ���������
                         SELECT MAX (ListPrice)   
                         FROM Production.Product
                         GROUP BY ProductSubcategoryID) ;


--����� ����������� � ������ ������������
  -- ������� ����������
select d.Name, count(ed.DepartmentID) as qty
from [HumanResources].[Department] d left join [HumanResources].[EmployeeDepartmentHistory] ed
     on d.DepartmentID = ed.DepartmentID
group by d.DepartmentID, d.Name
order by qty desc
  
  -- ��������� � FROM
select d.Name, edh.qty
from HumanResources.Department d left join 
     (select DepartmentID, count(*) as qty
	  from HumanResources.EmployeeDepartmentHistory 
	  group by DepartmentID ) edh
	  on d.DepartmentID = edh.DepartmentID
order by qty desc

  -- ��������������� ��������� � select
select d.Name
       ,(select count(*) 
	     from [HumanResources].[EmployeeDepartmentHistory]
		 where DepartmentID = d.DepartmentID) as qty
from [HumanResources].[Department] d
order by qty desc

--����� ������ � ������������ ������ �����������
 
 -- ��������� � ���������� � HAVING
select d.Name, count(ed.DepartmentID) as qty
from [HumanResources].[EmployeeDepartmentHistory] ed,[HumanResources].[Department] d
where ed.DepartmentID = d.DepartmentID
      and ed.EndDate is null -- ��� �������� � ����  ������
group by d.DepartmentID, d.Name
--������ ������ = ��������� ���������
having count(ed.DepartmentID) = (--�������� ������ �������� ������
                                 select max(qty)
                                 from ( --����� ����� � ������ ������
								        select count(*) as qty
                                        from [HumanResources].[EmployeeDepartmentHistory]
								        where EndDate is null
								        group by DepartmentID
									   ) as DepQty
							    )

--��������� � ���������� WITH
  with t as 
   (select d.Name, count(*) as qty
    from HumanResources.Department d, HumanResources.EmployeeDepartmentHistory edh
	where edh.DepartmentID = d.DepartmentID
	      and edh.EndDate is null -- ��� �������� � ����  ������
	group by d.DepartmentID, d.Name)
  select Name, qty
  from t
  where qty = (select max(qty) from t)
  
--TOP
 -- ������� 5 ����������� � ������������� ��������� �� ������� ���
select TOP (5) BusinessEntityID,SalesLastYear
from Sales.SalesPerson s
order by SalesLastYear desc
 -- ������� 20% ����������� � ������������� ��������� �� ������� ���
select TOP (20) Percent BusinessEntityID,SalesLastYear
from Sales.SalesPerson s
order by SalesLastYear desc

--INSERT
INSERT INTO Production.UnitMeasure
VALUES ('FT2', 'Square Feet ', GETDATE()), 
       ('Y', 'Yards', GETDATE()),
	   ('Y3', 'Cubic Yards', GETDATE());

--��������
select *
from Production.UnitMeasure
order by ModifiedDate desc

--INSERT - SELECT
--���������� �������� ������ �� ������
insert into HumanResources.Shift (Name, StartTime, EndTime)
values('Test', '13:00:00','14:00:00')

 
Insert into HumanResources.EmployeeDepartmentHistory 
      (BusinessEntityID,DepartmentID,ShiftID,StartDate)
select edh.BusinessEntityID, edh.DepartmentID, s.ShiftID, getdate()
from HumanResources.EmployeeDepartmentHistory edh, HumanResources.Shift s
where s.Name like 'test' 
      and edh.ShiftID in (select ShiftID from HumanResources.Shift where name like 'day')
	  and edh.DepartmentID = 16

--�������������� ������
UPDATE Production.Product
SET ListPrice = ListPrice * 2
WHERE ProductID IN  (SELECT ProductID 
					 FROM Purchasing.ProductVendor
					 WHERE BusinessEntityID = 1540);

--�������� ������ - ������� �������
DELETE 
FROM Production.ProductCostHistory
WHERE StandardCost > 1000.00;

--������� ������ 2.5% �������
DELETE TOP (2.5) PERCENT 
FROM Production.ProductInventory; 

--������� ������� ���� �� �������
DELETE 
FROM Sales.SalesPersonQuotaHistory 
WHERE BusinessEntityID IN 
                         (SELECT BusinessEntityID 
                          FROM Sales.SalesPerson 
                          WHERE SalesYTD > 25000000.00);

--�������� ������  - ������ ��������
delete
from HumanResources.Shift
where name like '%test%'

--�������� DDL - Truncate
	-- �������� � ���������� ������� ������� HumanResources.JobCandidateTest
select * into HumanResources.JobCandidateTest
from HumanResources.JobCandidate
	-- �������� ������������� HumanResources.JobCandidateTest
select count(*)
from HumanResources.JobCandidateTest
	--�������� ������
truncate table HumanResources.JobCandidateTest
	-- �������� ������������� HumanResources.JobCandidateTest
select count(*)
from HumanResources.JobCandidateTest