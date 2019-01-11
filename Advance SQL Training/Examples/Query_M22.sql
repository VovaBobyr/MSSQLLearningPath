--������� CAST
-- �������������� ���� � �����
select cast(getdate() as numeric(8,2))
--�������������� ���� � ������
select cast(getdate() as varchar(30))
--�������������� ����� � ������� 
select cast('10.0005' as numeric(10,8))
--�������������� ����� � �������
select cast(10.6496 AS int); 

--������� CONVERT
--127  - ����-��-�����:��:��.���� (��� ��������)
select convert(varchar(40), getdate(),127)
--113 - �� ��� ���� ��:��:��:��� (24-������� ������)
select convert(varchar(40), getdate(),113)
--114 - ��:��:��:��� (24-������� ������)
select convert(varchar(40), getdate(),114)

--�������������� ��������� ����
select cast('01.01.49' as date);
select cast('01.01.50' as date);

/* ������� ���������� � �������� (ProductID) � ������� ���� �������� (�AVG price = � + ������� ���� ��������) 
 �� ������� SalesOrderDetail.*/
  -- ����� ������!
 select s.ProductID, 'AVG price =' + avg(s.UnitPrice) as avg
 from Sales.SalesOrderDetail s
 group by s.ProductID
 --���������
 select s.ProductID, 'AVG price =' + cast(avg(s.UnitPrice) as varchar(25)) as avg
 from Sales.SalesOrderDetail s
 group by s.ProductID

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