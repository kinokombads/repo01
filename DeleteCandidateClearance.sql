drop procedure if exists DeleteCandidateClearance;
delimiter $$;

create procedure DeleteCandidateClearance(
    in intId int
)
begin
        
    delete from candidateClearances    
    where candidateClearanceId = intId;
    
end;