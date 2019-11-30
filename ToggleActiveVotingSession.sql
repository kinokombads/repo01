drop procedure if exists ToggleActiveVotingSession;
delimiter $$;

create procedure ToggleActiveVotingSession(
    in intVotingSessionId int,    
    in boolActive boolean,
    in intModifiedById int,
    out itExists int
)
begin
    
    update votingSessions
    set active = boolActive,
        modifiedById = intModifiedById,
        modifiedOn = now()
    where votingSessionId = intVotingSessionId;

end;