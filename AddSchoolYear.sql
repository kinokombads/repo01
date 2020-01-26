drop procedure if exists AddSchoolYear;
delimiter $$;

create procedure AddSchoolYear(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in boolActive boolean,    
    in intCreatedById int,
    out itExists int
)
begin

    select count(schoolYearId) 
    into itExists 
    from schoolYears
    where title = strTitle 
    and statId = 1;
       
    if(itExists = 0) then

        if(boolActive = 1) then
            update schoolYears 
            set active = 0
            where active = 1
            and statId = 1;
        end if;

        insert into schoolYears(
            title,
            details,
            active,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            boolActive,
            1,
            intCreatedById,
            now()
        );
    end if;

end;