drop procedure if exists EditStudent;
delimiter $$;

create procedure EditStudent(
    in intStudentId int,
    in strLrn varchar(100),
    in strLastName varchar(100),
    in strFirstName varchar(100),
    in strMiddleName varchar(100),
    in intGradeAndSectionId int,
    in strCurrentSectionName varchar(100),
    in intSchoolYearId int,
    out itExists int
)
begin

    select count(studentId)
    into itExists
    from students
    where lrn = strLrn
    and statId = 1;

    if(itExists = 0) then
        update students
        set lrn = strLrn,
            lastName = strLrn,
            firstName = strFirstName,
            middleName = strMiddleName,
            gradeAndSectionId = intGradeAndSectionId,
            currentSectionName = strCurrentSectionName,
            schoolYearId = intSchoolYearId
        where studentId = intStudentId;
    end if;

end;