drop procedure if exists ToggleActiveSchoolYear;
delimiter $$;

create procedure ToggleActiveSchoolYear(
    in intSchoolYearId int,    
    in boolActive boolean,
    in intModifiedById int,
    out itExists int
)
begin

    -- check and retrieve the active school year
    -- if school year id of current active is not the same to the param
        -- deactivate the current active school year
    -- if it is the same
        -- just perform the sql
        
    update schoolYears
    set active = boolActive, 
        modifiedById = intModifiedById,
        modifiedOn = now()
    where schoolYearId = intSchoolYearId;

end;