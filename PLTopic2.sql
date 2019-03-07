--start 'C:\Users\handj\Desktop\Spring 2019 Work\IS480\codeNotes\PLTopic2.sql'
--anonymous Block

declare
    --in anonymous, have to use declare keyword
    v_Snum varchar2(3),
    v_Sname varchar2(30);

begin
    --main program here
    dbms_output.put_line('Hello World');
end;
/

--stored procedure
create or replace procedure SayWhat(
    --where we declare variables
    p_what varchar2) as
    v_Snum varchar2(3),
    v_Sname varchar2(30);
begin
    --where the main program is
    dbms_output.put_line('I said' || p.what);

end;
/

-- x := 5; assignment. mimics left arrow symbol, changes value of x to 5
-- x = 5; expression. whether or not equal

create or replace procedure ex2_1(
    x1 number,
    x2 number) as
    y1 number;
    y2 number;
    y3 number;
    y4 number;

begin
    y1 := x1 + x2;
    y2 := x1 - x2;
    y3 := x1 * x2;
    y4 := x1 / x2;

    dbms_output.put_line('y1 is '|| y1);
    dbms_output.put_line('y2 is '|| y2);
    dbms_output.put_line('y3 is '|| y3);
    dbms_output.put_line('y4 is '|| y4);

end;
/


create or replace procedure ex2_2(
    x1 number,
    x2 number) as
    y1 number;
    y2 number;
    y3 number;
    y4 number;

begin
    y1 := mod(x1,x2);
    y2 := trunc(x1/x2);
    y3 := round(x1/x2);


    dbms_output.put_line('y1 is '|| y1);
    dbms_output.put_line('y2 is '|| y2);
    dbms_output.put_line('y3 is '|| y3);

end;
/

--ex 2_3 pg 41

create or replace procedure ralphs(
    p_buy number) as
    v_pay number;

begin
    v_pay := p_buy - (trunc(p_buy/4));
    dbms_output.put_line('v_pay is '|| v_pay);
end;
/


create or replace procedure ex2_7(
    p.text varchar2,
    p_char varcar2) as
    v_before varchar2(100);
    v_after varchar2(100);

begin
    v_before := subsrt(p_text, 1, instr(p_text, p_char)-1);
    --v_after := complete for HW

    dbms_output.put_line('before: '||v_before);
    dbms_output.put_line('after: '|| v_after);
end;
/


--while loops
declare
    n integer := 1;

begin
    while n<10 Loop
        dbms_output.put_line(n);
        n := n+1;
    end Loop;

end;
/

--for loop
-- n is counter, 1 is start, 10 is end (includes 10)
begin
    for n in 1..10 Loop
        dbms_output.put_line(n);
    end loop;
end;
/

create or replace procedure PrintTable
(p_BaseNumber number) as

begin
    for n in 1..9 Loop
        dbms_output.put_line(p_BaseNumber || 'x' || n ||'=' || p_BaseNumber*n);
    end loop;
end;
/

--nested loop
begin
    for j in 1..9 loop
        for n in 1..9 Loop
            dbms_output.put_line(j || 'x' || n ||'=' || j*n);
        end loop;
    end loop;
end;
/
--2.21
create or replace procedure LoveWizard
    (p_MagicNumber number) as
    v_loveText varchar2(20);
begin
    v_loveText := 'He loves you';
    IF p_MagicNumber > 0 then
    
        for n in 1..p_MagicNumber-1 Loop
            if mod(n,2)=0 then
                dbms_output.put_line(v_loveText || ' not...');
            
            ELSE
                dbms_output.put_line(v_loveText || '...');
            
            end if;
        end loop;
        if mod(p_MagicNumber,2) = 0 then
            dbms_output.put_line('---> ' || v_loveText || ' not :-(');
        ELSE
            dbms_output.put_line('---> ' || v_loveText || '!!!');
        end if;
    ELSE
        dbms_output.put_line('invalid number');
    end if;
end;
/

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