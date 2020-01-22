drop procedure if exists EditGradeAndSection;
delimiter $$;

create procedure EditGradeAndSection(
    in intId int,
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
        and statId = 1
        and gradeAndSectionId != intId;
    
    if(itExists = 0) then
        update gradeAndSections
        set title = strTitle,
            gradeId = intGradeId,
            sectionId = intSectionId,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where (gradeAndSectionId = intId or intId = 0) and
            statId = 1;
    end if;

end;