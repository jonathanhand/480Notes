--exception handling
begin
    insert --
    update -- 
    delete --
    select -- into --

exception
    WHEN <Error1> THEN
        do thing 1;
        do thing 2;
    WHEN <Error2> THEN
        do thing a;
        do thing b;
    --ect...
end;
/
--when error occurs, jumps to exception block and then ends program (does not continue past error)

--nest to continue program
begin
    begin
        insert
    exception
    end;
    update
    delete
    select into
exception
end;
/
--------------------------------
    v_snum ;
    v_callnum ;
    eError1 exception;
begin
    .................;
    ...............;
    if ________ then --write this structure, so that know where thing happened, and also does not continue program
        raise eError1; --makes program go to exception error
    end if;
exception
    WHEN <Error1> THEN
        do thing 1;
        do thing 2;
    WHEN <Error2> THEN
        do thing a;
        do thing b;
    --ect...
end;
/
-----------------------
exception
    when others then --others catches every other error
        --null; --means do nothing
        dbms_output.put_line(sqlErrM); --sqlErrM reserved word, is the error message

end;
/
------------------------

