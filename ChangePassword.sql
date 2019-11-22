drop procedure if exists ChangePassword;
delimiter $$;

create procedure ChangePassword(
    in strUserName varchar(100),    
    in strPassword varchar(100),
    out itExists int
)
begin 

    update users
    set password = strPassword            
    where userName = strUserName;
    
end;