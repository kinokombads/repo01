drop procedure if exists GetSchoolYears;
delimiter $$;

create procedure GetSchoolYears(
    in intId int,
    in strTitle varchar(100),
    in boolActive boolean

)
begin
    select 
        ifnull(a.schoolYearId, 0) as SchoolYearId,
        ifnull(a.title, '') as Title,
        ifnull(a.details, '') as Details,
        ifnull(a.active, 0) as Active,
        ifnull(a.statId, 0) as StatId,
        ifnull(a.createdById, 0) as CreatedById,
        concat(b.lastname, ', ', b.firstname) as CreatedByName,
        ifnull(a.createdOn, null) as CreatedOn,
        ifnull(a.modifiedById, 0) as ModifiedById,
        concat(c.lastname, ', ', c.firstname) as ModifiedByName,
        ifnull(a.modifiedOn, null) as ModifiedOn
    from schoolyears a
        left join users b on a.createdById = b.userId
        left join users c on a.modifiedById = c.userId
    where (a.schoolYearId = intId or intId = 0)
    and (a.title like concat('%', strTitle, '%') or strTitle = '')
    and (a.active = boolActive or boolActive = 0)
    and a.statId = 1
    order by a.title;
end;
