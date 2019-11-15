drop procedure if exists AddPosition;
delimiter $$;

create procedure AddPosition(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in strPositionType varchar(100),
    in intCreatedById int,
    out itExists int
)
begin

    select count(positionId) 
    into itExists 
    from positions
    where title = strTitle 
    and statId = 1;
    
    if(itExists = 0) then
        insert into positions(
            title,
            details,
            positionType,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            strPositionType,
            1,
            intCreatedById,
            now()
        );
    end if;

end;