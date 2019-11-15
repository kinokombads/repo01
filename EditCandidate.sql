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

    select count(candidateId) 
    into itExists 
    from candidates
    where candidateId <> intCandidateId
    and studentId = intStudentId
    and schoolYearId = intSchoolYearId
    and statId = 1;
    
    if(itExists = 0) then
        update grades
        set title = strTitle,
            details = strDetails,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where gradeId = intGradeId 
        and statId = 1;
    end if;
end;