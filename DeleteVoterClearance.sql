drop procedure if exists DeleteVoterClearance;
delimiter $$;

create procedure DeleteVoterClearance(
    in intId int
)
begin
        
    delete from voterClearances
    where voterClearanceId = intId;
    
end;