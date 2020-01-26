drop procedure if exists EditVoterClearance;
delimiter $$;

create procedure EditVoterClearance(
    in intId int,
    in intPositionId int,
    in intGradeIsd int,
    out itExists int
)
begin

    select count(voterClearanceId)
    into itExists
    from voterClearances
    where positionId = intPositionId
    and gradeId = intGradeId
    and statId = 1;

    if(itExists = 0) then
        update voterClearances
        set positionId = intPositionId,
            gradeId = intGradeId
        where voterClearanceId = intId;
    end if;

end;