use [Curso-T-SQL]
go;

--create table
create table tblEmployee(
	EmployeeNumber int,
	EmployeeName int
);
go

--Creating temporary variables
declare @myvar as int = 2

select @myvar as myVariable

set @myvar = 3

select @myvar as myVariable

set @myvar = @myvar * 4

select @myvar as myVariable
go

--Integer numbers
/*
bigint: bigger than int
int: up to 2.000.000.000
smallint: -32767 to 32768
tinyint: de 0 a 255. n�o assume valores negativos
*/

--none integer numbers
/*
decimal
numeric
*/

--os dois digitos da casa decimal v�o descontar dos primeiros 7.
declare @numero decimal(7,2) = 1234.12
select @numero
go
/*money e smallmoney
Por padr�o s�o com 4 casas decimais
*/
declare @numero money = 1234.12121
select @numero