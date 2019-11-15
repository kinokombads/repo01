drop procedure if exists AddSection;
delimiter $$;

create procedure AddSection(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intCreatedById int,
    out itExists int
)
begin

    select count(sectionId) 
    into itExists 
    from sections
    where title = strTitle 
    and statId = 1;
    
    if(itExists = 0) then
        insert into sections(
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