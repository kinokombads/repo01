drop procedure if exists DeleteVoterClearance;
delimiter $$;

create procedure DeleteVoterClearance(
    in intId int
)
begin
        
    update voterClearances
    set statId = 0
    where voterClearanceId = intId;
    
end;