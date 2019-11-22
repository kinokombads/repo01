drop procedure if exists ChangePasswordStudent;
delimiter $$;

create procedure ChangePasswordStudent(
    in strLrn varchar(100),    
    in strPassword varchar(100),
    out itExists int
)
begin 

    update students
    set password = strPassword            
    where lrn = strLrn;
    
end;