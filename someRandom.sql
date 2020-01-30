/*how to check the select count query*/

SET @itExists;
SELECT COUNT(*) FROM grades WHERE statId = 1 INTO @itExists;
SELECT @itExists AS cnt;
    
-- how to call stored procedure with out parameter

SET @oo = 0;
CALL addgrade('grade 7','adskahhf', 1, @oo);

CALL addschoolyear('2003-2004', 'year 2003', 1, 1, @oo);

CALL getschoolyears(0, '', 1);