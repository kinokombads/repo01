drop procedure if exists AddSchoolYear;
delimiter $$;

create procedure AddSchoolYear(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intCreatedById int,
    out itExists int
)
begin

    select count(schoolYearId) 
    into itExists 
    from schoolYears
    where title = strTitle and statId = 1;
    
    if(itExists = 0) then
        insert into schoolYears(
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