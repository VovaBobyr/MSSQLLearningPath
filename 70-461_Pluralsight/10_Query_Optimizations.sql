DECLARE @sql nvarchar(500) = 'select FirstName, LastName from person.Person where LastName = @LastName'
DECLARE @parameterDefinitions nvarchar(500) = '@LastName nvarchar(50)'

EXECUTE sp_executesql @sql, @parameterDefinitions, @LastName = 'Harrison'