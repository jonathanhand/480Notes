--2.2 #9

select sum(grPt*CrHr) / sum(crHr)
from enrollments e, schclasses sc, students s
where e.snum = 101
and e.callnum = sc.callnumand sc.dept = c.dept
and sc.cnum=c.cnumand grade !='F';

--2.3 #1
select sum(amount)
from amazon.com
where custNum = 101;

--2.3 #2
select sum(amount)/(2019 - (min(to_char(OrdDate,'yyyy')))) from amazon where custNum = 101;

create table amazon(custNum number(3),OrdDate date,amount number(5));


--2.4 #4
select avg(GPA), major
from students
group by major;

--2.4 #5
select major
from students
group by major
having count(SNum) > 100;

--2.4 #6
select major
from students
group by major
having avg(gpa) > 3.5;

--2.4 #7
select major
from students
where status='Probation'
group by major
having count(snum) > 35;

--2.5 #1
select count(custNum)
from customers
group by gender;

--2.5 #2
select count(custNum)
from customers
group by Prime;

--2.5 #3
select gender, sum(amount)
from amazon.com a, customers c
where a.custNum, c.custNum
group by gender;

--2.5 #4
select prime, sum(amount)
from amazon.com a, customers c
where a.custNum, c.custNum
group by prime;

--2.5 #5
select gender, sum(amount)/(count(customers.custNum))
from amazon.com a, customers c
where a.custNum = amazon.com.custNum
group by gender;

--2.5 #6
select prime, sum(amount)/(count(customers.custNum))
from amazon.com a, customers c
where a.custNum = amazon.com.custNum
group by prime;