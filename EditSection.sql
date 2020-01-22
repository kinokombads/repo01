drop procedure if exists EditSection;
delimiter $$;

create procedure EditSection(
    in intId int,
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intModifiedById int,
    out itExists int
)
begin
    select count(sectionId) 
    into itExists 
    from sections
    where sectionId <> intId and
        title = strTitle and
        statId = 1;
    
    if(itExists = 0) then
        update sections
        set title = strTitle,
            details = strDetails,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where sectionId = intId and 
            statId = 1;
    end if;
end;