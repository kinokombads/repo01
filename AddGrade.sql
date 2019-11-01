drop procedure if exists AddGrade;
delimiter $$;

create procedure AddGrade(
    in strTitle varchar(100),
    out itExists int
)
begin

    select count(GradeId) into itExists
    from grades
    where Title = strTitle and StatId = 1;

    if(itExists = 0) then
        insert into grades(
            Title,
            StatId
        )
        values(
            strTitle,
            1
        );
    end if;

end;