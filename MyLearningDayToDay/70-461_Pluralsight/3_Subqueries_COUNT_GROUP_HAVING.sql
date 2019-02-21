---- Using COUNT()
select count(*) as 'TotalContacts',
		count(MiddleName) as 'ContactWithMiddleName'
from Person.Person as p

-- Using GROUP BY
select sum(soh.TotalDue) as SalesAmount,
		st.Name as 'SalesTerritory',
		st.[Group] as 'TerritoryGroup'
from Sales.SalesOrderHeader as soh
inner join sales.SalesTerritory as st
on soh.TerritoryID = st.TerritoryID
group by st.Name, st.[Group]

-- Using HAVING
select sum(soh.TotalDue) as SalesAmount,
		st.Name as 'SalesTerritory'
from Sales.SalesOrderHeader as soh
inner join sales.SalesTerritory as st
on soh.TerritoryID = st.TerritoryID
group by st.Name
having sum(soh.TotalDue) > 20000000

-- WHERE vs. HAVING
select sum(soh.TotalDue) as SalesAmount,
		st.Name as 'SalesTerritory'
from Sales.SalesOrderHeader as soh
inner join sales.SalesTerritory as st on soh.TerritoryID = st.TerritoryID
where st.Name in ('NorthWest','SouthWest','SouthEast','NorthEast')
group by st.Name
having sum(soh.TotalDue) > 20000000