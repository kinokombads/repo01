drop procedure if exists AddWinner;
delimiter $$;

create procedure AddWinner(
    in intVotingSessionId int,
    in intSchoolYearId int,
    in intCandidateId int,
    in intTotalVotes int
)
begin    
    
    insert into winners(
        votingSessionId,
        schoolYearId,
        candidateId,
        totalVotes,
        statId
    )
    values(
        intVotingSessionId,
        intSchoolYearId,
        intCandidateId,
        intTotalVotes,
        1
    );
    
end;