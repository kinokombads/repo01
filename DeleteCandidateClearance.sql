drop procedure if exists DeleteCandidateClearance;
delimiter $$;

create procedure DeleteCandidateClearance(
    in intCandidateClearanceId int
)
begin
        
    update candidateClearances
    set statId = 0
    where candidateClearanceId = intCandidateClearanceId;
    
end;