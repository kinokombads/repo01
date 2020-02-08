drop procedure if exists EditVoterClearance;
delimiter $$;

create procedure EditVoterClearance(
    in intId int,
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
    and voterClearanceId <> intId;
       
    if(itExists = 0) then
        update voterClearances
        set active = boolActive
        where voterClearanceId = intId;
    end if;

end;