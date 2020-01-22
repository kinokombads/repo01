drop procedure if exists DeleteGrade;
delimiter $$;

create procedure DeleteGrade(
    in intId int
)
begin
        
    update grades
    set statId = 0
    where gradeId = intId;
    
end;