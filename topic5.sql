--self join is a way to join a table twice

--in case of courses join with prereq to get the titles for each
--can't join two different cNum to one cnum in other table

select p.cnum, c1.ctitle, p.precnum, c2.ctitle
from prereq p, courses c1, courses c2
where p.cnum = c1.cnum and p.precnum = c2.cnum;

--selecting the title from the table you joined together

--outer join
--if join column has null values, when go to join it will get rid of records because no matching value

select
from students s, majors m 
where s.major = m.major(+);

SNUM | SNAME | MAJOR-(has nulls)
-----------------------------------
select
from students s, majors m 
where s.major(+) = m.major;

SNUM-(has nulls) | SNAME-(has nulls) | MAJOR
----------------------------------------------

--put (+) on the side where you allow null values

