--все данные из таблицы HumanResources.Employee
select *
from HumanResources.Employee;

--выбрать поля из таблицы
select NationalIDNumber
           , LoginID
           , JobTitle
           , Gender
           , HireDate
from HumanResources.Employee

--устранение повторяющихся значений
select distinct Gender
from HumanResources.Employee

--использование алиасов поля
select HireDate
        , getdate() as Now -- алиас
from HumanResources.Employee 

select HireDate
       , getdate() as Now  --алиас
       ,DATEDIFF(year, HireDate, getdate()) as experience  --алиас
from HumanResources.Employee 

--алиас таблицы
select p.FirstName + ' '+ p.LastName as Surname
from [Person].[Person] p

--сортировка данных по полю LastName, 
--для полей с одинаковым LastName - сортировка по MiddleName по убыванию
select FirstName,MiddleName,LastName
from [Person].[Person]
order by LastName, MiddleName desc

--выбрать людей, у которых имя Kim
select *
from [Person].[Person] p
where p.FirstName = 'Kim'
 
--выбрать сотрудников, нанятых в 2001 году
select JobTitle,Gender
from [HumanResources].[Employee]
where year([HireDate]) = '2001'

/*Выбрать всю информацию о людях, у которых есть второе имя (не пустое), 
упорядочить список по фамилии*/

select *
from [Person].[Person] p
where p.MiddleName is not null
order by p.LastName
