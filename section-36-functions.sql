--SCALAR FUNCTIONS
--simple function
CREATE FUNCTION AmountPlusOne(@Amount smallmoney)
RETURNS smallmoney
AS
BEGIN

    RETURN @Amount + 1

END
go

select DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountPlusOne
  from tblTransaction
go

--retorna o número de transações do funcionári
create or alter function NumberOfTransactions(@EmployeeNumber int)
	returns int
as
begin
	declare @NumberOfTransactions int

	select @NumberOfTransactions = count(1)
	  from tblTransaction
	 where EmployeeNumber = @EmployeeNumber

	return @NumberOfTransactions
end
go

select EmployeeNumber, EmployeeFirstName, EmployeeLastName, dbo.NumberOfTransactions(EmployeeNumber) as NumberOfTransactions
  from tblEmployee
go

--INLINE TABLE FUNCTIONS
create or alter function EmployeeTransactionList(@EmployeeNumber int)
	returns table as return
(
	select *
	  from tblTransaction
	 where EmployeeNumber = @EmployeeNumber
)
go

select *
  from dbo.EmployeeTransactionList(123)
go

--Multi-Statement table
--Nesse tipo de função eu posso fazer testes e ajustes (T-SQL). Na inline é só um SQL de retorno
create or alter function TransList(@EmployeeNumber int)
	returns @TransList table
(Amount smallmoney,
 DateOfTransaction smalldatetime,
 EmployeeNumber int)
 as
 begin
	insert into @TransList(Amount, DateOfTransaction, EmployeeNumber)
	select Amount, DateOfTransaction, EmployeeNumber from tblTransaction
	 where EmployeeNumber = @EmployeeNumber
	return
 end
 go

 select *
  from dbo.TransList(123)
go