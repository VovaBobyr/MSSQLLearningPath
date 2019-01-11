select *
from HumanResources.MyEmployee; 
--�������������� ������ � ������ 1
update HumanResources.MyEmployee
set FirstName = 'The Best'
where FirstName = 'Ken';
--�������� ���������
select *
from HumanResources.MyEmployee; 
--��������� �������������� ����������
SET IMPLICIT_TRANSACTIONS OFF
update HumanResources.MyEmployee
set FirstName = 'Ken is The Best'
where FirstName = 'The Best';
--�������� ���������
select *
from HumanResources.MyEmployee; 

--��������� ������� ����������
SET IMPLICIT_TRANSACTIONS ON
update HumanResources.MyEmployee
set FirstName = 'Ken is The Best Ever!'
where FirstName = 'Ken is The Best';
--�������� ���������
select *
from HumanResources.MyEmployee; 
--���� �� ���������� - ������ ������ ����!
commit;

--���������������� ����������
begin tran
  --�������� �������
  delete 
  from HumanResources.MyEmployee;
  go
  --������ ���!
  select * from HumanResources.MyEmployee;
  --����� ���������
rollback;
--������ ����
select * 
from HumanResources.MyEmployee

-- ������������� ����� ����������
begin tran                  --������ ����������
select * from HumanResources.MyEmployee;  -- ��������� ���������
SAVE TRANSACTION  point1    -- ����� ����������

--�������� ������ 
delete from HumanResources.MyEmployee where FirstName like '%Ken%';
select * from HumanResources.MyEmployee;
SAVE TRANSACTION  point2   --� ���� ����� ����������� ������� ��� ���������� Ken

delete from HumanResources.MyEmployee where FirstName like 'Ter%';
select * from HumanResources.MyEmployee;
SAVE TRANSACTION  point3  --� ���� ����� ����������� ������� ��� ����������� Ken � Terri

delete from HumanResources.MyEmployee where FirstName not like 'Rob%';
select * from HumanResources.MyEmployee;
ROLLBACK TRANSACTION point3;  -- ������������ � ��������� point3
select * from HumanResources.MyEmployee;
ROLLBACK TRANSACTION point1;  -- �������������� ��������� �������.
select * from HumanResources.MyEmployee;
COMMIT;                       -- ����� ��������� ����������


--�������� �������
CREATE TABLE HumanResources.TestDepartment(
	DepartmentID smallint IDENTITY(1,1) NOT NULL,
	Name		 varchar(200) NOT NULL,
	GroupName    varchar(200) NULL,
	ModifiedDate datetime NOT NULL DEFAULT (getdate())
 CONSTRAINT PK_TestDepartment_DepartmentID PRIMARY KEY (DepartmentID)
 )

 
--�������� ��������� �������, ���������� � �������
--���������
CREATE TABLE #MyTempTable (ID INT PRIMARY KEY);
INSERT INTO #MyTempTable VALUES (1);
select * from #MyTempTable;
--����������
CREATE TABLE ##MyGTempTable (ID INT PRIMARY KEY);
INSERT INTO ##MyGTempTable VALUES (1);
select * from ##MyGTempTable;


--������ � �����������
-- ���������� ����������
DECLARE @MyCounter int;
--���������� ���������� ����������
DECLARE @LastName nvarchar(30), @FirstName nvarchar(20), @StateProvince nchar(2);

--��������� ��������
SET @FirstNameVariable = 'Amy';

begin tran
DECLARE @EmpIDVariable int;
SELECT @EmpIDVariable = MAX(BusinessEntityID)
FROM HumanResources.Employee;
--����������� ����������
select @EmpIDVariable;
commit;

--������������� ����������
begin tran
DECLARE @find varchar(30);
/* Also allowed: DECLARE @find varchar(30) = 'Man%'; */
SET @find = 'Man%';
SELECT p.LastName, p.FirstName, ph.PhoneNumber
FROM Person.Person p JOIN Person.PersonPhone ph
     ON p.BusinessEntityID = ph.BusinessEntityID
WHERE LastName LIKE @find;
commit; 

--������ ������ ������������ Test
use master;
CREATE LOGIN Test  WITH PASSWORD = '1234$NoPassW0rd';
USE TestDB;
CREATE USER Test FOR LOGIN Test;
Grant connect to Test;

--������ ����
use AdventureWorks2012;
GRANT select on OBJECT::HumanResources.Employee to Test; 

--������ �����
USE AdventureWorks2012;
DENY SELECT ON OBJECT::Person.Address TO Test;

