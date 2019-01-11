--Примеры CAST
-- преобразование даты к числу
select cast(getdate() as numeric(8,2))
--преобразование даты к строке
select cast(getdate() as varchar(30))
--преобразование числа к формату 
select cast('10.0005' as numeric(10,8))
--преобразование числа к формату
select cast(10.6496 AS int); 

--Примеры CONVERT
--127  - гггг-мм-ддТчч:мм:сс.мммП (без пробелов)
select convert(varchar(40), getdate(),127)
--113 - дд мес гггг чч:мм:сс:ммм (24-часовой формат)
select convert(varchar(40), getdate(),113)
--114 - чч:ми:сс:ммм (24-часовой формат)
select convert(varchar(40), getdate(),114)

--Преобразование неполного года
select cast('01.01.49' as date);
select cast('01.01.50' as date);

/* Вывести информацию о продукте (ProductID) и средней цене продукта (“AVG price = ” + средняя цена продукта) 
 из таблицы SalesOrderDetail.*/
  -- Будет ошибка!
 select s.ProductID, 'AVG price =' + avg(s.UnitPrice) as avg
 from Sales.SalesOrderDetail s
 group by s.ProductID
 --правильно
 select s.ProductID, 'AVG price =' + cast(avg(s.UnitPrice) as varchar(25)) as avg
 from Sales.SalesOrderDetail s
 group by s.ProductID

--INSERT
INSERT INTO Production.UnitMeasure
VALUES ('FT2', 'Square Feet ', GETDATE()), 
       ('Y', 'Yards', GETDATE()),
	   ('Y3', 'Cubic Yards', GETDATE());

--проверка
select *
from Production.UnitMeasure
order by ModifiedDate desc

--INSERT - SELECT
--добавление тестовой записи со сменой
insert into HumanResources.Shift (Name, StartTime, EndTime)
values('Test', '13:00:00','14:00:00')

 
Insert into HumanResources.EmployeeDepartmentHistory 
      (BusinessEntityID,DepartmentID,ShiftID,StartDate)
select edh.BusinessEntityID, edh.DepartmentID, s.ShiftID, getdate()
from HumanResources.EmployeeDepartmentHistory edh, HumanResources.Shift s
where s.Name like 'test' 
      and edh.ShiftID in (select ShiftID from HumanResources.Shift where name like 'day')
	  and edh.DepartmentID = 16

--Редактирование данных
UPDATE Production.Product
SET ListPrice = ListPrice * 2
WHERE ProductID IN  (SELECT ProductID 
					 FROM Purchasing.ProductVendor
					 WHERE BusinessEntityID = 1540);

--удаление данных - простые условия
DELETE 
FROM Production.ProductCostHistory
WHERE StandardCost > 1000.00;

--удалить первые 2.5% записей
DELETE TOP (2.5) PERCENT 
FROM Production.ProductInventory; 

--удалить историю квот по условию
DELETE 
FROM Sales.SalesPersonQuotaHistory 
WHERE BusinessEntityID IN 
                         (SELECT BusinessEntityID 
                          FROM Sales.SalesPerson 
                          WHERE SalesYTD > 25000000.00);

--дочерние записи  - ошибка удаления
delete
from HumanResources.Shift
where name like '%test%'

--удаление DDL - Truncate
	-- создание и заполнение данными таблицы HumanResources.JobCandidateTest
select * into HumanResources.JobCandidateTest
from HumanResources.JobCandidate
	-- проверка заполненности HumanResources.JobCandidateTest
select count(*)
from HumanResources.JobCandidateTest
	--удаление данных
truncate table HumanResources.JobCandidateTest
	-- проверка заполненности HumanResources.JobCandidateTest
select count(*)
from HumanResources.JobCandidateTest