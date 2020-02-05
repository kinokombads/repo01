drop procedure if exists EditVoterClearance;
delimiter $$;

create procedure EditVoterClearance(
    in intPositionId int,
    in intGradeId int,   
    in boolActive boolean,
    out itExists int
)
begin

    select count(voterClearanceId)
    into itExists
    from voterClearances
    where positionId = intPositionId
    and gradeId = intGradeId
    and active = boolActive;
    
    if(itExists = 0) then
        update voterClearances
        set active = boolActive
        where positionId = intPositionId
        and gradeId = intGradeId
        and active = boolActive;
    end if;

end;