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

/*Fun��es matem�ticas*/
declare @myvar as numeric(7,3) = 3

--exponencia��o
select POWER(@myvar, 2)

--quadrado
select square(@myvar)

--raiz quadrada
select sqrt(@myvar)

go

--Fun��es de arredondamento
declare @myvar as numeric(7,3) = 12.345

select floor(@myvar) as godown
select ceiling(@myvar) as goup
select round(@myvar, 1) as depends_on_digits
select round(@myvar, -1) as tens --desconta para a dezena mais pr�xima
set @myvar = 16.6
select round(@myvar, -1) as tens --desconta para a dezena mais pr�xima

--Outras fun��es
select pi() as pi
select exp(1) as e


--Fun��es para valores absolutos
--abs retorna o valor absoluto e sign retorna o sinal
go
declare @myvar as numeric(7,3) = -456
select abs(@myvar), sign(@myvar)

--Tem tamb�m as fun��es trigonom�tricas

--Convers�o
select cast(3 as decimal(5, 2))
select cast(3.45 as int)
--PONTO DE ATEN��O NA DIVIS�O
--A divis�o de dois inteiros resulta em um inteiro
select 3/2
--Para corrigir, fazer uma convers�o para num�rico
select 3.0/2


--Objetos do banco
select *
  from sys.all_columns;

select *
  from sys.all_objects;

select *
  from sys.all_views;