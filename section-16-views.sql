--Views
--No SQL Server a op��o CREATE OR REPLACE deve ser CREATE OR ALTER
create or alter view ViewByDepartment
as
select *
  from tblDepartment
go


select *
  from sys.syscomments c
	join sys.views v
		on c.id = v.object_id

--� poss�vel fazer inser��o (insert) em uma view, desde que os dados sejam referentes a uma das tabelas usadas na  view.
--Tamb�m � poss�vel fazer atualiza��o (update)
--No entanto, n�o pode deletar pois afeta v�rias tabelas, apenas pode se a view � baseada em uma �nica tabela