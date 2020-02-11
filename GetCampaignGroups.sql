drop procedure if exists GetCampaignGroups;
delimiter $$;

create procedure GetCampaignGroups(
    in intId int,
    in strTitle varchar(100),
    in intSchoolYearId int
)
begin
    select 
        ifnull(a.CampaignGroupId, 0) as CampaignGroupId,
        ifnull(a.Title, '') as Title,
        ifnull(a.Details, '') as Details,
        ifnull(a.SchoolYearId, 0) as SchoolYearId,
        ifnull(b.Title, '') as SchoolYearName,
        ifnull(a.CreatedById, 0) as CreatedById,
        concat(c.LastName, ', ', c.FirstName) as CreatedByName,
        a.CreatedOn as CreatedOn,
        ifnull(a.ModifiedById, 0) as ModifiedById,
        concat(d.LastName, ',', d.FirstName) as ModifiedByName,
        a.ModifiedOn as ModifiedOn
    from campaignGroups a

    left join schoolYears b on a.SchoolYearId = b.SchoolYearId
    left join users c on a.CreatedById = c.UserId
    left join users d on a.ModifiedById = d.UserId

    where (a.CampaignGroupId = intId or intId = 0)
    and (a.Title like concat('%', strTitle, '%') or strLastName = '')
    and (a.SchoolYearId = intSchoolYearId or intSchoolYearId = 0)
    and a.StatId = 1;
end;