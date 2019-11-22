drop procedure if exists EditCandidate;
delimiter $$;

create procedure EditCandidate(
    in intCandidateId int,
    in intStudentId int,
    in intPictureId int,
    in intPositionId int,
    in intCampaignGroupId int,
    in strPropaganda varchar(1000),
    in intModifiedById int,
    out itExists int
)
begin

    -- check if cg is 0 (independent)
        -- F:
            -- check position
            -- prevent same single position
            -- allow representative type position
    
    -- 
    -- check if the same student is applying to different positions
    select count(candidateId) 
    into itExists 
    from candidates
    where candidateId <> intCandidateId
    and studentId = intStudentId
    and schoolYearId = intSchoolYearId
    and statId = 1;
    
    if(itExists = 0) then
        update candidates
        set studentId = intStudentId,
            pictureId = intPictureId,            
            schoolYearId = intSchoolYearId,
            positionId = intPositionId,
            campaignGroupId = intCampaignGroupId,
            propaganda = strPropaganda,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where candidateId = intCandidateId
        and statId = 1;
    end if;
end;