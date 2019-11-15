drop procedure if exists AddUser;
delimiter $$;

create procedure AddUser(
    in strUserName varchar(100),
    in strPassword varchar(1000),
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
    where userName = strUserName 
    and statId = 1;
    
    if(itExists = 0) then
        insert into users(
            userName,
            password,
            lastName,
            firstName,
            middleName,
            userLevelId,
            statId
        )
        values(
            strUserName,
            strPassword,
            strLastName,
            strFirstName,
            strMiddleName,
            intUserLevelId,
            1
        );
    end if;

end;