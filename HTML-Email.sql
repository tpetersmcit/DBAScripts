DECLARE @bodyMsg nvarchar(max)
DECLARE @subject nvarchar(max)
DECLARE @tableHTML nvarchar(max)
DECLARE @Table NVARCHAR(MAX) = N''

SET @subject = 'New Navigator Office Codes'

SELECT @Table = @Table + '<tr>' + --'<tr style="background-color:#A3E0FF;">' +
'<td>' + PDX.Code + '</td>' +
'<td>' + PDX.Name + '</td>'
FROM Production.dbo.[Portland$Dimension Value] as PDX
LEFT JOIN SQLAdministration.dbo.DimensionValue AS SQLA ON PDX.[Dimension Code] = SQLA.[Dimension Code] COLLATE Latin1_General_100_CS_AS and PDX.Code = SQLA.Code COLLATE Latin1_General_100_CS_AS
WHERE PDX.[Dimension Code] = 'OFFICE'
AND SQLA.Code IS NULL


SET @tableHTML = 
--N'<H3><font color="Red">New Navigator Office Codes</H3>' +
--N'<table border="1" align="center" cellpadding="2" cellspacing="0" style="color:purple;font-family:arial,helvetica,sans-serif;text-align:center;" >' +
N'<tr style ="font-size: 14px;font-weight: normal;background: #b9c9fe;text-align:left;">
<th>Code</th>
<th>Name</th>
</tr>' + @Table +	N'</table>' 


EXEC msdb.dbo.sp_send_dbmail @recipients='tpeters@mercycorps.org',
@subject = @subject,
@body = @tableHTML,
@body_format = 'HTML' ;