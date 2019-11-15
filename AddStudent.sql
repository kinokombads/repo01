drop procedure if exists AddStudent;
delimiter $$;

create procedure AddStudent(
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
        insert into students(
            lrn,
            lastName,
            firstName,
            middleName,
            gradeAndSectionId,
            currentSectionName,
            schoolYearId,
            statId
        )
        values(
            strLrn,
            strLastName,
            strFirstName,
            strMiddleName,
            intGradeAndSectionId,
            strCurrentSectionName,
            intSchoolYearId,
            1
        );
    end if;

end;