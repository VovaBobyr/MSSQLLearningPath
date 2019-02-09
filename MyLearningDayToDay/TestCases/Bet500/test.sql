create table #t (CouponPlacedDate datetime)
insert into  #t values(getdate())
insert into  #t values(getdate() + 1)
insert into  #t values(getdate() -2)
insert into  #t values(getdate() + 366)
insert into  #t values(getdate() -722)
select CouponPlacedDate from #t;
select CouponPlacedDate from #t order by CouponPlacedDate asc;
drop table #t