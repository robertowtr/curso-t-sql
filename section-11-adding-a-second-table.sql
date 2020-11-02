create table tblTransaction(
	Amount smallmoney not null,
	DataOfTransation smalldatetime null,
	EmployeeNumber int not null
);

--Os joins são iguais aos do Oracle
select distinct Department 
  from tblEmployee

--Isso se chama de derived table
select *
  from (select Department, count(*) as NumberOfDepartment
		  from tblEmployee
		 group by Department) as newTable

--Forma de criar uma tabela com base no SQL. Usa-se o INTO <nome da tabela>
select distinct Department, '' as DepartmentHead
	into tblDepartment
  from tblEmployee

alter table tblDepartment
	alter column DepartmentHead varchar(30)