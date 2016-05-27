

declare @table nvarchar(20)
declare @idcol nvarchar(50)
declare @sql nvarchar(max)

--initialize those two values
set @table = 'ActionNotepad'
set @idcol = 'Import_Id'

set @sql = 'select ' + @idcol +' , (0'

select @sql = @sql + ' + isnull(datalength(' + name + '), 1)' 
        from sys.columns where object_id = object_id(@table)
set @sql = @sql + ') as rowsize from ' + @table + ' order by rowsize desc'

PRINT @sql

exec (@sql)


select NotesID , (0 + isnull(datalength(NotesID), 1) + isnull(datalength(NoteTypeId), 1) + isnull(datalength(NotepadDate), 1) + isnull(datalength(Title), 1) + isnull(datalength(Description), 1) + isnull(datalength(Author), 1) + isnull(datalength(Notes), 1) + isnull(datalength(ActualNotes), 1) + isnull(datalength(Sequence), 1) + isnull(datalength(ParentId), 1) + isnull(datalength(Import_Id), 1) + isnull(datalength(DateAdded), 1) + isnull(datalength(AddedById), 1) + isnull(datalength(DateChanged), 1) + isnull(datalength(LastChangedById), 1)) as rowsize 
from ActionNotepad 
WHERE NotesID IN (57070,221695,265753,304976,366140,370439,375335,663071)
order by rowsize desc
--118491

SELECT *, (0 + isnull(datalength(NotesID), 1) + isnull(datalength(NoteTypeId), 1) + isnull(datalength(NotepadDate), 1) + isnull(datalength(Title), 1) + isnull(datalength(Description), 1) + isnull(datalength(Author), 1) + isnull(datalength(Notes), 1) + isnull(datalength(ActualNotes), 1) + isnull(datalength(Sequence), 1) + isnull(datalength(ParentId), 1) + isnull(datalength(Import_Id), 1) + isnull(datalength(DateAdded), 1) + isnull(datalength(AddedById), 1) + isnull(datalength(DateChanged), 1) + isnull(datalength(LastChangedById), 1)) as rowsize 

FROM ActionNotepad
WHERE Import_Id = '01334-420-0000057070'

SELECT *
FROM ActionNotepad
WHERE NotesID IN (373838,100385,100379,584344,584345,584346,584347,584348,584349,584350)

/*
57070
221695
265753
304976
366140
370439
375335
663071
*/