drop procedure if exists AddSection;
delimiter $$;

create procedure AddSection(
    in strTitle varchar(100),
    out itExists int
)
begin
    select count(SectionId) into itExists
    from sections
    where Title = strTitle and StatId = 1;

    if(itExists = 0) then
        insert into sections(
            Title,
            StatId
        )
        values(
            strTitle,
            1
        );
    end if;

end;