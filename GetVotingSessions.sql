drop procedure if exists GetVotingSessions;
delimiter $$;

create procedure GetVotingSessions(
    in intVotingSessionId int,
    in strSchoolYear varchar(100),
    in boolActive tinyint
)
begin

    select
        ifnull(a.votingSessionId, 0) as VotingSessionId,
        ifnull(a.schoolYearId, 0) as SchoolYearId,
        ifnull(b.title, '') as SchoolYearName,
        ifnull(a.active, 0) as Active
    from votingsessions a
        left join schoolyears b on a.schoolYearId = b.schoolYearId
    where 

end;