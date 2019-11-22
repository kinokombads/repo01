drop procedure if exists DeleteCandidate;
delimiter $$;

create procedure DeleteCandidate(
    in intCandidateId int
)
begin
        
    update candidates
    set statId = 0
    where candidateId = intCandidateId;
    
end;