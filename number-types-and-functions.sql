use [Curso-T-SQL]
go;

--create table
create table tblEmployee(
	EmployeeNumber int,
	EmployeeName int
);

--Creating temporary variables
declare @myvar as int = 2

select @myvar as myVariable

set @myvar = 3

select @myvar as myVariable

set @myvar = @myvar * 4

select @myvar as myVariable

--alter table 
insert into tblEmployee