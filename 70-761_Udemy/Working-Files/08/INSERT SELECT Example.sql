
-- INSERT SELECT Example

-- Let's create a table for our INSERT SELECT statement
-- The SID column will generate an identity number automatically
-- the State column has a default value of 'TN'
CREATE TABLE InsertSelectExample
(
  SID int IDENTITY, 
  FirstName varchar(25) not null,
  LastName varchar(25) not null,
  Emailaddress varchar(50),
)


-- Now, let's INSERT data using INSERT SELECT
INSERT INTO InsertSelectExample
  SELECT p.Firstname, p.Lastname, e.emailaddress
  FROM person.person p
  JOIN person.emailaddress e
  ON p.businessentityid = e.businessentityid

-- Let's check the contents of the InsertSelectExample table
select * from InsertSelectExample

