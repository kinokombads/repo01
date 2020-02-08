DROP PROCEDURE IF EXISTS GetCandidateClearances;
DELIMITER $$;

CREATE PROCEDURE GetCandidateClearances(
    -- IN intId INT,
    IN strPosition VARCHAR(100),
    IN strGrade VARCHAR(100)
)
BEGIN

    SELECT
        IFNULL(a.candidateClearanceId, 0) AS CandidateClearanceId,
        IFNULL(a.positionId, 0) AS PositionId,
        IFNULL(b.title, '') AS PositionName,
        IFNULL(a.gradeId, 0) AS GradeId,
        IFNULL(c.title, '') AS GradeName,
        IFNULL(a.Active, 0) AS Active
    FROM candidateclearances a
        LEFT JOIN positions b ON a.positionId = b.positionId
        LEFT JOIN grades c ON a.GradeId = c.gradeId
    WHERE 
    -- (a.candidateClearanceId = intId OR intId = 0) AND
     (b.title LIKE CONCAT('%', strPosition, '%') OR strPosition = '')
    AND (c.title LIKE CONCAT('%', strGrade, '%') OR strGrade = '');
    
END;