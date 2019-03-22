--Let's create a stored procedure that 
--utilizes an OUTPUT parameter
CREATE PROC SPoutput
@lname varchar(40),
@numrows int=0 OUTPUT -- This is the output parameter
as
select LastName from Person.Person
where LastName like @lname
set @numrows=@@rowcount

--Now, execute the stored procedure...
Declare @retrows int
exec SPoutput 'B%', @numrows=@retrows OUTPUT;
select @retrows as 'Rows'

-- ##############################################################

--Let's use an OUTPUT parameter in a little different manner
CREATE PROC GetNatID
   @BusEntityID INT,
   @NationalID INT OUTPUT
AS
BEGIN
   SELECT @NationalID = NationalIDNumber 
   FROM HumanResources.Employee 
   WHERE BusinessEntityID = @BusEntityID
END

DECLARE @m int 
EXEC GetNatID 5,@m OUTPUT
Print ' '
Print 'The NationalID number is: '
Print @m


select * from HumanResources.Employee