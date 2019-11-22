drop procedure if exists DeleteStudent;
delimiter $$;

create procedure Delete4Student(
    in intStudentId int
)
begin
        
    update students
    set statId = 0
    where studentId = intStudentId;
    
end;