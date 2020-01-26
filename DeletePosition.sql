drop procedure if exists DeletePosition;
delimiter $$;

create procedure DeletePosition(
    in intId int
)
begin
        
    update positions
    set statId = 0
    where positionId = intId;
    
end;