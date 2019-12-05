drop procedure if exists DeactivateVotingSession;
delimiter $$;

create procedure DeactivateVotingSession(
    in intVotingSessionId int,
    in intStoppedById int,
    out itExists int
)
begin
    
    select count(votingSessionId)
    into itExists
    from votingSessions
    where active = 1;

    if(itExists = 1) then
        update votingSessions
        set active = 0,
            stoppedById = intStoppedById,
            startedOn = now()
        where votingSessionId = intVotingSessionId
        and active = 1;
    end if;

end;