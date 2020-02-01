drop procedure if exists AddVoterClearance;
delimiter $$; 

create procedure AddVoterClearance(
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
    and gradeId = intGradeId;
    
    if(itExists = 0) then
        insert into voterClearances(
            positionId,
            gradeId,
            active
        )
        values(
            intPositionId,
            intGradeId,
            boolActive
        );

    end if;

end;