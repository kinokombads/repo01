drop procedure if exists ChangePasswordUser;
delimiter $$;

create procedure ChangePasswordUser(
    in strUserName varchar(100),    
    in strPassword varchar(100),
    out itExists int
)
begin 

    update users
    set password = strPassword            
    where userName = strUserName;
    
end;