drop procedure if exists DeleteCampaignGroup;
delimiter $$;

create procedure DeleteCampaignGroup(
    in intId int
)
begin
        
    update campaignGroups
    set statId = 0
    where campaignGroupId = intId;
    
end;