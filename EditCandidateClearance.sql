drop procedure if exists EditCandidateClearance;
delimiter $$;

create procedure EditCandidateClearance(
    in intCandidateClearanceId int,
    in intPositionId int,
    in intGradeId int,
    out itExists int
)
begin

    select count(candidateClearanceId)
    into itExists
    from candidateClearances
    where positionId = intPositionId
    and gradeId = intGradeId
    and statId = 1;

    if(itExists = 0) then
        update candidateClearances
        set positionId = intPositionId
            gradeId = intGradeId
        where candidateClearanceId = intCandidateClearanceId;
    end if;

end;