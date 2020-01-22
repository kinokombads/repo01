drop procedure if exists DeleteSchoolYear;
delimiter $$;

create procedure DeleteSchoolYear(
    in intId int
)
begin
        
    update schoolYears
    set statId = 0
    where schoolYearId = intId;
    
end;