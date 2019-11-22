drop procedure if exists EditSchoolYear;
delimiter $$;

create procedure EditSchoolYear(
    in intSchoolYearId int,
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in boolActive boolean,
    in intModifiedById int,
    out itExists int
)
begin

    select count(schoolYearId)
    into itExists
    from schoolYears
    where schoolYearId <> intSchoolYearId
    and title = strTitle
    and statId = 1;

    if(itExists = 0) then
        update schoolYears
        set title = strTitle,
            details = strDetails,
            active = boolActive,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where schoolYearId = intSchoolYearId;
    end if;

end;