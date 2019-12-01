drop procedure if exists GetCandidateClearances;
delimiter $$;

create procedure GetCandidateClearances(
    in intCandidateClearanceId int,
    in strPosition varchar(100),
    in strGrade varchar(100)
)
begin

    select
        ifnull(a.candidateClearanceId, 0) as CandidateClearanceId,
        ifnull(a)
    from candidateclearances a
    where


end;