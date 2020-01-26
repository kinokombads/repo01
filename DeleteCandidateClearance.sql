drop procedure if exists DeleteCandidateClearance;
delimiter $$;

create procedure DeleteCandidateClearance(
    in intId int
)
begin
        
    update candidateClearances
    set statId = 0
    where candidateClearanceId = intId;
    
end;