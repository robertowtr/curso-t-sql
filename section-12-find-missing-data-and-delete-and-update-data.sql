select e.EmployeeNumber as ENumber, e.EmployeeFirstName,
	   e.EmployeeLastName, t.EmployeeNumber as TNumber,
	   sum(t.Amount) as TotalAmount
 from tblEmployee as e
	left join tblTransaction as t
		on e.EmployeeNumber = t.EmployeeNumber
 where t.EmployeeNumber is null
 group by e.EmployeeNumber, e.EmployeeFirstName,
	      e.EmployeeLastName, t.EmployeeNumber
 order by e.EmployeeNumber, e.EmployeeFirstName,
	      e.EmployeeLastName, t.EmployeeNumber


begin transaction
	select count(*) from tblTransaction
	 --where EmployeeNumber not in(select EmployeeNumber
	   --                            from tblEmployee)

	--select * from tblEmployee where EmployeeNumber = 40

	delete from tblTransaction
	 where EmployeeNumber not in(select EmployeeNumber
								   from tblEmployee)

	select count(*) from tblTransaction
rollback transaction

select count(*) from tblTransaction


select *
  from tblTransaction
 where EmployeeNumber = 3

--Pode-se usar a instrução output inserted.* e deleted.* para verificar os registros afetados
begin tran
	update tblTransaction
		set EmployeeNumber = 194
		output deleted.*, inserted.*
	 where EmployeeNumber = 3
rollback tran