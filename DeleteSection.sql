drop procedure if exists DeleteSection;
delimiter $$;

create procedure DeleteSection(
    in intSectionId int
)
begin
        
    update sections
    set statId = 0
    where sectionId = intSectionId;
    
end;