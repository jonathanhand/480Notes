--functions need to be embedded in a command
--procedures are standalone
--now the lines are blurred between fucntions and procedures
--syntax is the only difference between the two now

create or replace procedure AddMe
    (p_snum students.snum%type,
    p_callnum schClasses.callnum%type) AS
    v_answer_s varchar2(100);
    v_answer_c varchar2(100);

begin
    validate_snum(p_snum, v_answer_s);
    validate_callnum(p_callnum, v_answer_c);
    if v_answer_s = null and v_answer_c = null then
        enroll;
    else
        dbms_output.putLine(v_answer_s || v_answer_c)
    end if;
end;
/
--below is procedure called
create or replace validate_snum
    (p_snum students.snum%type,
    p_answer OUT varchar2) as --out keyword to let know being passed out of procedure
    v_count number;

begin
    select count(snum) into v_count
    from students
    where snum = p_snum;
    if v_count = 0 then
        p_answer:= 'SNUM not valid';
    else
        p_answer:= null;
    end if;
end;
/

CREATE OR REPLACE PROCEDURE VALIDATE_CALLNUM
    (p_callnum schclasses.callnum%type,
    p_answer OUT varchar2) as
    v_count number;

begin
    select count(*) into v_count
    from schclasses
    where callnum = p_callnum;
    if v_count = 0 then
        p_answer = 'callnum not valid';
    else
        p_answer = null;
    end if;
end;
/

--three types of parameters:
--IN --> cannot be changed once passed in, otherwise error
--OUT --> returned back to calling place when its function/procedure is done
--IN OUT --> passed in data, but can be changed and is returned OUT to calling function/procedure
--defaults as IN, if not specified

--above were examples of procedures calling procedures
--------------------------------------------------------------------------------------------
--NOTES FOR 3/20/19

--This is a procedure below
CREATE OR REPLACE PROCEDURE VALIDATE_CALLNUM
    (p_callnum students.snum%type,
    p_answer OUT varchar2) as --in procedure type out is the value sent back to calling function
    v_count number;
begin
    select count(*) into v_count
    from students
    where snum= p_snum;
    if v_count = 0 then
        p_answer := 'yes';
    else
        p_answer := 'no';
    end if;
end;
/
----------------------------------------------------------------------------------------------
--This is the same thing, but written as a function
Create or Replace Function func_validate_snum
    (p_snum students.snum%type)
    return varchar2 is --value is returned in function, not type out
    v_count number;
begin
    select count(*) into v_count
    from students
    where snum = p_snum;
    If v_count = 1 then
        return 'yes';
    Else
        return 'Student not valid';
    end if;
end;
/
--calling the function
create or replace procedure AddMe
    (p_snum students.snum%type,
    p_callnum schClasses.callnum%type) AS
    v_answer_p varchar2(1000);
    v_answer_f varchar2(1000);

begin
--procedure call
    validate_snum(p_snum, v_answer_s);
    validate_callnum(p_callnum, v_answer_c);

--function call
    v_answer_f := func_validate_snum(p_snum);

    if all check then
        enroll;
    else
        sorry
    end if;
end;
/

--by doing function you can minimize your code like so....
create or replace procedure AddMe
    (p_snum students.snum%type,
    p_callnum schClasses.callnum%type) AS

begin
    if func_validate_snum(p_snum) is null then
        enroll;
    else
        dbms_output.put_line(func_validate_snum(p_snum));
    end if;
end;
/
--functions can only return one value, unlike procedures

--hw 6

begin
    check snum;
    check callnum;
    check capacity;
    check 15hr;
    --if one or two not valid, do not proceed with 3 and 4. do error message and skip

    --check 1
    --check 2
    --if both ok then
    --check 3
    --check 4
    --else\

exec validate_snum(10);

exec validate_sum(101, v_answer);

declare
    v_out varchar2(1000);
begin
    validate_snum(101, v_out);
    dbms_output.put_line(v_out);
end;
/

--midterm 2
PL/SQL
assignment := ;
ifloop
-sql in pl/sql
-functions and procedures
bring hw6 due next wednesday 3/27