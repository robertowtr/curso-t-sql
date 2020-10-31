--create table
create table tblSecond(
	myNumber int
);

--insert
insert into tblSecond
values(234);

insert into tblSecond
values(234), (123), (456);

--select
select *
  from tblFirst;

select *
  from tblSecond;

--delete
delete from tblFirst
 where myColumn = 567;

truncate table tblFirst;

drop table tblFirst;

drop table tblSecond;

--Para remover o cache dos objetos que foram removidos, mas ainda aparecem nas sugestões, executar CTRL + SHIFT + R