drop procedure if exists DeleteCampaignGroup;
delimiter $$;

create procedure DeleteCampaignGroup(
    in intCampaignGroupId int
)
begin
        
    update campaignGroups
    set statId = 0
    where campaignGroupId = intCampaignGroupId;
    
end;