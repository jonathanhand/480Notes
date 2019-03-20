--3.2 insert PLSQL
create or replace procedure AddMe
    (p_snum varchar2, p_callNum varchar2) as 
    v_stuStanding number;
    v_courseStanding number;
begin
    select standing into v_stuStanding
    from students
    where sNum = p_snum;

    select standing into v_courseStanding
    from schclasses s, courses c
    where p_callNum = s.callnum and c.dept=s.dept and c.cnum = s.cnum;

    if v_stuStanding >= v_courseStanding then
        insert into enrollments (snum, callnum) values (p_snum, p_callNum);
        commit;
        dbms_output.put_line('congrats!');
    ELSE
        dbms_output.put_line('not successful');
    end if;
end;
/

--3.3
create or replace procedure AddMe
    (p_snum varchar2, p_callNum varchar2) as 
    v_stuStanding number;
    v_courseStanding number;
    v_creditEnrolled number;
    v_creditWant number;
begin
    select standing into v_stuStanding
    from students
    where sNum = p_snum;

    select standing into v_courseStanding
    from schclasses s, courses c
    where p_callNum = s.callnum and c.dept=s.dept and c.cnum = s.cnum;

    select nvl(sum(c.CRHR), 0) into v_creditEnrolled
    from courses c, enrollments e, schclasses s
    where c.dept=s.dept and c.cnum = s.cnum and e.callnum = s.callnum and e.snum = p_snum;

    select c.crhr into v_creditWant
    from courses c, schclasses s 
    where p_callnum = s.callnum and c.dept=s.dept and c.cnum = s.cnum;

    if (v_creditEnrolled + v_creditWant) <= 15 then
        if v_stuStanding >= v_courseStanding then
           insert into enrollments (snum, callnum) values (p_snum, p_callNum);
            commit;
            dbms_output.put_line('congrats!');
        ELSE
            dbms_output.put_line('not successful');
        end if;
    ELSE
        dbms_output.put_line('too many units! not added!');
    end if;
end;
/
--3.8?
Create or Replace procedure validate_student
(p_snum varchar2) as
v_count number;
Begin
    select count(snum) into v_count
    from students
    where snum = p_snum;
    If v_count = 0 then
        'not valid try again';
    else
        'snum is valid';
end;
/

--%type will give the same data type as column
create or replace procedure validate_student
    (p_snum students.snum%type) as
    v_Major students.Major%type; --makes it the type of the major column in student table
--.....

Begin
    select major, gpa into v_major, v_gpa
    from students
    where snum = p_snum;


--put whole record into local variable
create or replace procedure validate_student
    ( )
    r_student students%RowType;
Begin
    select * into r_student
    from students
    where ....
    If r_student.major = 'IS' then
    ...

SQL%found -- = true if sql statement has found data
SQL%notfound -- = true is sql statement does not find data
SQL%RowCount -- = count of number of records processed by last sql statement.
