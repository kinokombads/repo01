drop procedure if exists AddGradeAndSection;
delimiter $$;

create procedure AddGradeAndSection(
    in strTitle varchar(100),
    in intGradeId int,
    in intSectionId int,    
    in intCreatedById int,
    out itExists int
)
begin

    select count(sectionId) 
    into itExists 
    from sections
    where gradeId = intGradeId
        and sectionId = intSectionId
        and statId = 1;
    
    if(itExists = 0) then
        insert into gradeAndSections(
            title,
            gradeId,
            sectionId,            
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            intGradeId,
            intSectionId,            
            1,
            intCreatedById,
            now()
        );
    end if;

end;