drop procedure if exists GetStudents;
delimiter $$;

create procedure GetStudents(
    in intId int,
    in strLrn varchar(100),
    in strLastName varchar(100),
    in strFirstName varchar(100),
    in strMiddleName varchar(100),
    in strSectionName varchar(100),
    in strGradeName varchar(100),
    in intSchoolYearId int,
    in strCurrentSectionName varchar(100)
)
begin
    select
        ifnull(a.studentId, 0) as StudentId,
        ifnull(a.lrn, '') as Lrn,
        ifnull(a.lastName, '') as LastName,
        ifnull(a.firstName, '') as FirstName,
        ifnull(a.middleName, '') as MiddleName,
        ifnull(a.gradeAndSectionId, 0) as GradeAndSectionId,
        /*ifnull(a.currentSectionName, '') as CurrentSectionName,*/
        ifnull(b.title, '') as CurrentSectionName,
        ifnull(b.sectionId, 0) as SectionId,
        ifnull(c.title, '') as SectionName,
        ifnull(b.gradeId, 0) as GradeId,
        ifnull(d.title, '') as GradeName,
        ifnull(a.schoolYearId, 0) as SchoolYearId,
        ifnull(e.title, '') as SchoolYearName
    from students a
        left join gradeandsections b on a.gradeAndSectionId = b.gradeAndSectionId
        left join sections c on b.sectionId = c.sectionId
        left join grades d on b.gradeId = d.gradeId
        left join schoolyears e on a.schoolYearId = e.schoolYearId
    where (a.studentId = intId or intId = 0)
    and (a.lrn like concat('%', strLrn, '%') or strLrn = '')
    and (a.lastName like concat('%', strLastName, '%') or strLastName = '')
    and (a.firstName like concat('%', strFirstName, '%') or strFirstName = '')
    and (a.middleName like concat('%', strMiddleName, '%') or strMiddleName = '')
    and (b.title like concat('%', strCurrentSectionName, '%') or strCurrentSectionName = '')
    and (c.title like concat('%', strSectionName, '%') or strSectionName = '')
    and (d.title like concat('%', strGradeName, '%') or strGradeName = '')
    and (a.schoolYearId = intSchoolYearId or intSchoolYearId = 0)
    and a.statId = 1
    order by d.title, c.title, a.lastname, a.firstname;
end;