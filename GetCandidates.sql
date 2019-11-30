drop procedure if exists GetCandidates;
delimiter $$;

create procedure GetCandidates(
    in intCandidateId int,
    in strLrn varchar(100),
    in strLastName varchar(100),
    in strFirstName varchar(100),
    in strMiddleName varchar(100),
    in strSchoolYear varchar(100),
    in strPosition varchar(100),
    in strCampaignGroup varchar(100)
)
begin
    select 
        ifnull(a.candidateId, 0) as CandidateId,
        ifnull(a.studentId, 0) as StudentId,
        ifnull(b.lrn, '') as Lrn,
        ifnull(b.lastName, '') as LastName,
        ifnull(b.firstName, '') as FirstName,
        ifnull(b.middleName, '') as MiddleName,
        ifnull(c.schoolYearId, 0) as SchoolYearId,
        ifnull(c.title, '') as SchoolYearName,
        ifnull(d.positionId, 0) as PositionId,
        ifnull(d.title, '') as PositionName,
        ifnull(e.campaignGroupId, 0) as CampaignGroupId,
        ifnull(e.title, '') as CampaignGroupName,
        ifnull(a.propaganda, '') as Propaganda
    from candidates a
        left join students b on a.studentId = b.studentId
        left join schoolyears c on a.schoolYearId = c.schoolYearId
        left join positions d on a.positionId = d.positionId
        left join campaignGroups e on a.campaignGroupId = e.campaignGroupId
    where (a.candidateId = intCandidateId or intCandidateId = 0)
    and (b.lrn like concat('%', strLrn, '%') or strLrn = '')
    and (b.lastName like concat('%', strLastName, '%') or strLastName = '')
    and (b.firstName like concat('%', strFirstName, '%') or strFirstName = '')
    and (b.middleName like concat('%', strMiddleName, '%') or strMiddleName = '')
    and (c.title like concat('%', strSchoolYear, '%') or strSchoolYear = '')
    and (d.title like concat('%', strPosition, '%') or strPosition = '')
    and (e.title like concat('%', strCampaignGroup, '%') or strCampaignGroup = '')
    and a.statId = 1;
end;