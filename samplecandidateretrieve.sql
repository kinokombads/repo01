SELECT
  `candidateId`,  
  a.`studentId`,
  CONCAT(b.LastName, ', ' , b.FirstName) AS StudentName,
  `schoolYearId`,
  `positionId`,
  `campaignGroupId`,
  `propaganda`,
  a.`statId`,
  a.`createdById`,
  a.`createdOn`,
  a.`modifiedById`,
  a.`modifiedOn`
FROM `campusvotingdb`.`candidates` a
LEFT JOIN students  b ON a.`studentId` = b.`studentId`
WHERE b.`lastName` = 'cruz'
and a.schoolYearId = 1
and a.statId = 1
;