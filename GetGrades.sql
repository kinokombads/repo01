drop procedure if exists GetGrades;
delimiter $$;

create procedure GetGrades(
    in intId int,
    in strTitle varchar(100)    
)
begin
    select 
        ifnull(a.gradeId, 0) as GradeId,
        ifnull(a.title, '') as Title,
        ifnull(a.details, '') as Details,
        ifnull(a.statId, 0) as StatId,
        ifnull(a.createdById, 0) as CreatedById,
        concat(b.lastname, ', ', b.firstname) as CreatedByName,
        ifnull(a.createdOn, null) as CreatedOn,
        ifnull(a.modifiedById, 0) as ModifiedById,
        concat(c.lastname, ', ', c.firstname) as ModifiedByName,
        ifnull(a.modifiedOn, null) as ModifiedOn
    from grades a
        left join users b on a.createdById = b.userId
        left join users c on a.modifiedById = c.userId
    where (a.gradeId = intId or intId = 0)
    and (a.title like concat('%', strTitle, '%') or strTitle = '')
    and a.statId = 1
    order by a.title;
end;
