drop procedure if exists GetCandidateClearances;
delimiter $$;

create procedure GetCandidateClearances(
    in intPositionId int,
    in strPosition varchar(100),
    in intGradeId int,
    in strGrade varchar(100)
)
begin
    select
        ifnull(a.candidateClearanceId, 0) AS CandidateClearanceId,
        ifnull(a.positionId, 0) AS PositionId,
        ifnull(b.title, '') AS PositionName,
        ifnull(a.gradeId, 0) AS GradeId,
        ifnull(c.title, '') AS GradeName,
        ifnull(a.Active, 0) AS Active
    from candidateClearances a
        left join positions b on a.positionId = b.positionId
        left join grades c on a.gradeId = c.gradeId
    where (a.positionId = intPositionId or intPositionId = 0)    
    and (b.title like concat('%', strPosition, '%') or strPosition = '')
    and b.statId = 1
    and (a.gradeId = intGradeId or intGradeId = 0)
    and (c.title like concat('%', strGrade, '%') or strGrade = '')
    and c.statId = 1;
end;
    
