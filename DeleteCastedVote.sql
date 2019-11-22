drop procedure if exists DeleteCastedVote;
delimiter $$;

create procedure DeleteCastedVote(
    in intCastedVoteId int
)
begin
        
    update castedVotes
    set statId = 0
    where castedVoteId = intCastedVoteId;
    
end;