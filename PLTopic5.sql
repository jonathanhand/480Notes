--body:
Create or Rplace Package body Enroll as
    procedure validSnum
        (p_snum in .. ,
        p_out OUT ... ) as
        begin
        --code
        end;

    function validCallNum
    (p_callnum in ...)
    return varchar2 is
        begin
        --code
        end;
    
    procedure AddMe
    (p_snum in.., 
    p_callnum in...) as
        begin
        --code
        end;
End;
/

--table of content (header or spec)
Create or Replace Package Enroll as
    procedure validSnum
    (p_snum in...,
    p_out OUT ..);

    function validCallnum(
        p_callnum in ..)
        return varchar2;

    procedure AddMe
    (p_snum in ...,
    p_callnum in ...);
end;
/
--package is like a book...
--table of contents 
--two parts: body and header

--spec has to be created before body
--names and types must be identical between spec and body