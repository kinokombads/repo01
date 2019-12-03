drop procedure if exists GetStudents;
delimiter $$;

create procedure GetStudents(
    in intStudentId int,
    in strLrn varchar(100),
    in strLastName varchar(100),
    in strFirstName varchar(100),
    in strMiddleName varchar(100),
    in strSectionName varchar(100),
    in strGradeName varchar(100),
    in strCurrentGradeAndSection varchar(100)
)
begin
    select
        ifnull(a.studentId, 0) as StudentId,
        ifnull(a.lrn, '') as Lrn,
        ifnull(a.lastname, '') as LastName,
        ifnull(a.firstname, '') as FirstName,
        ifnull(a.middlename, '') as MiddleName,
        ifnull(a.gradeansectionId, 0) as GradeAndSectionId,
        ifnull(a.currentgradeandsection) as CurrentGradeAndSection,
        ifnull()
    from students a
        left join 
    where
    order by
end;