drop procedure if exists DeleteSection;
delimiter $$;

create procedure DeleteSection(
    in intId int
)
begin
        
    update sections
    set statId = 0
    where sectionId = intId;
    
end;