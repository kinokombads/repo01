drop procedure if exists GetGradeAndSections;
delimiter $$;

create procedure GetGradeAndSections(
    in intGradeAndSectionId int,
    in strTitle varchar(100),
    in strGrade varchar(100),
    in strSection varchar(100)      
)
begin
    select 
        ifnull(a.gradeAndSectionId, 0) as GradeAndSectionId,
        ifnull(a.title, '') as Title,
        ifnull(a.gradeId, 0) as GradeId,
        concat(d.title, '') as GradeName,
        ifnull(a.sectionId, 0) as SectionId,
        concat(e.title, '') as SectionName,
        ifnull(a.statId, 0) as StatId,
        ifnull(a.createdById, 0) as CreatedById,
        concat(b.lastname, ', ', b.firstname) as CreatedByName,
        ifnull(a.createdOn, null) as CreatedOn,
        ifnull(a.modifiedById, 0) as ModifiedById,
        concat(c.lastname, ', ', c.firstname) as ModifiedByName,
        ifnull(a.modifiedOn, null) as ModifiedOn
    from gradeAndSections a
        left join users b on a.createdById = b.userId
        left join users c on a.modifiedById = c.userId
        left join grades d on a.gradeId = d.gradeId
        left join sections e on a.sectionId = e.sectionId
    where (a.gradeAndSectionId = intGradeAndSectionId or intGradeAndSectionId = 0)
    and (a.title like concat('%', strTitle, '%') or strTitle = '')
    and (d.title like concat('%', strGrade, '%') or strGrade = '')
    and (e.title like concat('%', strSection, '%') or strSection = '')
    and a.statId = 1
    order by a.gradeId desc, a.sectionId desc;    
end;
