select DISTINCT LastName + ', ' + FirstName EmployeeName
from Person.Person
order by FirstName
-- Error: 
-- ORDER BY items must appear in the select list if SELECT DISTINCT is specified.
select DISTINCT LastName + ', ' + FirstName EmployeeName
from Person.Person
order by EmployeeName
-- Fine!


select DISTINCT LastName + ', ' + FirstName + ': ' + EmailPromotion
from Person.Person
-- Error:
-- Conversion failed when converting the nvarchar value 'Sánchez, Ken: ' to data type int.
select DISTINCT LastName + ', ' + FirstName + ': ' + CONVERT(varchar(5), EmailPromotion)
from Person.Person

select CONCAT(FirstName, ' ', LastName, ': ', EmailPromotion)
from Person.Person