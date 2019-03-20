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

--HW5: 3.6 3.10