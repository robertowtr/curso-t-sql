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
)

--alter the table
alter table tblEmployee add Department varchar(10)
alter table tblEmployee alter column Department varchar(20)

select * from tblEmployee

--Consulta com regex - expressões regulares
select *
  from tblEmployee
 where EmployeeLastName like '[r-t]%'

select *
  from tblEmployee
 where EmployeeLastName like '[^rst]%'

--[%] eh o escape
select *
  from tblEmployee
 where EmployeeLastName like '[%]%'
