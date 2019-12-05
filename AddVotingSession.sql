drop if procedure exists AddVotingSession;
delimiter $$;

create procedure AddVotingSession(
    in intSchoolYearId int,
    in intUserId int,
    out itExists int
)
begin
    select count(votingSessionId)
    into itExists
    from votingSessions
    where schoolYearId = intSchoolYearId
    and statId = 1;

    if(itExists = 0) then
        insert into votingSessions(
            schoolYearId,
            active,
            statId,
            createdById,
            createdOn
        )
        value(
            intSchoolYearId,
            1,
            1,
            intUserId,
            now()
        );
    end if;
end;