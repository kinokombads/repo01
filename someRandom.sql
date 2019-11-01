/*how to check the select count query*/

SET @itExists;
SELECT COUNT(*) FROM grades WHERE statId = 1 INTO @itExists;
SELECT @itExists AS cnt;
    
-- how to call stored procedure with out parameter

SET @oo = 0;
CALL addgrade('grade 7','adskahhf', 1, @oo);