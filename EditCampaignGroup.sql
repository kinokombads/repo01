drop procedure if exists EditCampaignGroup;
delimiter $$;

create procedure EditCampaignGroup(
    in intCampaignGroupId int,
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intSchoolYearId int,
    in intModifiedById int,
    out itExists int
)
begin
    select count(campaignGroupId)
    into itExists
    from campaignGroups
    where campaignGroupId <> intCampaignGroupId 
    and title = strTitle 
    and statId = 1;

    if(itExists = 0) then
        update campaignGroups
        set title = strTitle,
            details = strDetails,
            schoolYearId = intSchoolYearId,
            modifiedById = intModifiedById
        where campaignGroupId = intCampaignGroupId 
        and statId = 1;
    end if;
end;