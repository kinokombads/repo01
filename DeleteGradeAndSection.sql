drop procedure if exists DeleteGradeAndSection;
delimiter $$;

create procedure DeleteGradeAndSection(
    in intGradeAndSectionId int    
)
begin

    if(itExists = 0) then
        update gradeAndSections
        set statId = 0            
        where (gradeAndSectionId = intGradeAndSectionId or intGradeAndSectionId = 0) and
            statId = 1;
    end if;

end;