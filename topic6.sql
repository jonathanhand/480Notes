--6.1 q 4
select *
from orders
where amount > (select avg(amount) from orders);

SELECT prod_ord.*, productDescription.category, productDescription.prodName, prod_ord_Query.price 
FROM productDescription INNER JOIN prod_ord ON 
productDescription.prodID = prod_ord.prodNum; 

select * 
from orders 
where amount = (select max(amount) 
                from orders);

delete from orders
where pnum in (select pnum from products where status='Disct');

--8
update customers 
set member='Gold'
where cnum in (select cnum 
        from orders 
        group by
        having sum(amount) > 10000);
--comparing 'where' cnum to 'select' cnum in subquery

--creating new table from existing

create table students2 as (select * from students);

--for only certain columns:
create table students2 as (select snum, sname, major
                            where standing = 'Senior');

--add in more records to existing table

insert into students2
select *
from students;

--joining subquery with another query to get same level (multi & multi)
select sc.callnum, sc.cap, temp1.currEnrolled
from
(select callnum, count(snum) currEnrolled
from enrollments
group by  callnum) temp1,
schClasses sc
where temp1.callnum = schclasses.callnum;

