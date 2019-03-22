
-- SELECT INTO Example

-- Here's a look at the two tables we will use for our source data
select top 1 * from person.person
select top 1 * from person.emailaddress


-- Here is our SELECT INTO statement
SELECT p.FirstName, p.Lastname, e.EmailAddress
INTO EmailList  
from person.person p
JOIN
person.emailaddress e
on 
p.BusinessEntityID=e.BusinessEntityID

-- Here is the data in our new table
select * from EmailList