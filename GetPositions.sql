drop procedure if exists GetPositions;
delimiter $$;

create procedure GetPositions(
    in intId int,
    in strTitle varchar(100),
	in strPositionType varchar(100)
)
begin
    select 
        ifnull(a.positionId, 0) as PositionId,
        ifnull(a.title, '') as Title,		
		ifnull(a.positionType, '') as PositionType,
        ifnull(a.details, '') as Details,
        ifnull(a.statId, 0) as StatId,
        ifnull(a.createdById, 0) as CreatedById,
        concat(b.lastname, ', ', b.firstname) as CreatedByName,
        ifnull(a.createdOn, null) as CreatedOn,
        ifnull(a.modifiedById, 0) as ModifiedById,
        concat(c.lastname, ', ', c.firstname) as ModifiedByName,
        ifnull(a.modifiedOn, null) as modifiedOn
    from positions a
        left join users b on a.createdById = b.userId
        left join users c on a.modifiedById = c.userId
    where (a.positionId = intId or intId = 0)
    and (a.title like concat('%', strTitle, '%') or strTitle = '')
    and (a.positionType like concat('%', strPositionType, '%') or strPositionType = '')
    and a.statId = 1
    order by a.title;
end;