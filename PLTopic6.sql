Create or replace procedure processGrad --procedure to check for graduation of student


begin
    Loop
        fetch into v_snum --fetch keyword means to get next record
        exit when cursor%notfound; --exit loop when cursor is done. one of ways to exit
        checkGrad(v_snum);
        SendEmail(v_snum);
        insert into Archive .... ;
        Delete from students .. ;
    end loop;
end;
/

--cursor can help us identify which ones to identify
--cursor is a pointer. highlights the area which needs to be processed

cursor (table which needs to be processed (highlighted area from students table))
snum | Major | Standing
102     acc     5      
.............ect.......

select snum, major, Standing
from s
where standing = '5';

1.) create cursor - identify which are needs to be processed
2.) fetch (get into local variables)

--below method with regular loop
create or replace procedure processGrad as
    v_snum students.snum%type;
    v_major students.major%type;
    v_standing students.standing%type;
    cursor cur_Grad as --cursor is keyword. usually named cur in start (or c)
        select snum, major, standing
        from students
        where standing = '5';
begin
    Open cur_grad; --means to now run the select statement, and create cur_grad table (like a temp table in memory)
    Loop
        fetch cur_grad into v_snum, v_major, v_standing; --puts cursor variables into local variables
        exit when cur_grad%NotFound;
        checkGrad(v_snum);
        sendEmail(v_snum);
        insert into Archive ...;
        delete from students ... ;
    end loop;
    close cur_grad; --closes the cursor. deletes it from the memory
end;
/

--get error if do not close cursor
--can have two open only if nested (cursor of a cursor)
--can open one, then close one, then open another (as long as close before opening another)

--below method with for loop
create or replace procedure ProcessGrad as
    cursor cur_grad as
        select snum, major, standing
        from students
        where standing = '5';
begin
    for eachStudent in cur_grad Loop --eachStudent is index. so for each record in cursor, loop
        checkGrad(EachStudent.Snum); --using dot format to access column, makes local variables unnecessary
        sendEmail(EachStudent.Snum);
        insert into Archive ....;
        delete from students ... ;
    end loop;
end;
/

--even more compact version below
create or replace procedure ProcessGrad as


begin
    for eachstudent in (select snum, major, standing --creating cursor in for loop declaration
                        from students
                        where standing = '5') Loop
        checkgrad(eachstudent.snum);
        sendemail(eachstudent.snum);
        insert into archive ...;
        delete from students ... ;
    end loop;
end;
/

----------------------------------------------------------------
update and delete are done with implicit cursor (built in)

update students
set gpa = 4
where major = 'IS'; --uses cursor to loop through each record and update it
---------------------------------------------------------------------------------

-------------------------------------
--to select top 3 students by GPA
select 
....
order by gpa desc;

for eachStudent in cur_grad loop
    if eachstudent = 3
        exit

------------------------------------

--in project...
addme(102, 10111);
addme(106, 10113);
addme(104, 10111);


waitlist table
SNUM | CALLNUM | REQ_TIME (or sysdate or timestamp datatype) --date count to second, timestamp to 1/1000 of second
102     10111       1:00PM
106     10113       2:00PM
104     10111       5:00PM
..........................

dropme(103, 10111);
--enrollments add W for 103 on 10111
--update 

--create cursor that includes ppl waitlisted for 10111, sort by req_time descending
--select snum, from waitlist where callnum = 10111 order by req_time descending?;
--can do below in procedure called process, or can add into dropme procedure
--then addme(102, 10111, v_out);
--if fail, addme(104, 10111); (next on waitlist)
--then when successful, remove from waitlist
--v_out is null, then we know the enrollment was successful
--when count capacity in enrollments, make sure counting where grade not equal to w

--hw 8
--ex 6.6
put ranking

rank snum sname gpa 
1   107
2   102 
...................
define cursor sort by gpa