/*
CheckDB
Dynamic SQL script to loop through all databases using sp_MSforeachdb and run DBCC CHECKDB

20160211 - Documentation updates
*/

EXEC sp_MSforeachdb 'DECLARE @riError INT , @DBName VARCHAR(100)
	IF ''?'' <> ''tempdb''
	BEGIN 
		USE ? DBCC CHECKDB WITH NO_INFOMSGS
		SET @riError = @@ERROR 
		SET @DBName = ''?''
		IF @riError <> 0 
			IF EXISTS (SELECT 1 FROM Master..SysMessages WHERE Error = @riError)
     			INSERT SQLAdministration..DBCCErrorLog  (ServerName, DatabaseName, JobType, ErrorNumber, Severity, ErrorDescription, ErrorDate)
    			SELECT @@SERVERNAME, @DBName, ''DBCC CHECKDB'',@riError, Severity, [Description], GETDATE()
    			FROM Master..SysMessages
    			WHERE Error = @riError AND msglangid = 1033 --Display error in English 
			ELSE
     			INSERT SQLAdministration..DBCCErrorLog  (ServerName, DatabaseName, JobType, ErrorNumber, Severity, ErrorDescription, ErrorDate)
    			SELECT @@SERVERNAME, @DBName, ''DBCC CHECKDB'', @riError, ''0'', ''Non System Error'', GETDATE()
  		ELSE
			BEGIN
				INSERT SQLAdministration..DBCCErrorlog (ServerName, DatabaseName, JobType, ErrorNumber, Severity, ErrorDescription, ErrorDate)
				SELECT @@SERVERNAME, @DBName, ''DBCC CHECKDB'', 0, 0, ''SUCCESS'',GETDATE()
			END
  		END
  		'