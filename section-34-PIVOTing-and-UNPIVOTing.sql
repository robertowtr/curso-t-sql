--Pivoting
with myTable as 
(select year(DateOfTransaction) as theYear,
	    month(DateOfTransaction) as theMonth,
		Amount
   from tblTransaction)
select *
  from myTable
pivot(sum(Amount) for theMonth in([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as myPivot
order by theYear

--Pivoting with zero instead null
with myTable as 
(select year(DateOfTransaction) as theYear,
	    month(DateOfTransaction) as theMonth,
		Amount
   from tblTransaction)
select theYear,
		isnull([1], 0) as [1],
		isnull([2], 0) as [2],
		isnull([3], 0) as [3],
		isnull([4], 0) as [4],
		isnull([5], 0) as [5],
		isnull([6], 0) as [6],
		isnull([7], 0) as [7],
		isnull([8], 0) as [8],
		isnull([9], 0) as [9],
		isnull([10], 0) as [10],
		isnull([11], 0) as [11],
		isnull([12], 0) as [12]
	into tblPivot
  from myTable
pivot(sum(Amount) for theMonth in([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as myPivot
order by theYear

--unpivot
select *
  from tblPivot
 unpivot(Amount for theMonth in([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as tblUnpivot