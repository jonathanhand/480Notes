--Topic 4: union, intersect, minus

--union all will not eliminate duplicates

--must be union compatable to do union
    --must have same structure (like number of columns)
    --must have same data type in corresponding columns

--4.1 #1
(select students.SNum
from students)
minus
(select enrollments.SNum
from enrollments
where courseNum = 'MGT 425');

--4.1 #2
(select students.SNum
from students
where major='IS');
minus
(select enrollments.SNum
from enrollments, students
where courseNum = 'IS 380' and major = 'IS'
and enrollments.SNum = students.SNum);

--4.1 #3
(select SNum
from enrollments
where courseNum = 'IS 380')
intersect
(select SNum
from enrollments
where courseNum = 'IS 385');

--4.1 #4
(select SNum
from enrollments
where courseNum = 'IS 380')
minus
(select SNum
from enrollments
where courseNum = 'IS 300')

--4.1 #5
(select SNum
from enrollments)
minus
(select SNum
from enrollments
where semester = 'spring')