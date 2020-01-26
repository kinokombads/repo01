drop procedure if exists GetCandidateClearances;
delimiter $$;

create procedure GetCandidateClearances(
    in intId int,
    in strPosition varchar(100),
    in strGrade varchar(100)
)
begin

    select
        ifnull(a.candidateClearanceId, 0) as CandidateClearanceId,
        ifnull(a.positionId, 0) as PositionId,
        ifnull(b.title, '') as PositionName,
        ifnull(a.gradeId, 0) as GradeId,
        ifnull(c.title, '') as GradeName
    from candidateclearances a
        left join positions b on a.positionId = b.positionId
        left join grades c on a.GradeId = c.gradeId
    where (a.candidateClearanceId = intId or intId = 0)
    and (b.title like concat('%', strPosition, '%') or strPosition = '')
    and (c.title like concat('%', strGrade, '%') or strGrade = '')
    and a.statId = 1;
    
end;