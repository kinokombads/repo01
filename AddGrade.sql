drop procedure if exists AddGrade;
delimiter $$;

create procedure AddGrade(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intCreatedById int,
    out itExists int
)
begin

    select count(gradeId) 
    into itExists 
    from grades
    where title = strTitle 
    and statId = 1;
    
    if(itExists = 0) then
        insert into grades(
            title,
            details,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            1,
            intCreatedById,
            now()
        );
    end if;

end;