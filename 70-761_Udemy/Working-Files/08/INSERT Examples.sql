
-- INSERT Examples

-- Let's create a table for our inserts
-- The SID column will generate an identity number automatically
-- the State column has a default value of 'TN'
CREATE TABLE InsertExample
(
  SID int IDENTITY, 
  FirstName varchar(25) not null,
  LastName varchar(25) not null,
  City varchar(12) null,
  State char(2) DEFAULT ('TN')
)

-- We will insert data into FirstName, LastName, and City
-- The state column will be assigned its default value of 'TN'
-- The SID column will generate its own value
INSERT INTO InsertExample
(FirstName, LastName, City)
VALUES
('Bob','Jackson','Nashville')

select * from InsertExample

-- We can provide a value for all columns and omit
-- the column names
INSERT INTO InsertExample
VALUES
('Jack','Smith','Atlanta','GA')

-- We can insert row data in a different column order
-- by positionally matching the values and the columns
INSERT INTO InsertExample
(LastName,City,FirstName,State)
VALUES
('Jones','Dallas','Mary','TX')


-- If we omit a column that allow nulls, it will receive 
-- a NULL value
INSERT INTO InsertExample
(LastName,FirstName,State)
VALUES
('Smith','Jennifer','FL')


-- If we omit a column that does not allow nulls
-- we will receive an error
INSERT INTO InsertExample
(LastName,City,State)
VALUES
('Smith','Miami','FL')

-- We can also insert multiple rows using a single INSERT statement
INSERT INTO InsertExample
(LastName,FirstName,City)
VALUES
('Jones','Jack','Nashville'),
('Marly','Harold','Paris'),
('Linley','Morgan','Nashville'),
('Sims','Jill','Franklin')


select * from InsertExample

