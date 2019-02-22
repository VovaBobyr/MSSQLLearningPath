
-- A simple stored procedure

-- This is a query that we run often
select p.LastName + ', ' + p.FirstName Name, pp.PhoneNumber
from person.person p
join
person.PersonPhone pp
on 
p.BusinessEntityID=pp.BusinessEntityID
order by Lastname, Firstname


-- Let's create a stored procedure that will
-- return this information
CREATE PROC GetPhone
AS
select p.LastName + ', ' + p.FirstName Name, pp.PhoneNumber
from person.person p
join
person.PersonPhone pp
on 
p.BusinessEntityID=pp.BusinessEntityID
order by Lastname, Firstname


--Hightlight 'GetPhone' and execute 
--The result of the code in the stored procedure will be returned
GetPhone