drop if procedure exists AddVotingSession;
delimiter $$;

create procedure AddVotingSession(
    in intSchoolYearId int,
    out itExists int
)
begin
    select count(votingSessionId)
    into itExists
    from votingSessions
    where schoolYearId = intSchoolYearId AddVotingSession
        statId = 1;

    if(itExists = 0) then
        insert into votingSessions(
            schoolYearId,
            active,
            statId
        )
        value(
            intSchoolYearId,
            1,
            1
        );
    end if;
end;