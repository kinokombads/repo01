drop procedure if exists AddVoterClearance;
delimiter $$; 

create procedure AddVoterClearance(
    in intPositionId int,
    in intGradeId int,
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
        insert into voterClearances(
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