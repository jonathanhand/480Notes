/*
--start "C:\Users\handj\Desktop\Spring 2019 Work\IS480\codeNotes\PL\SQL.sql"
set serveroutput on --like echo on, makes it so can see output
begin
    dbms_output.put ('Hello ');
    dbms_output.put_line ('World'); 
    dbms_output.put_line('line');
    --put_line goes to next line for next command
    --put stays on same line
end;
--this is called anonymous block. It's only local, not saved
--stored procedure is something that gets stored in oracle
*/

/*
--stored procedure
create or replace procedure SayHi as

begin
  dbms_output.put_line('Hi');
end;
/
--must execute to run the program
--exec SayHi (abbrev for execute, then procedure name)
*/
/*
--program with input 
create or replace procedure SayWhat
    (p_what varchar2) as --input parameters. have to set data type

    begin
      dbms_output.put_line('I said '||p_what);
    end;
    /
*/

create or replace procedure Greeting
    (p_who varchar2,
    p_what varchar2) as

    v_snum varchar2(3); --where to declare variables
    v_sname varchar2(10);
begin
    dbms_output.put_line(p_who||' I said '||p_what);
end;
/