--character dunctions
--Concat:
    --Select Last || ',' || First from students;

--for header to look better
--Select Last || ',' || First as sname from students;
        --SNAME
        --Smith, John

upper('sOphIe') -- -> SOPHIE
lower('') --> all lower
initcap('') --> Sophie
initcap('soPHIE lEE') --> Sophie Lee

rtrim('Sophie     ') --> 'Sophie'
ltrim('      Sophie') --> 'Sophie'
ltrim(rtrim('     Sophie     ')) --> 'Sophie' (does both sides at once)
--trim whenever user input. Don;t trust users!
ltrim(rtrim('             ')) --> null
rtrim('Sophie*****', '*') --> Sophie

select rpad(pnum, 8,' ') --> 'p1    ' (8 characters wide)
--rpad helps control width of the columns

--substrings
substr('sopHIe',4,2) --> HI
substr('sOPHIE', 2) --> OPHIE
substr('sophIE', -2) --> IE (last two)

instr('xyz-8251', '-') --> 4 (gives index of where it is)
instr('xyz-8251', 'A') --> 0 (index not found)
--only finds first instance of char. run loop to find multiple

length('1234567ABC') --> 10 (it returns how long the string is)

--4.8 #1
update students 
set username= 'z' || substr(lastname, 1, 2) 
|| substr(SSN, -4);

--4.9 #5
--update and concat prefix and suffix of hyphen

ceil(3.45) --> 4
floor(3.45) --> 3
round(123.45) --> 123
round(123.45, 1) -->123.5
round(123.45, -1) --> 120 (rounds to one place left of the decimal point)
trunc() --> takes off the digits after the decimal
mod(9,4) -->1

select decode(grade, 'A', 4, 'B', 3, 'C', 2, 'D', 1, 'F', 0, 0) --> last digit is value for else (if no match)
from enrollments;

select year semester
from e order by decode(semesester, 'sp',1,'su',2,'fa',3,0);
  
select Tr#, TrDate
decode(trType,'Credit', Amount, -Amount)
from ....;

--decode as null, x, then can count. will not count the null
--group by M or F

nvl(major,'NA') != 'IS' --if major is null, the use 'NA' as value instead
