-- Using input parameters with stored procedures

-- Add an input parameter requires the use of an input variable
-- We add the input parameter BEFORE the AS keyword...
-- We can provide a default value for the input parameter...	
-- If a parameter is not provided when GetPhone is called,
-- the default value is called
-- We will modify the WHERE clause to use LIKE and new variable
ALTER PROC GetPhone
@lastname varchar(50)='%'  --Note that the default value is optional
AS
select p.LastName + ', ' + p.FirstName Name, pp.PhoneNumber
from person.person p
join
person.PersonPhone pp
on 
p.BusinessEntityID=pp.BusinessEntityID		
where LastName LIKE @lastname


--Hightlight 'GetPhone' and include the input parameter, then execute 
--The result of the code in the stored procedure will be returned
GetPhone 'Jones'

--What about more than one input parameter?
ALTER PROC GetPhone
@lastname varchar(50),
@firstname varchar(50)
AS
select p.LastName + ', ' + p.FirstName Name, pp.PhoneNumber
from person.person p
join
person.PersonPhone pp
on 
p.BusinessEntityID=pp.BusinessEntityID
where LastName=@lastname and FirstName=@firstname

GetPhone 'Adams', 'Alex'