drop procedure if exists GetVoterClearances;
delimiter $$;

create procedure GetVoterClearances(
    in intId int,
    in strPosition varchar(100),
    in strGrade varchar(100)
)
begin

    select
        ifnull(a.voterClearanceId, 0) as VoterClearanceId,
        ifnull(a.positionId, 0) as PositionId,
        ifnull(b.title, '') as PositionName,        
        ifnull(a.gradeId, 0) as GradeId,
        ifnull(c.title, '') as GradeName,
        ifnull(a.Active, 0) as Active
    from voterclearances a
        left join positions b on a.positionId = b.positionId
        left join grades c on a.GradeId = c.gradeId
    where (a.voterClearanceId = intId or intId = 0)
    and (b.title like concat('%', strPosition, '%') or strPosition = '')
    and (c.title like concat('%', strGrade, '%') or strGrade = '')
    and a.statId = 1;
    
end;