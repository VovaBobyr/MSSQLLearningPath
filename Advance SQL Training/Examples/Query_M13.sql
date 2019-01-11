--Cross join - ���������� ���� �� �����
select e.LoginID, e.JobTitle, e.BusinessEntityID
       ,dh.BusinessEntityID, dh.DepartmentID
from [HumanResources].[Employee] e cross join [HumanResources].[EmployeeDepartmentHistory] dh

--inner join - ���������� ���������� 
select e.LoginID, e.JobTitle, e.BusinessEntityID
       ,dh.BusinessEntityID, dh.DepartmentID
from [HumanResources].[Employee] e inner join [HumanResources].[EmployeeDepartmentHistory] dh
      on e.BusinessEntityID = dh.BusinessEntityID

--������� inner join 
select e.LoginID, e.JobTitle, e.BusinessEntityID
       ,dh.BusinessEntityID, dh.DepartmentID
from [HumanResources].[Employee] e , [HumanResources].[EmployeeDepartmentHistory] dh
where e.BusinessEntityID = dh.BusinessEntityID

--������� ������� � ��� ����������, 
         --���������,  ������� �� ��������
select p.LastName, p.FirstName, e.JobTitle
from [HumanResources].[Employee] e inner join [Person].[Person] p
     on e.BusinessEntityID = p.BusinessEntityID
order by p.LastName

--����� ����������� � ������ ������ (������� ����������)
--���������� ������ ������ - ��� �����������
insert into HumanResources.Department (Name,GroupName) values ('Test', 'Test Group');
--�����
select d.Name, count(e.DepartmentID) as qty
from [HumanResources].[Department] d left outer join [HumanResources].[EmployeeDepartmentHistory] e
     on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.Name
order by qty ;
--������
select d.Name, count(e.DepartmentID) as qty
from [HumanResources].[EmployeeDepartmentHistory] e right outer join [HumanResources].[Department] d
     on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.Name
order by qty ;