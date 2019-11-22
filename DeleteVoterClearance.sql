drop procedure if exists DeleteVoterClearance;
delimiter $$;

create procedure DeleteVoterClearance(
    in intVoterClearanceId int
)
begin
        
    update voterClearances
    set statId = 0
    where voterClearanceId = intVoterClearanceId;
    
end;