
-- Table Variables Example

--NOTE!
--To run this example, make sure that nothing is highlighted
--and click the Execute button 
--All this code must run sequentially and be executed together

--First, let's create our table variable
DECLARE @MTL as TABLE
(FirstName varchar(40),
 LastName varchar(40),
 Orders int,
 OrderTot int)

 --Now, let's load data into the table variable
 --We'll use an INSERT SELECT statement and do some grouping
 Insert into @MTL 
 (FirstName,LastName,Orders,OrderTot)
    select p.FirstName, p.LastName, COUNT(*), SUM(soh.TotalDue)
    from person.person p
    join
    sales.SalesOrderHeader soh
    on
    p.BusinessEntityID=soh.SalesPersonID
    group by Firstname, Lastname


--Now, let's see the contents of the @MTL table variable
--after the data has been inserted
 select * from @MTL
 order by orders desc