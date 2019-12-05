drop procedure if exists ActiveVotingSession;
delimiter $$;

create procedure ActiveVotingSession(
    in intVotingSessionId int,
    in intStartedById int,
    out itExists int
)
begin
    
    select count(votingSessionId)
    into itExists
    from votingSessions
    where active = 1;

    if(itExists = 0) then
        update votingSessions
        set active = 1,
            startedById = intModifiedById,
            startedOn = now()
        where votingSessionId = intVotingSessionId
        and active = 0;
    end if;

end;