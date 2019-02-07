  -- First Part
  SELECT t1.StaffID,upper(Left(Receiver,1)) + lower(substring(Receiver,2,CHARINDEX(' ',Receiver)-2)) AS text1
  from TestTask_170518 as t1

  -- Second Part
  with t2 (StaffID,p2) AS
  (select StaffID,SUBSTRING(Receiver, CHARINDEX(' ', Receiver)+1,
  CHARINDEX(' ',SUBSTRING(Receiver, CHARINDEX(' ', Receiver)+1,LEN(Receiver)))
  ) as p2  from TestTask_170518)
  select StaffID,upper(Left(t2.p2,1)) + lower(substring(t2.p2,2,LEN(t2.p2))) as text2 from t2

  -- Third part
  select t3.StaffID, upper(Left(t4.p3,1)) + lower(substring(t4.p3,2,LEN(t4.p3))) as text3
   from TestTask_170518 as t3,
   (select StaffID,RIGHT(Receiver, CHARINDEX(' ', REVERSE(Receiver)) - 1) as p3  from TestTask_170518) as t4
   where t3.StaffID = t4.StaffID