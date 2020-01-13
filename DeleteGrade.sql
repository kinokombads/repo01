drop procedure if exists DeleteGrade;
delimiter $$;

create procedure DeleteGrade(
    in intGradeId int
)
begin
        
    update grades
    set statId = 0
    where gradeId = intGradeId;
    
end;