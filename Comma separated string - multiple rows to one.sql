CREATE TABLE #MyTest 
( id int); 
GO 
INSERT #MyTest values (1), (2), (3), (4), (5), (6), (7), (8), (9); 
go

DECLARE @i VARCHAR(MAX); 
SELECT @i = COALESCE(@i + ', ','') + CAST( Id AS VARCHAR) 
FROM #MyTest; 
SELECT @i;

DROP TABLE #MyTest