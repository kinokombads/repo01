drop procedure if exists AddCandidateClearance;
delimiter $$; 

create procedure AddCandidateClearance(
    in intPositionId int,
    in intGradeId int,
    out itExists int
)
begin

    select count(candidateClearanceId) 
    into itExists 
    from candidateClearances
    where positionId = intPositionId 
    and gradeId = intGradeId;
    
    if(itExists = 0) then
        insert into candidateClearances(
            positionId,
            gradeId
        )
        values(
            intPositionId,
            intGradeId
        );

    end if;

end;