drop procedure if exists DeleteUser;
delimiter $$;

create procedure DeleteUser(
    in intUserId int
)
begin
        
    update users
    set statId = 0
    where userId = intUserId;
    
end;