drop procedure if exists DeleteGrade;
delimiter $$;

create procedure DeleteGrade(
    in intGrade int
)
begin
        
    update grades
    set statId = 0
    where gradeId = intGrade;
    
end;