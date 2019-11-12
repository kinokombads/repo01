drop procedure if exists EditGrade;
delimiter $$;

create procedure EditGrade(
    in intGradeId int,
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intModifiedById int,
    out itExists int
)
begin
    select count(gradeId) 
    into itExists 
    from grades
    where gradeId <> intGradeId and
        title = strTitle and
        statId = 1;
    
    if(itExists = 0) then
        update grades
        set title = strTitle,
            details = strDetails,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where gradeId = intGradeId and 
            statId = 1;
    end if;
end;