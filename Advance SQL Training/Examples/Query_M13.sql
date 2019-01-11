--Cross join - соединение всех со всеми
select e.LoginID, e.JobTitle, e.BusinessEntityID
       ,dh.BusinessEntityID, dh.DepartmentID
from [HumanResources].[Employee] e cross join [HumanResources].[EmployeeDepartmentHistory] dh

--inner join - внутреннее соединение 
select e.LoginID, e.JobTitle, e.BusinessEntityID
       ,dh.BusinessEntityID, dh.DepartmentID
from [HumanResources].[Employee] e inner join [HumanResources].[EmployeeDepartmentHistory] dh
      on e.BusinessEntityID = dh.BusinessEntityID

--неявный inner join 
select e.LoginID, e.JobTitle, e.BusinessEntityID
       ,dh.BusinessEntityID, dh.DepartmentID
from [HumanResources].[Employee] e , [HumanResources].[EmployeeDepartmentHistory] dh
where e.BusinessEntityID = dh.BusinessEntityID

--Вывести фамилию и имя сотрудника, 
         --должность,  которую он занимает
select p.LastName, p.FirstName, e.JobTitle
from [HumanResources].[Employee] e inner join [Person].[Person] p
     on e.BusinessEntityID = p.BusinessEntityID
order by p.LastName

--число сотрудников в каждом отделе (внешнее соединение)
--добавление нового отдела - без сотрудников
insert into HumanResources.Department (Name,GroupName) values ('Test', 'Test Group');
--левое
select d.Name, count(e.DepartmentID) as qty
from [HumanResources].[Department] d left outer join [HumanResources].[EmployeeDepartmentHistory] e
     on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.Name
order by qty ;
--правое
select d.Name, count(e.DepartmentID) as qty
from [HumanResources].[EmployeeDepartmentHistory] e right outer join [HumanResources].[Department] d
     on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.Name
order by qty ;