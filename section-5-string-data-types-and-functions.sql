--char - ASCII - reserva todo o espaço
--varchar - ASCII - reserva somente o espaço do tamanho do dado
--nchar - UNICODE
--nvarchar - UNICODE

declare @var as varchar(10) = 'éñãêdomingo'
select  @var
go
--as funções de string são as mesmas do oracle. a função trim foi adicionada a partir da versão 2017


declare @firstname as varchar(20)
declare @middlename as varchar(20)
declare @lastname as varchar(20)

set @firstname = 'Sarah'
set @middlename = 'Jane'
set @lastname = 'Milligan'

--Modos diferentes de tratar um potencial null no middlename
select @firstname + IIF(@middlename is null, '', ' ' + @middlename) + ' ' + @lastname as fullname
select @firstname + case
						when @middlename is null then ''
						else ' ' + @middlename
					end + ' ' + @lastname  as fullname
select @firstname + coalesce(' ' + @middlename, '') + ' ' + @lastname as fullname
select concat(@firstname, ' ' + @middlename, ' ' + @lastname) as fullname