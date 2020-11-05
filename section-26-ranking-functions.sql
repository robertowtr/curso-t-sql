select a.EmployeeNumber,
       a.AttendanceMonth,
	   a.NumberAttendance,
	   row_number() over(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) as TheRowNumber,
	   rank() over(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) as TheRank,
	   dense_rank() over(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) as TheDenseRank
  from tblEmployee as e
	join (select * from tblAttendance
		  union all
		  select * from tblAttendance) a
		on e.EmployeeNumber = a.EmployeeNumber


select a.EmployeeNumber,
       a.AttendanceMonth,
	   a.NumberAttendance,
	   row_number() over(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) as TheRowNumber
  from tblEmployee as e
	join tblAttendance a
		on e.EmployeeNumber = a.EmployeeNumber
