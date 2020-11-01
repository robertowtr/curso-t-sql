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
tinyint: de 0 a 255. não assume valores negativos
*/

--none integer numbers
/*
decimal
numeric
*/

--os dois digitos da casa decimal vão descontar dos primeiros 7.
declare @numero decimal(7,2) = 1234.12
select @numero
go
/*money e smallmoney
Por padrão são com 4 casas decimais
*/
declare @numero money = 1234.12121
select @numero

/*Funções matemáticas*/
declare @myvar as numeric(7,3) = 3

--exponenciação
select POWER(@myvar, 2)

--quadrado
select square(@myvar)

--raiz quadrada
select sqrt(@myvar)

go

--Funções de arredondamento
declare @myvar as numeric(7,3) = 12.345

select floor(@myvar) as godown
select ceiling(@myvar) as goup
select round(@myvar, 1) as depends_on_digits
select round(@myvar, -1) as tens --desconta para a dezena mais próxima
set @myvar = 16.6
select round(@myvar, -1) as tens --desconta para a dezena mais próxima

--Outras funções
select pi() as pi
select exp(1) as e


--Funções para valores absolutos
--abs retorna o valor absoluto e sign retorna o sinal
go
declare @myvar as numeric(7,3) = -456
select abs(@myvar), sign(@myvar)

--Tem também as funções trigonométricas