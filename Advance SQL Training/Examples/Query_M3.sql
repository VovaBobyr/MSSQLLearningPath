select *
from HumanResources.MyEmployee; 
--редактирование записи в сессии 1
update HumanResources.MyEmployee
set FirstName = 'The Best'
where FirstName = 'Ken';
--проверка изменений
select *
from HumanResources.MyEmployee; 
--установка автоматических транзакций
SET IMPLICIT_TRANSACTIONS OFF
update HumanResources.MyEmployee
set FirstName = 'Ken is The Best'
where FirstName = 'The Best';
--проверка изменений
select *
from HumanResources.MyEmployee; 

--установка неявной транзакции
SET IMPLICIT_TRANSACTIONS ON
update HumanResources.MyEmployee
set FirstName = 'Ken is The Best Ever!'
where FirstName = 'Ken is The Best';
--проверка изменений
select *
from HumanResources.MyEmployee; 
--пока не завершения - другие сессии ждут!
commit;

--пользовательская транзакция
begin tran
  --удаление записей
  delete 
  from HumanResources.MyEmployee;
  go
  --данных нет!
  select * from HumanResources.MyEmployee;
  --откат изменений
rollback;
--данные есть
select * 
from HumanResources.MyEmployee

-- Использование точек сохранения
begin tran                  --начало транзакции
select * from HumanResources.MyEmployee;  -- начальное состояние
SAVE TRANSACTION  point1    -- точка сохранения

--удаление записи 
delete from HumanResources.MyEmployee where FirstName like '%Ken%';
select * from HumanResources.MyEmployee;
SAVE TRANSACTION  point2   --в этой точке сохраняется таблица без сотрудника Ken

delete from HumanResources.MyEmployee where FirstName like 'Ter%';
select * from HumanResources.MyEmployee;
SAVE TRANSACTION  point3  --в этой точке сохраняется таблица без сотрудников Ken и Terri

delete from HumanResources.MyEmployee where FirstName not like 'Rob%';
select * from HumanResources.MyEmployee;
ROLLBACK TRANSACTION point3;  -- возвращаемся к состоянию point3
select * from HumanResources.MyEmployee;
ROLLBACK TRANSACTION point1;  -- Первоначальное состояние таблицы.
select * from HumanResources.MyEmployee;
COMMIT;                       -- явное окончание транзакции


--создание таблицы
CREATE TABLE HumanResources.TestDepartment(
	DepartmentID smallint IDENTITY(1,1) NOT NULL,
	Name		 varchar(200) NOT NULL,
	GroupName    varchar(200) NULL,
	ModifiedDate datetime NOT NULL DEFAULT (getdate())
 CONSTRAINT PK_TestDepartment_DepartmentID PRIMARY KEY (DepartmentID)
 )

 
--создание временной таблицы, заполнение её данными
--локальная
CREATE TABLE #MyTempTable (ID INT PRIMARY KEY);
INSERT INTO #MyTempTable VALUES (1);
select * from #MyTempTable;
--глобальная
CREATE TABLE ##MyGTempTable (ID INT PRIMARY KEY);
INSERT INTO ##MyGTempTable VALUES (1);
select * from ##MyGTempTable;


--Работа с переменными
-- объявление переменной
DECLARE @MyCounter int;
--объявление нескольких переменных
DECLARE @LastName nvarchar(30), @FirstName nvarchar(20), @StateProvince nchar(2);

--установка значений
SET @FirstNameVariable = 'Amy';

begin tran
DECLARE @EmpIDVariable int;
SELECT @EmpIDVariable = MAX(BusinessEntityID)
FROM HumanResources.Employee;
--отображение переменной
select @EmpIDVariable;
commit;

--использование переменной
begin tran
DECLARE @find varchar(30);
/* Also allowed: DECLARE @find varchar(30) = 'Man%'; */
SET @find = 'Man%';
SELECT p.LastName, p.FirstName, ph.PhoneNumber
FROM Person.Person p JOIN Person.PersonPhone ph
     ON p.BusinessEntityID = ph.BusinessEntityID
WHERE LastName LIKE @find;
commit; 

--создаём нового пользователя Test
use master;
CREATE LOGIN Test  WITH PASSWORD = '1234$NoPassW0rd';
USE TestDB;
CREATE USER Test FOR LOGIN Test;
Grant connect to Test;

--выдача прав
use AdventureWorks2012;
GRANT select on OBJECT::HumanResources.Employee to Test; 

--запрет права
USE AdventureWorks2012;
DENY SELECT ON OBJECT::Person.Address TO Test;

