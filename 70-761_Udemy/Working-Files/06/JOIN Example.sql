


-- Let's look at a simple JOIN example
-- We want each employee's first name, last name, and email address

-- We will get data from the FirstName and LastName
-- columns in the Person.Person table
select top 1 * from person.person

-- We will get data from the EmailAddress column
-- in the Person.EmailAddress table
select top 1 * from person.emailaddress

-- Here's the basic structure
select Person.FirstName, Person.LastName, EmailAddress.EmailAddress
from Person.Person
JOIN
Person.EmailAddress
ON
Person.BusinessEntityID = EmailAddress.BusinessEntityID
where LastName like 'b%'
order by LastName, FirstName