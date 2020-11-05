--Na chamada da stored procedure, os parâmetros não vão entre parentesis
create or alter proc NameEmployees(@EmployeeNumberFrom int, 
								   @EmployeeNumberTo int, 
								   @NumberOfRows int out)
as
begin
	if exists(select *
	            from tblEmployee
			   where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
	   select EmployeeNumber, EmployeeFirstName, EmployeeLastName
  	     from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
	    set @NumberOfRows = @@ROWCOUNT

	   return 0
	end
	return 1
end
go

declare @NumberOfRows int, @Return int
execute @Return = NameEmployees 123, 127, @NumberOfRows output
select @NumberOfRows as NumberOfRows, @Return as ReturnStatus


NameEmployees 324, 327