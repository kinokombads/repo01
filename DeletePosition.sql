drop procedure if exists DeletePosition;
delimiter $$;

create procedure DeletePosition(
    in intPositionId int
)
begin
        
    update positions
    set statId = 0
    where positionId = intPositionId;
    
end;