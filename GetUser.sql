drop procedure if exists GetUser;
delimiter $$;

create procedure GetUser(
    in strUserName varchar(100),
    in strPassword varchar(100)
)
begin

    select
        ifnull(a.userName, 0) as userName
        ifnull(a.lastName, '') as LastName,        
        ifnull(a.firstName, '') as FirstName,
        ifnull(a.middleName, 0) as MiddleName,
        ifnull(a.userLevelId, 0) as UserLevelId
    from users a
    where (a.userName = strUserName)
    and (a.password = strPassword)
    and statId = 1;

end;