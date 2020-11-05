select a.EmployeeNumber,
       year(a.AttendanceMonth) as AttendanceYear,
	   sum(a.NumberAttendance) as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber
 group by a.EmployeeNumber,
          year(a.AttendanceMonth)
 order by a.EmployeeNumber,
          year(a.AttendanceMonth)

--sum over all the table
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   sum(a.NumberAttendance) over() as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber

--sum over the particularly employee
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber) as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber

--sum over the particularly employee, acumulative by month
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber
									order by a.AttendanceMonth) as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber

--Rows between a fixed range
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   a.NumberAttendance,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber
									order by a.AttendanceMonth
									rows between 1 preceding and 1 following) as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber

--Rows between all the data - unbounded
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   a.NumberAttendance,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber
									order by a.AttendanceMonth
									rows between UNBOUNDED preceding and 1 following) as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber

--Current row
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   a.NumberAttendance,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber
									order by a.AttendanceMonth
									rows between current row and 1 following) as TotalAttendance
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber

--Range - a diferença do Range é que ele olha a chave que coloquei no partition e order
--Então ele soma duas vezes a mesma coisa para linhas duplicadas
select a.EmployeeNumber,
       a.AttendanceMonth as AttendanceYear,
	   a.NumberAttendance,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber
									order by a.AttendanceMonth
									rows between unbounded preceding and current row) as RowsTotal,
	   sum(a.NumberAttendance) over(partition by a.EmployeeNumber
									order by a.AttendanceMonth
									range between unbounded preceding and current row) as RangeTotal
  from tblEmployee as e
	join (select * from tblAttendance
		  union all
		  select * from tblAttendance) as a
		on e.EmployeeNumber = a.EmployeeNumber