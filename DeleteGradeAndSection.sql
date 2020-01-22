drop procedure if exists DeleteGradeAndSection;
delimiter $$;

create procedure DeleteGradeAndSection(
    in intId int    
)
begin
    
    update gradeAndSections
    set statId = 0            
    where (gradeAndSectionId = intId or intId = 0) and
        statId = 1;   

end;