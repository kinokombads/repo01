drop procedure if exists AddCastedVote;
delimiter $$;

create procedure AddCastedVote(
    in intVotingSessionId int,
    in intStudentId int,
    in intCandidateId int,
    out itExists int
)
begin
    select count(castedVoteId)
    into itExists
    from castedVotes
    where studentId = intStudentId
    and candidateId = intCandidateId 
    and statId = 1;

    if(itExists = 0) then
        insert into castedVotes(
            votingSessionId,
            studentId,
            candidateId,
            statId
        )
        values(
            intVotingSessionId,
            intStudentId,
            intCandidateId,
            1
        );
    end if;
end;