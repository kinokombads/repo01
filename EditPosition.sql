drop procedure if exists EditPosition;
delimiter $$;

create procedure EditPosition(
    in intId int,
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in strPositionType varchar(100),
    in intModifiedById int,
    out itExists int
)
begin

    select count(positionId)
    into itExists
    from positions
    where positionId <> intId
    and title = strTitle
    and statId = 1;

    if(itExists = 0) then
        update positions
        set title = strTitle,
            details = strDetails,
            positionType = strPositionType,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where positionId = intId;
    end if;

end;