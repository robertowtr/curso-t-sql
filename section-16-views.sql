--Views
--No SQL Server a opção CREATE OR REPLACE deve ser CREATE OR ALTER
create or alter view ViewByDepartment
as
select *
  from tblDepartment
go


select *
  from sys.syscomments c
	join sys.views v
		on c.id = v.object_id

--É possível fazer inserção (insert) em uma view, desde que os dados sejam referentes a uma das tabelas usadas na  view.
--Também é possível fazer atualização (update)
--No entanto, não pode deletar pois afeta várias tabelas, apenas pode se a view é baseada em uma única tabela