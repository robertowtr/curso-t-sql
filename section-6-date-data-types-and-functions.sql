select getdate() as rightnow
select dateadd(year, 1, getdate()) as plusyear
select datepart(year, getdate()) as plusyear
select datediff(year, dateadd(year, 1, getdate()), getdate()) as plusyear