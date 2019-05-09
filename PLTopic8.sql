trigger attaches to table, executed when DML is performed 
(insert, update or delete)

trigger can be used to protect tables
for example, can have trigger to create audit table entry when
a table is changed

code search -- select text from user_source where obj_name='ADDME';

create or replace trigger trig_BD_students
    Before delete on students 

begin
    dbms_output.put_line('... about to be deleted');
end;
/

keywords for trigger: BEFORE or AFTER
if not successfully completed, the AFTER will not trigger

--two ways to fire the trigger
for each statement --this is the default (if type of firing not specified, will be default), means fires once after statement complete
for each row --can be used, will fire trigger after each record updated (can get multiple fires off one statement)

students_audit
sname | snum | time updated | GPAbefore | GPAafter
create or replace trigger trig_AU_students
    after update on students --fires after update completed
    for each row --fires for each row updated
begin
    insert into students_audit values(user, :new.snum, sysdate, :old.gpa, :new.gpa)

end;
/

record being recorded over is called :old
new record coming in to replace is called :new
--syntax to get values is :old.column or :new.column

--12 total types of triggers
--before/after * insert/update/delete * for each statement/for each row

--insert only has :new
--update has :old and :new
--delete has only :old

--homework 10: ex 7.2
--write trigger to print warning after update GPA larger than 1 point
--dbms output "gpa dropped drastically"
--do update with less than gpa point and do update with more than one gpa point

--final is next wednesday
--package
--cursor
--exception
--trigger

--open notes
--give code, what should happen
--or give exception code with bombs


