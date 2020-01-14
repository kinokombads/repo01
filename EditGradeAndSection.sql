drop procedure if exists EditGradeAndSection;
delimiter $$;

create procedure EditGradeAndSection(
    in intGradeAndSectionId int,
    in strTitle varchar(100),
    in intGradeId int,
    in intSectionId int,    
    in intModifiedById int,
    out itExists int
)
begin

    select count(gradeAndSectionId) 
    into itExists 
    from gradeAndSections
    where gradeId = intGradeId
        and sectionId = intSectionId
        and statId = 1;
    
    if(itExists = 0) then
        update gradeAndSections
        set title = strTitle,
            gradeId = intGradeId,
            sectionId = intSectionId,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where (gradeAndSectionId = intGradeAndSectionId or intGradeAndSectionId = 0) and
            statId = 1;
    end if;

end;