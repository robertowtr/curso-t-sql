select a.EmployeeNumber,
       a.AttendanceMonth,
	   a.NumberAttendance,
	   first_value(a.NumberAttendance) over(partition by a.EmployeeNumber 
											    order by a.AttendanceMonth) as FirstValue,
	   last_value(a.NumberAttendance) over(partition by a.EmployeeNumber 
											    order by a.AttendanceMonth
											rows between unbounded preceding and unbounded following) as LastValue
  from tblEmployee as e
	join (select * from tblAttendance
		  union all
		  select * from tblAttendance) a
		on e.EmployeeNumber = a.EmployeeNumber


--LAG e LEAD pega valores acima ou abaixo. O segundo parâmetro é o offset, e o terceiro é para valores nulos
select a.EmployeeNumber,
       a.AttendanceMonth,
	   a.NumberAttendance,
	   lag(a.NumberAttendance, 1, -1) over(partition by a.EmployeeNumber 
									    order by a.AttendanceMonth) as MyLag,
	   lead(a.NumberAttendance, 1, -1) over(partition by a.EmployeeNumber 
									     order by a.AttendanceMonth) as MyLead
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber


--CUME_DIST e PERCENT_RANK: faz as proporções ex do employee 123 tem 22 registros.
--então, a sequência 1/22, 2/22, 3/22
select a.EmployeeNumber,
       a.AttendanceMonth,
	   a.NumberAttendance,
	   cume_dist() over(partition by a.EmployeeNumber 
							order by a.AttendanceMonth) as MyCumeDist,
	   percent_rank() over(partition by a.EmployeeNumber 
							   order by a.AttendanceMonth) as MyPercentRank
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber