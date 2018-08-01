itle Restore Shaiya Databases - WARNING: DO NOT CLOSE WINDOW!
if exist ..\DATABASE goto SQL_RESTORE
mkdir "..\DATABASE"
echo.

:SQL_RESTORE
echo Restore Database
start /WAIT batch\shaiya_db_restore PSM_Data

PAUSE