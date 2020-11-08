--self join
select e.EmployeeNumber,
       e.EmployeeFirstName,
	   e.EmployeeLastName,
	   e.Manager,
	   m.EmployeeFirstName ManagerName,
	   m.EmployeeLastName ManagerLastName
  from tblEmployee as e
	left join tblEmployee as m
		on e.manager = m.EmployeeNumber

--recursive CTE (with)
with myTable as
(select EmployeeNumber, EmployeeFirstName, EmployeeLastName, 0 as BossLevel --Anchor
  from tblEmployee
 where Manager is null
 union all		--UNION ALL
 select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, myTable.BossLevel + 1	--Recursive pattern
   from tblEmployee e
     join myTable 
		on e.Manager = myTable.EmployeeNumber)
select *
  from myTable