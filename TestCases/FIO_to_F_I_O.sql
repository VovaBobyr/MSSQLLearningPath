select Receiver, left(Receiver, CHARINDEX(' ', Receiver)) as firstname,
--len(left(Receiver, CHARINDEX(' ', Receiver))),
left(substring(Receiver, CHARINDEX(' ', Receiver)+1, len(Receiver)-(CHARINDEX(' ', Receiver))), CHARINDEX(' ', (substring(Receiver, CHARINDEX(' ', Receiver)+1, len(Receiver)-(CHARINDEX(' ', Receiver)))))),
--len(left(substring(Receiver, CHARINDEX(' ', Receiver)+1, len(Receiver)-(CHARINDEX(' ', Receiver))), CHARINDEX(' ', (substring(Receiver, CHARINDEX(' ', Receiver)+1, len(Receiver)-(CHARINDEX(' ', Receiver))))))),
substring(Receiver, len(Receiver) - CHARINDEX(' ', REVERSE(Receiver))+1, len(Receiver)) as numb
from TestTask_170518;

select reverse(left(reverse(Receiver), CHARINDEX(' ', reverse(Receiver)))) from dbo.TestTask_170518;