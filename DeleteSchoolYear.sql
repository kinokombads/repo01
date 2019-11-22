drop procedure if exists DeleteSchoolYear;
delimiter $$;

create procedure DeleteSchoolYear(
    in intSchoolYear int
)
begin
        
    update schoolYears
    set statId = 0
    where schoolYearId = intSchoolYear;
    
end;