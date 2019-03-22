-- We need to create an alphabetized list of people for Christmas cards

CREATE TABLE Employees
(
 EID int not null,
 FirstName varchar(20) not null,
 LastName varchar(25) not null,
 StreetAddress varchar(50),
 City varchar(20), 
 State char(2)
 )


 CREATE TABLE Customers
 (
 CID int not null,
 FirstName varchar(20) not null,
 LastName varchar(25) not null,
 StreetAddress varchar(50),
 City varchar(20), 
 State char(2)
 )

 INSERT INTO Employees
 VALUES
 ('1','Jack','Harris','1423 Main Street', 'Jackson', 'TN'),
 ('2','Mark','James','432 Seashore Street', 'Nashville', 'TN'),
 ('3','Alice','Johnson','5235 Highway 495', 'Brentwood', 'TN'),
 ('4','Morgan','Denton','4634 Bluebird Lane', 'Dickson', 'TN'),
 ('5','Don','Carleson','62346 Williamsburg Court', 'Nolensville', 'TN')

 INSERT INTO Customers
 VALUES
 ('101','Jerry','Algood','333 Bullard Ave', 'Chicago', 'IL'),
 ('102','John','Williams','2523 First Avenue North', 'Atlanta', 'GA'),
 ('103','Kristin','Addison','26675 East Hwy 33', 'Dallas', 'TX'),
 ('104','Megan','Wilson','6786 3rd Ave', 'Memphis', 'TN'),
 ('105','Janet','Greene','99674 Jackson Square', 'Louisville', 'KY')

 -- Here's the Employees
 select * from employees

 -- Here's the Customers
 select * from customers

 -- Here are the combined names from both result sets
 -- Data types for columns in both queries must be similar !!!
 select Firstname, Lastname, StreetAddress, City, State
 from customers
 UNION
 select Firstname, Lastname, StreetAddress, City, State
 from employees
 order by Lastname, Firstname