drop procedure if exists EditUser;
delimiter $$;

create procedure EditUser(
    in intUserId int,
    in strUserName varchar(100),
    in strLastName varchar(100),
    in strFirstName varchar(100),
    in strMiddleName varchar(100),
    in intUserLevelId int,
    out itExists int
)
begin

    select count(userId)
    into itExists
    from users
    where userId <> intUserId
    and userName = strUserName
    and statId = 1;

    if(itExists = 0) then
        update users
        set userName = strUserName,
            lastName = strLastName,
            firstName = strFirstName,
            middleName = strMiddleName,
            userLevelId = intUserLevelId
        where userId = intUserId;
    end if;

end;