/*������� ��������, ������������ �� 415*/
select *
from Person.PersonPhone
where PhoneNumber like '415%'

/*������� ��������, �� ������������ �� 415*/
select *
from Person.PersonPhone
where PhoneNumber not like '415%'

--��������� ������ like � ������� ����������
SELECT distinct  FirstName 
FROM Person.Person 
where FirstName like 'Andre[aw]'
order by FirstName

SELECT distinct  FirstName 
FROM Person.Person 
where FirstName like 'Andre_'
order by FirstName

SELECT distinct  FirstName 
FROM Person.Person 
where FirstName like 'Andre%'
order by FirstName

-- ������� �����������, email ������� �������� ������ �_�
--�������!
select *
from HumanResources.vEmployee
where EmailAddress like '%_%'
--�����
select *
from HumanResources.vEmployee
where EmailAddress like '%A_%' escape 'A'

--������� ���������� � �����������, � ������� �� 10 �� 20 ����� �������
select *
from HumanResources.Employee
where VacationHours  between 10 and 20

--��������� ��������� In
select e.LoginID
from HumanResources.Employee e
WHERE e.JobTitle = 'Design Engineer' 
            OR e.JobTitle = 'Tool Designer' 
            OR e.JobTitle = 'Marketing Assistant';

select e.LoginID
from HumanResources.Employee e
WHERE e.JobTitle in ('Design Engineer',
                                    'Tool Designer' ,
                                     'Marketing Assistant');


--��������� ��������� case
select Gender,
      case
    	when Gender = 'M' then 'Male'
    	when Gender = 'F' then 'Female'
    	else 'Uknown'
      end as Gender
from [HumanResources].[Employee]

--���������� COUNT � ������� �����������
SELECT COUNT(*) as total_qty
       ,COUNT(ALL p.MiddleName) as not_null_qty_a
	   ,COUNT(p.MiddleName) as not_null_qty
	   ,COUNT(DISTINCT p.MiddleName) as unique_qty
FROM [Person].[Person] p;

--���������� SUM
SELECT SUM(ListPrice) as SumListPrice
      ,SUM(StandardCost) as SumStandardCost
FROM Production.Product
WHERE Color IS NOT NULL 
    AND ListPrice != 0.00 
    AND Name LIKE 'Mountain%';

--���������� AVG: ���������� ������� ����� ��������� � ����� ���������� ��� ����-�����������
SELECT AVG(VacationHours)AS 'Average vacation hours', 
       SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Vice President%';

--����������� � ����������� ���������� 
SELECT MAX(TaxRate) as MaxRate
      ,MIN(TaxRate) as MinRate
FROM Sales.SalesTaxRate;


--������������� ����������� �������:
-- ������� ������� ����� ���������� � ��������� �� ������ ���������
SELECT JobTitle
       ,AVG(VacationHours)AS 'Average vacation hours'
       ,SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
GROUP BY JobTitle;

-- ������� ������� ����� ���������� � ��������� �� ������ ���������,
-- �� ������� �������� ������ 5 �����������  
SELECT JobTitle
       ,AVG(VacationHours)AS 'Average vacation hours'
       ,SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
GROUP BY JobTitle
HAVING COUNT(*)>=5;