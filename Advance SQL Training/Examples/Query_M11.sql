--��� ������ �� ������� HumanResources.Employee
select *
from HumanResources.Employee;

--������� ���� �� �������
select NationalIDNumber
           , LoginID
           , JobTitle
           , Gender
           , HireDate
from HumanResources.Employee

--���������� ������������� ��������
select distinct Gender
from HumanResources.Employee

--������������� ������� ����
select HireDate
        , getdate() as Now -- �����
from HumanResources.Employee 

select HireDate
       , getdate() as Now  --�����
       ,DATEDIFF(year, HireDate, getdate()) as experience  --�����
from HumanResources.Employee 

--����� �������
select p.FirstName + ' '+ p.LastName as Surname
from [Person].[Person] p

--���������� ������ �� ���� LastName, 
--��� ����� � ���������� LastName - ���������� �� MiddleName �� ��������
select FirstName,MiddleName,LastName
from [Person].[Person]
order by LastName, MiddleName desc

--������� �����, � ������� ��� Kim
select *
from [Person].[Person] p
where p.FirstName = 'Kim'
 
--������� �����������, ������� � 2001 ����
select JobTitle,Gender
from [HumanResources].[Employee]
where year([HireDate]) = '2001'

/*������� ��� ���������� � �����, � ������� ���� ������ ��� (�� ������), 
����������� ������ �� �������*/

select *
from [Person].[Person] p
where p.MiddleName is not null
order by p.LastName
