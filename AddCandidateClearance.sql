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
    and gradeId = intGradeId
    and statId = 1;
    
    if(itExists = 0) then
        insert into candidateClearances(
            title,
            details,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            1,
            intCreatedById,
            now()
        );
    end if;

end;