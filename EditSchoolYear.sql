drop procedure if exists EditSchoolYear;
delimiter $$;

create procedure EditSchoolYear(
    in intId int,
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
    where schoolYearId <> intId
    and title = strTitle
    and statId = 1;

    if(itExists = 0) then

        if(boolActive = 1) then
            update schoolYears 
            set active = 0
            where active = 1
            and schoolYearId <> intId
            and statId = 1;
        end if;

        update schoolYears
        set title = strTitle,
            details = strDetails,
            active = boolActive,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where schoolYearId = intId;
    end if;

end;