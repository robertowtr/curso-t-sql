use [Curso-T-SQL]
go

--creation a table
create table tblEmployee(
	EmployeeNumber int not null,
	EmployeeFirstName varchar(50) not null,
	EmployeeMiddleName varchar(50) null,
	EmployeeLastName varchar(50) not null,
	EmployeeGovernmentID char(10) null,
	DateOfBirth date not null
);

--alter the table
alter table tblEmployee add Department varchar(10);
alter table tblEmployee alter column Department varchar(20);

select * from tblEmployee;

--Consulta com regex - express�es regulares
select *
  from tblEmployee
 where EmployeeLastName like '[r-t]%';

select *
  from tblEmployee
 where EmployeeLastName like '[^rst]%';

--[%] eh o escape
select *
  from tblEmployee
 where EmployeeLastName like '[%]%';

--os operadores relacionais s�o iguais aos do Oracle. Apenas tem a diferen�a do escape.
--> < <> = between and not or in

--Se usar fun��es agregadas, o group by � obrigat�rio, da mesma forma que no Oracle

/*Os resultados de uma consulta s�o n�o deterministicos. Se eu tenho v�rios HDs 
de onde os dados s�o recuperados, ent�o os dados podem ser ordenados de forma diferente,
dependendo da velocidade de retorno dos discos ou de outros fatores.
Por isso, pode-se usar o order by para sempre ter o mesmo resultado.*/

--Selecionar o top 5
select top(5) left(EmployeeLastName, 1) as initial, count(*) as CountInitial
  from tblEmployee
 group by left(EmployeeLastName, 1)
 order by count(*) desc;

--having � igual ao Oracle, apenas muda a posi��o dele onde ele vai para depois do group by
select left(EmployeeLastName, 1) as initial, count(*) as CountInitial
  from tblEmployee
 group by left(EmployeeLastName, 1)
 having count(*) >= 50
 order by count(*) desc;

--No order by pode ser usado o alias da coluna
select left(EmployeeLastName, 1) as initial, count(*) as CountInitial
  from tblEmployee
 group by left(EmployeeLastName, 1)
 having count(*) >= 50
 order by CountInitial desc;

Update tblEmployee
Set EmployeeMiddleName = NULL
Where EmployeeMiddleName = ''