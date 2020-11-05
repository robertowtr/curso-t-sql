--Na chamada da stored procedure, os parâmetros não vão entre parentesis
create or alter proc AverageBalance(@EmployeeNumberFrom int, 
								   @EmployeeNumberTo int, 
								   @AverageBalance int out)
as
begin
	declare @TotalAmount decimal(5, 2), @NumOfEmployee int

	begin try
		print 'here i am ' + convert(varchar(10), @EmployeeNumberFrom)
		select @TotalAmount = isnull(sum(Amount), 0),
			   @NumOfEmployee = count(distinct EmployeeNumber)
  		  from tblTransaction
		 where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo	

		 select @TotalAmount, @NumOfEmployee
		 set @AverageBalance = @TotalAmount / @NumOfEmployee
	 end try
	 begin catch
		print 'here i am again'
		if ERROR_NUMBER() = 8134
		begin
			set @AverageBalance = 0
			return 1
		end
		else
			throw
			select ERROR_MESSAGE() as ErrorMessage,
				   ERROR_LINE() as ErrorLine,
				   ERROR_NUMBER() as ErrorNumber,
				   ERROR_PROCEDURE() as ErrorProcedure,
				   ERROR_SEVERITY() as ErrorSeverity,
				   ERROR_STATE() as ErrorState
	 end catch
end
go

declare @AverageBalance int, @Return int
execute @Return = AverageBalance 4, 5, @AverageBalance output
go

declare @AverageBalance int, @Return int
execute @Return = AverageBalance 223, 227, @AverageBalance output



