--DELETE Examples

--Let's use SELECT INTO to create a 
--table to run a few DELETE examples
SELECT TOP 25 LastName, FirstName INTO DeleteExample
FROM Person.Person

--Take a look at the new table
select * from DeleteExample

--Let's run a simple, dangerous DELETE query
DELETE FROM DeleteExample
--Oh, no! The message says that 25 rows were deleted!
--We didn't use a WHERE clause...

--Let's reload our table with data using INSERT SELECT
INSERT INTO DeleteExample
SELECT TOP 25 LastName, FirstName FROM Person.Person

--Verify the data was loaded into the table
select * from DeleteExample

--Now let's use DELETE to remove only the records
--for Kim Abercrombie
DELETE FROM DeleteExample
WHERE LastName='Abercrombie' AND FirstName='Kim'

--A trick for using DELETE without being surprised!
--Write the DELETE statement as a SELECT statement 
--Execute it and see how many rows are returned...
--THEN convert it to a DELETE and execute it!
--
--We want to DELETE records for Ben Adams
--So we'll first write the command as a SELECT
SELECT
LastName, FirstName 
FROM DeleteExample
WHERE LastName='Adams' AND FirstName='Ben'

--Looks good, now lets make it a DELETE statement
--Highlight SELECT LastName,FirstName and change it to the following
--then execute it
DELETE
FROM DeleteExample
WHERE LastName='Adams' AND FirstName='Ben'