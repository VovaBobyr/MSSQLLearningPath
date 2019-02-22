
-- Updating Data

--Let's take a look at the table we will UPDATE
select * from Person.Address

--A simple UPDATE 
--NOTE what happens when you run it!
UPDATE Person.Address
SET ModifiedDate = GETDATE();

--You should always include a WHERE clause...
--First, determine which data row you want to update
select * from Person.Address

--We want to update AddressLine1 where it is currently
--1226 Shoe St.
UPDATE Person.Address
SET AddressLine1='1227 Shoe St.'
WHERE AddressLine1='1226 Shoe St.'

--Verify the change was made
select * from Person.Address

--We can UPDATE several columns at once
--Let's look at the table we are going to UPDATE
select * from Sales.SalesPerson

--Now let's update multiple columns
UPDATE Sales.SalesPerson
SET Bonus = 6000, CommissionPct = .10, SalesQuota = NULL
WHERE TerritoryID=1;

--Look at the table and verify UPDATE occurred
select * from Sales.SalesPerson