drop procedure if exists AddCandidate;
delimiter $$;

create procedure AddCandidate(
    in intStudentId int,
    in intPictureId int,
    in intSchoolYearId int,
    in intPositionId int,
    in intCampaignGroupId int,
    in strPropaganda varchar(1000),
    in intCreatedById int,
    out itExists int
)
begin
    select count(candidateId)
    into itExists
    from candidates
    where studentId = intStudentId and
        schoolYearId = intSchoolYearId and
        statId = 1;

    if(itExists = 0) then
        insert into candidates(
            studentId,
            pictureId,
            schoolYearId,
            positionId,
            campaignGroupId,
            propaganda,
            statId,
            createdById,
            createdOn
        )
        values(
            intStudentId,
            intPictureId,
            intSchoolYearId,
            intPositionId,
            intCampaignGroupId,
            strPropaganda,
            1,
            intCreatedById,
            now()
        );
    end if;
end;
