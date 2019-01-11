/*¬ыбрать телефоны, начинающиес€ на 415*/
select *
from Person.PersonPhone
where PhoneNumber like '415%'

/*¬ыбрать телефоны, не начинающиес€ на 415*/
select *
from Person.PersonPhone
where PhoneNumber not like '415%'

--—равнение работы like с разными атрибутами
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

-- ¬ыбрать сотрудников, email которых содержит символ Ђ_ї
--неверно!
select *
from HumanResources.vEmployee
where EmailAddress like '%_%'
--верно
select *
from HumanResources.vEmployee
where EmailAddress like '%A_%' escape 'A'

--выбрать информацию о сотрудниках, у которых от 10 до 20 часов отпуска
select *
from HumanResources.Employee
where VacationHours  between 10 and 20

--—интаксис оператора In
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


--синтаксис оператора case
select Gender,
      case
    	when Gender = 'M' then 'Male'
    	when Gender = 'F' then 'Female'
    	else 'Uknown'
      end as Gender
from [HumanResources].[Employee]

--агрегатный COUNT с разными параметрами
SELECT COUNT(*) as total_qty
       ,COUNT(ALL p.MiddleName) as not_null_qty_a
	   ,COUNT(p.MiddleName) as not_null_qty
	   ,COUNT(DISTINCT p.MiddleName) as unique_qty
FROM [Person].[Person] p;

--агрегатный SUM
SELECT SUM(ListPrice) as SumListPrice
      ,SUM(StandardCost) as SumStandardCost
FROM Production.Product
WHERE Color IS NOT NULL 
    AND ListPrice != 0.00 
    AND Name LIKE 'Mountain%';

--агрегатный AVG: подсчитать среднее число отпускных и общее больничных дл€ вице-президентов
SELECT AVG(VacationHours)AS 'Average vacation hours', 
       SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Vice President%';

--максимально и минимальное количество 
SELECT MAX(TaxRate) as MaxRate
      ,MIN(TaxRate) as MinRate
FROM Sales.SalesTaxRate;


--использование группировки записей:
-- вывести среднее число больничных и отпускных по каждой должности
SELECT JobTitle
       ,AVG(VacationHours)AS 'Average vacation hours'
       ,SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
GROUP BY JobTitle;

-- вывести среднее число больничных и отпускных по каждой должности,
-- на которой работает больше 5 сотрудников  
SELECT JobTitle
       ,AVG(VacationHours)AS 'Average vacation hours'
       ,SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
GROUP BY JobTitle
HAVING COUNT(*)>=5;