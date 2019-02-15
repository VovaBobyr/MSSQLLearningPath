with upper_register as (select 
left(Receiver, CHARINDEX(' ', Receiver)) as Last,
left(substring(Receiver, CHARINDEX(' ', Receiver)+1, len(Receiver)-(CHARINDEX(' ', Receiver))), CHARINDEX(' ', (substring(Receiver, CHARINDEX(' ', Receiver)+1, len(Receiver)-(CHARINDEX(' ', Receiver)))))) as First,
reverse(left(reverse(Receiver), CHARINDEX(' ', reverse(Receiver))-1)) as Middle
from TestTask_170518)
select 
concat (left(left(Last, CHARINDEX(' ', Last)), 1) , lower(substring(Last, 2, (len(Last)-1)))) as LastUA,
concat (left(left(First, CHARINDEX(' ', First)), 1), lower(substring(First, 2, (len(First)-1)))) as FirstUA,
concat (left(left(Middle, CHARINDEX(' ', Middle)+1), 1), lower(substring(Middle, 2, (len(Middle)-1)))) as MiddleUA
from upper_register;