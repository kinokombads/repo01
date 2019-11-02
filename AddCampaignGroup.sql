drop procedure if exists AddCampaignGroup;
delimiter $$;

create procedure AddCampaignGroup(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intSchoolYearId int,    
    in intCreatedById int,
    out itExists int
)
begin

    select count(campaignGroupId) 
    into itExists 
    from campaignGroups
    where title = strTitle and statId = 1;
    
    if(itExists = 0) then
        insert into campaignGroups(
            title,
            details,
            schoolYearId,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            intSchoolYearId,
            1,
            intCreatedById,
            now()
        );
    end if;

end;