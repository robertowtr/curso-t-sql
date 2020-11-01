--char - ASCII - reserva todo o espa�o
--varchar - ASCII - reserva somente o espa�o do tamanho do dado
--nchar - UNICODE
--nvarchar - UNICODE

declare @var as varchar(10) = '����domingo'
select  @var
go
--as fun��es de string s�o as mesmas do oracle. a fun��o trim foi adicionada a partir da vers�o 2017


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