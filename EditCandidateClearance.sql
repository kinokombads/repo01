drop procedure if exists EditCandidateClearance;
delimiter $$;

create procedure EditCandidateClearance(
    in intPositionId int,
    in intGradeId int,   
    in boolActive boolean,
    out itExists int
)
begin

    select count(candidateClearanceId)
    into itExists
    from candidateClearances
    where positionId = intPositionId
    and gradeId = intGradeId
    and active = boolActive;
    
    if(itExists = 0) then
        update candidateClearances
        set active = boolActive
        where candidateClearanceId = intId;
    end if;

end;